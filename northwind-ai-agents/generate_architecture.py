"""Generate images/Northwind_Architecture.png — the agent-crew architecture diagram.

Usage: python generate_architecture.py
"""
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

ACCENT = "#2563eb"
ACCENT_BG = "#eef2ff"
BORDER = "#c9d2e0"
SURFACE = "#ffffff"
MUTED = "#6b7280"
TEXT = "#111827"

fig, ax = plt.subplots(figsize=(14, 8.2), dpi=110)
fig.patch.set_facecolor(SURFACE)
ax.set_xlim(0, 14)
ax.set_ylim(0, 8.2)
ax.axis("off")


def box(x, y, w, h, label, sub="", fill=SURFACE, edge=BORDER, dashed=False, label_color=TEXT):
    ax.add_patch(FancyBboxPatch(
        (x, y), w, h,
        boxstyle="round,pad=0.06,rounding_size=0.12",
        facecolor=fill, edgecolor=edge, linewidth=1.6,
        linestyle="--" if dashed else "-",
    ))
    if sub:
        ax.text(x + w / 2, y + h * 0.66, label, ha="center", va="center",
                fontsize=10, fontweight="bold", color=label_color)
        ax.text(x + w / 2, y + h * 0.3, sub, ha="center", va="center",
                fontsize=8, color=MUTED)
    else:
        ax.text(x + w / 2, y + h / 2, label, ha="center", va="center",
                fontsize=10, fontweight="bold", color=label_color)


def arrow(x1, y1, x2, y2, color=MUTED, connectionstyle="arc3,rad=0"):
    ax.add_patch(FancyArrowPatch(
        (x1, y1), (x2, y2),
        arrowstyle="-|>", mutation_scale=14,
        color=color, linewidth=1.4, connectionstyle=connectionstyle,
    ))


ax.text(7, 7.95, "Northwind agent crew — architecture", ha="center",
        fontsize=15, fontweight="bold", color=TEXT)
ax.text(7, 7.62, "deterministic Python owns the numbers — the LLM owns the narrative",
        ha="center", fontsize=9.5, color=MUTED)

# Orchestrator layer
box(0.5, 6.35, 13, 0.95, "Orchestrator",
    "per-run events: agent started/finished/failed + durations  →  audit_trail.jsonl · pipeline_health.json · injects run_id + agent_sequence",
    fill="#f8fafc", edge=ACCENT, dashed=True, label_color=ACCENT)

row1 = [
    ("DataLoaderAgent", "reads csv/"),
    ("DataModelingAgent", "star schema"),
    ("ModelAgent", "score + segments"),
    ("CRMProfileAgent", "RFM · churn · NBA"),
    ("AnalysisAgent", "summary stats"),
]
row2 = [
    ("InsightAgent", "top-N", False),
    ("FlowAnalysisAgent", "why — revenue drivers", True),
    ("LLMInsightAgent", "exec narrative (LLM)", False),
    ("BIExportAgent", "bi_export.csv", False),
    ("DocumentationAgent", "docs + narrative", False),
]

W, H, GAP, X0 = 2.2, 1.0, 0.5, 0.5
Y1, Y2 = 4.7, 2.75

for i, (name, sub) in enumerate(row1):
    box(X0 + i * (W + GAP), Y1, W, H, name, sub)
    if i:
        arrow(X0 + i * (W + GAP) - GAP, Y1 + H / 2, X0 + i * (W + GAP), Y1 + H / 2)

for i, (name, sub, is_new) in enumerate(row2):
    box(X0 + i * (W + GAP), Y2, W, H, name, sub,
        fill=ACCENT_BG if is_new else SURFACE,
        edge=ACCENT if is_new else BORDER,
        label_color=ACCENT if is_new else TEXT)
    if i:
        arrow(X0 + i * (W + GAP) - GAP, Y2 + H / 2, X0 + i * (W + GAP), Y2 + H / 2)

# wrap arrow row1 -> row2
arrow(X0 + 4 * (W + GAP) + W / 2, Y1, X0 + W / 2, Y2 + H,
      connectionstyle="arc3,rad=0.35")

# orchestrator -> crew
arrow(7, 6.35, 7, Y1 + H)

# outputs
box(0.5, 0.45, 8.0, 1.35, "Outputs",
    "bi_export.csv · customer_profiles.csv · flow_analysis.json\npipeline_documentation.md · semantic_model.json",
    fill="#f8fafc")
box(9.3, 0.45, 4.2, 1.35, "QueryAgent",
    "tool calls over the exports\nquestion + tools → question_log.jsonl",
    fill="#f8fafc")

arrow(6.8, Y2, 4.5, 1.8, connectionstyle="arc3,rad=0.1")
arrow(11.0, Y2, 11.4, 1.8, connectionstyle="arc3,rad=-0.1")

# legend
ax.add_patch(FancyBboxPatch((10.1, 7.62), 0.28, 0.22,
             boxstyle="round,pad=0.02", facecolor=ACCENT_BG, edgecolor=ACCENT, linewidth=1.2))
ax.text(10.5, 7.73, "added: FlowAnalysisAgent + observability layer",
        fontsize=8.5, color=MUTED, va="center")

plt.tight_layout()
plt.savefig("images/Northwind_Architecture.png", dpi=110,
            bbox_inches="tight", facecolor=SURFACE)
print("wrote images/Northwind_Architecture.png")
