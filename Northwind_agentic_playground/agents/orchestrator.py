"""Orchestrator for sequentially running a crew of agents.

AgentCrew runs agents in the given order and passes each agent's output to the next.
"""

import logging
from typing import Any, Dict, List

logger = logging.getLogger(__name__)

class AgentCrew:
    def __init__(self, agents: List[Any]):
        self.agents = agents
        self.logger = logging.getLogger("AgentCrew")

    def run(self, initial_input: Dict[str, Any] = None) -> Dict[str, Any]:
        data = initial_input or {}
        for agent in self.agents:
            self.logger.info(f"Running agent: {agent.name}")
            try:
                data = agent.run(data) or {}
            except Exception as e:
                self.logger.exception(f"Agent {agent.name} failed: {e}")
                raise
        return data
