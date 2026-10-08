# Meal Plan Agent — multi-agent pipeline

## What this is

A graph-orchestrated multi-agent pipeline (Python + **LangGraph**) that composes
a weekly dinner plan from **this week's actual ICA offers** and free-text
preferences in Swedish — optimising for **maximum deal coverage** and
**minimum fresh-food waste**:

> *"Vi är 4 personer, en laktosintolerant, vi gillar inte fisk, max 600 kr, 5 middagar"*
> → weekly menu + aggregated shopping list + waste report + cost estimate

The design principle: **deterministic code owns the numbers, the agents own the
flow.** Optimisation, constraint checking and waste math are plain Python;
the agents orchestrate, verify and escalate. The whole pipeline runs fully
offline against fixtures — an LLM is a pluggable enhancement, not a dependency.

## The agent graph

![Agent graph](images/agentgraf.svg)

| Node | Role |
|---|---|
| `parse_preferences` | Free text (Swedish) → `ConstraintSpec` — portions, meals, budget, diet, allergies, dislikes, max cook time. Rule-based parser by default; OpenAI structured output when `MEAL_AGENT_LLM=openai`. |
| `fetch_deals` | `DealsProvider` → `Deal[]`. `FixtureDeals` (deterministic default) or `IcaLiveDeals` (live offers via the same public gateway the ICA frontend uses). |
| `fetch_recipes` | `RecipeProvider` → `Recipe[]` (Swedish everyday dishes). |
| `plan` | Calls the optimizer: hard filters (allergens/diet/dislikes/time) → greedy selection + swap improvement over `deal_grams − 0.5·waste − w·cost`. |
| `critique` | Verifies the plan against all constraints. Violations → recipes blacklisted, replan; budget breach → cost weight ×3 escalation. Warnings are reported honestly. |
| `human_review` | *(optional HITL)* The graph **pauses** via `interrupt()` + checkpointer and waits for human approval. Rejection loops back to `plan`; feedback naming a dish blacklists it. |
| `finish` | Builds `MealPlan`: menu, aggregated shopping list, waste report. |

Orchestration is a LangGraph `StateGraph` with **conditional routing** — the
`critique → plan` edge is data-driven (violations in state), not a hardcoded
loop. Bounded by `MAX_ITERATIONS`; when a target is impossible the critic
reports a warning instead of looping forever.

## Human-in-the-loop, on and off

The same graph runs both ways — a checkbox/`--hitl` flag inserts the
`human_review` node between `critique` and `finish`:

- **Without HITL:** `critique ok → finish`, fully automatic.
- **With HITL:** `critique ok → human_review`, graph suspends (`interrupt()`
  + `MemorySaver` checkpoint). Approving resumes to `finish`; rejecting
  replans with the human's feedback folded into state.

![Paused at human_review](images/hitl-paused-approval.png)

The resume path is a second SSE stream (`/api/plan/resume`) that continues the
*same* checkpointed run — the agent trace shows `human_review` as a real node
with `beslut: approved`:

![Approved, trace shows the decision](images/hitl-approved-trace.png)

## Why the design choices matter

- **Provider abstraction + DI** — the same graph runs fixtures in tests and
  live ICA in production. The unofficial ICA endpoints are isolated behind
  `DealsProvider`, so when they change, only one file breaks.
- **Zero-LLM baseline** — everything works offline; an LLM would improve the
  parser and product→ingredient mapping but never owns the math.
- **Critic loop with escalation** — not just "try again": the critic feeds
  structured feedback (blacklist, parameter changes) that alters the planner's
  behaviour next iteration. An impossible budget yields an honest warning,
  not an infinite loop.
- **Deterministic optimisation** — waste and cost are computed exactly
  (per-package `pack_g`, perishable flags), not guessed by a model.
- **Pydantic contracts between nodes** — every message in state is validated
  and serialisable, which is what makes SSE streaming, checkpoints and the
  agent trace possible.

## Live ICA integration

`IcaLiveDeals` uses the same public gateway as ica.se's own frontend:

1. `handla.ica.se/api/store/v1` — the store registry (354 stores)
2. `ica.se/e11/public-access-token` — anonymous Bearer token
3. `apim-pub.gw.ica.se/sverige/digx/offerreader/v1/offers/store/{id}` — the
   store's weekly offers

Product names are mapped to canonical ingredients with regex hints —
deliberately rough, and the natural place for an LLM node in a next iteration.
Live runs typically land at 25–60 % deal coverage, which the critic flags
honestly rather than hiding.

## Screenshots

**Run start** — live ICA offers from the user's real store, `parse_preferences`
extracting a `ConstraintSpec` while the SSE stream animates the pipeline:

![Running, parse_preferences active](images/run-parse-live-ica.png)

**Critic evaluating** — every node produces structured state visible in the
agent trace:

![Critic active](images/run-critique-live.png)

**Result** — weekly menu with deal tags, total cost KPI, coverage/waste stats:

![Menu + KPI](images/result-menu-kpi.png)

**Aggregated shopping list** — need vs. package count per item:

![Shopping list](images/result-shopping.png)

**Waste model** — only perishables count as waste:

![Waste tab](images/result-waste.png)

**Full agent trace** — every node's raw output, auditable:

![Agent trace](images/result-agent-trace.png)

## The code

The critic node + conditional routing — the part that makes this
multi-agent rather than a single call:

![Critique node and routing](images/code_critique.png)

## Stack

Python 3.13 · LangGraph (StateGraph, conditional edges, `interrupt`,
checkpointer) · Pydantic · FastAPI + SSE · vanilla JS frontend · pytest

## Repo layout

Full source lives in its own repository (`meal-plan-agent`):
`meal_agent/` — `graph.py` (nodes + routing), `optimizer.py` (selection +
waste math), `models.py` (pydantic contracts), `providers/` (fixtures +
live ICA), `web.py` (FastAPI + SSE), `static/index.html`, `tests/`,
`tools/` (asset generators for the diagrams above).
