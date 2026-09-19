"""Orchestration layer for the agent crew.

The Orchestrator plays the "OrchestratorAgent" role as a supervising layer
around the crew rather than an agent in the chain: it runs agents
sequentially, emits audit events to a JSONL trail, injects the agent
sequence into the pipeline data, and writes a pipeline-health summary
after each run.
"""

import json
import logging
import os
import time
import uuid
from datetime import datetime, timezone
from typing import Any, Dict, List

logger = logging.getLogger(__name__)


class Orchestrator:
    def __init__(self, agents: List[Any],
                 audit_log_path: str = "output/audit_trail.jsonl",
                 health_path: str = "output/pipeline_health.json"):
        self.agents = agents
        self.audit_log_path = audit_log_path
        self.health_path = health_path
        self.run_id = uuid.uuid4().hex[:12]
        self.logger = logging.getLogger("Orchestrator")

    def _emit(self, event: str, agent: str = None, **fields) -> None:
        record = {
            "ts": datetime.now(timezone.utc).isoformat(timespec="milliseconds"),
            "run_id": self.run_id,
            "event": event,
        }
        if agent:
            record["agent"] = agent
        record.update(fields)
        try:
            os.makedirs(os.path.dirname(self.audit_log_path), exist_ok=True)
            with open(self.audit_log_path, "a", encoding="utf-8") as fh:
                fh.write(json.dumps(record, default=str) + "\n")
        except OSError:
            self.logger.exception("Failed writing audit event '%s'", event)

    def _write_health(self, status: str, started_at: datetime,
                      agents_meta: List[Dict[str, Any]],
                      extra: Dict[str, Any] = None) -> None:
        finished_at = datetime.now(timezone.utc)
        health = {
            "run_id": self.run_id,
            "status": status,
            "started_at": started_at.isoformat(timespec="milliseconds"),
            "finished_at": finished_at.isoformat(timespec="milliseconds"),
            "duration_s": round((finished_at - started_at).total_seconds(), 3),
            "agent_count": len(self.agents),
            "agents": agents_meta,
        }
        if extra:
            health.update(extra)
        try:
            os.makedirs(os.path.dirname(self.health_path), exist_ok=True)
            with open(self.health_path, "w", encoding="utf-8") as fh:
                json.dump(health, fh, indent=2)
        except OSError:
            self.logger.exception("Failed writing pipeline health")

    def run(self, initial_input: Dict[str, Any] = None) -> Dict[str, Any]:
        data = dict(initial_input or {})
        data["run_id"] = self.run_id
        data["agent_sequence"] = [a.name for a in self.agents]

        started_at = datetime.now(timezone.utc)
        agents_meta: List[Dict[str, Any]] = []
        self._emit("pipeline_started", agents=data["agent_sequence"])

        for agent in self.agents:
            meta: Dict[str, Any] = {"name": agent.name}
            self.logger.info(f"Running agent: {agent.name}")
            self._emit("agent_started", agent.name)
            t0 = time.perf_counter()
            try:
                data = agent.run(data) or {}
                meta["status"] = "ok"
            except Exception as e:
                meta["status"] = "failed"
                meta["error"] = str(e)
                meta["duration_s"] = round(time.perf_counter() - t0, 3)
                agents_meta.append(meta)
                self._emit("agent_failed", agent.name, error=str(e),
                           duration_s=meta["duration_s"])
                self._emit("pipeline_finished", status="failed",
                           failed_agent=agent.name)
                self._write_health("failed", started_at, agents_meta)
                self.logger.exception(f"Agent {agent.name} failed: {e}")
                raise
            meta["duration_s"] = round(time.perf_counter() - t0, 3)
            if isinstance(data.get("rows"), list):
                meta["rows_out"] = len(data["rows"])
            agents_meta.append(meta)
            self._emit("agent_finished", agent.name,
                       duration_s=meta["duration_s"],
                       output_keys=sorted(data.keys()))

        self._emit("pipeline_finished", status="ok")
        self._write_health("ok", started_at, agents_meta,
                           {"narrative_check": data.get("narrative_check")})
        return data


# Backwards-compatible name for the previous sequential runner.
AgentCrew = Orchestrator
