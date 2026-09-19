"""Generate images/Northwind_Architecture.png — the agent-crew architecture diagram.

Usage: python generate_architecture.py
"""
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

ACCENT = "#2563eb"
ACCENT_BG = "#eef2ff"
LLM = "#7c3aed"
LLM_BG = "#f5f3ff"
BORDER = "#c9d2e0"
SURFACE = "#ffffff"
MUTED = "#6b7280"
TEXT = "#111827"

fig, ax = plt.subplots(figsize=(14, 8.4), dpi=110)
fig.patch.set_facecolor(SURFACE)
ax.set_xlim(0, 14)
ax.set_ylim(0, 8.4)
ax.axis("off")


def box(x, y, w, h, label, sub="", fill=SURFACE, edge=BORDER, dashed=False, label_color=TEXT):
    ax.add_patch(FancyBboxPatch(
        (x, y), w, h,
        boxstyle="round,pad=0.06,rounding_size=0.12",
        facecolor=fill, edgecolor=edge, linewidth=1.6,
        linestyle="--" if dashed else "-",
    ))
    if sub:
        ax.text(x + w / 2, y + h * 0.68, label, ha="center", va="center",
                fontsize=9.5, fontweight="bold", color=label_color)
        ax.text(x + w / 2, y + h * 0.28, sub, ha="center", va="center",
                fontsize=7.5, color=MUTED)
    else:
        ax.text(x + w / 2, y + h / 2, label, ha="center", va="center",
                fontsize=10, fontweight="bold", color=label_color)


def arrow(x1, y1, x2, y2, color=MUTED, connectionstyle="arc3,rad=0", dashed=False):
    ax.add_patch(FancyArrowPatch(
        (x1, y1), (x2, y2),
        arrowstyle="-|>", mutation_scale=14,
        color=color, linewidth=1.4, connectionstyle=connectionstyle,
        linestyle="--" if dashed else "-",
    ))


ax.text(7, 8.15, "Northwind agent crew — architecture", ha="center",
        fontsize=15, fontweight="bold", color=TEXT)
ax.text(7, 7.82, "deterministic Python owns the numbers — the LLM owns the narrative",
        ha="center", fontsize=9.5, color=MUTED)

# Orchestrator: a supervising frame around the whole crew
frame = FancyBboxPatch(
    (0.3, 2.5), 13.4, 4.45,
    boxstyle="round,pad=0.06,rounding_size=0.15",
    facecolor="#f8fafc", edgecolor=ACCENT, linewidth=1.8, linestyle="--",
)
ax.add_patch(frame)
ax.text(7, 6.62, "Orchestrator — supervises every agent in the run", ha="center",
        fontsize=11, fontweight="bold", color=ACCENT)
ax.text(7, 6.32,
        "per-run events: agent started/finished/failed + durations  →  audit_trail.jsonl · pipeline_health.json · injects run_id + agent_sequence",
        ha="center", fontsize=8, color=MUTED)

W, H, GAP, X0 = 2.2, 1.0, 0.5, 0.55
Y1, Y2 = 4.9, 3.0

# Row 1 flows left -> right
row1 = [
    ("DataLoaderAgent", "reads csv/"),
    ("DataModelingAgent", "star schema"),
    ("ModelAgent", "score + segments"),
    ("CRMCustomer\nProfileAgent", "RFM · churn · NBA"),
    ("AnalysisAgent", "summary stats"),
]
for i, (name, sub) in enumerate(row1):
    box(X0 + i * (W + GAP), Y1, W, H, name, sub)
    if i:
        arrow(X0 + i * (W + GAP) - GAP, Y1 + H / 2, X0 + i * (W + GAP), Y1 + H / 2)

# Row 2 snakes right -> left: AnalysisAgent drops straight into InsightAgent
row2 = [  # visual order left -> right; flow runs right -> left
    ("DocumentationAgent", "docs + narrative", "doc"),
    ("BIExportAgent", "bi_export.csv", "export"),
    ("LLMInsightAgent", "exec narrative (LLM)", "llm"),
    ("FlowAnalysisAgent", "why — revenue drivers", "new"),
    ("InsightAgent", "top-N", "plain"),
]
for i, (name, sub, kind) in enumerate(row2):
    fill = {"new": ACCENT_BG, "llm": LLM_BG}.get(kind, SURFACE)
    edge = {"new": ACCENT, "llm": LLM}.get(kind, BORDER)
    color = {"new": ACCENT, "llm": LLM}.get(kind, TEXT)
    box(X0 + i * (W + GAP), Y2, W, H, name, sub, fill=fill, edge=edge, label_color=color)

for i in range(len(row2) - 1):
    x_right_edge_of_left_flow = X0 + (len(row2) - 1 - i) * (W + GAP)
    arrow(x_right_edge_of_left_flow, Y2 + H / 2, x_right_edge_of_left_flow - GAP, Y2 + H / 2)

# AnalysisAgent (rightmost row1) drops straight down into InsightAgent (rightmost row2)
arrow(X0 + 4 * (W + GAP) + W / 2, Y1, X0 + 4 * (W + GAP) + W / 2, Y2 + H)

# Outputs (written by BIExportAgent and DocumentationAgent — both on the left half of row 2)
box(0.55, 0.45, 7.4, 1.3, "Outputs",
    "bi_export.csv · customer_profiles.csv · flow_analysis.json\npipeline_documentation.md · semantic_model.json",
    fill="#f8fafc")
box(9.35, 0.45, 4.1, 1.3, "QueryAgent",
    "tool calls over the exports\nquestion + tools → question_log.jsonl",
    fill=LLM_BG, edge=LLM, label_color=LLM)

doc_cx = X0 + W / 2           # DocumentationAgent centre x
bi_cx = X0 + (W + GAP) + W / 2  # BIExportAgent centre x
arrow(doc_cx, Y2, doc_cx, 1.75)
arrow(bi_cx, Y2, bi_cx, 1.75)

# QueryAgent reads the exports
arrow(7.95, 1.1, 9.35, 1.1, dashed=True)

# Legend
ax.add_patch(FancyBboxPatch((9.6, 7.72), 0.28, 0.2,
             boxstyle="round,pad=0.02", facecolor=ACCENT_BG, edgecolor=ACCENT, linewidth=1.2))
ax.text(10.0, 7.82, "new in v2", fontsize=8.5, color=MUTED, va="center")
ax.add_patch(FancyBboxPatch((11.2, 7.72), 0.28, 0.2,
             boxstyle="round,pad=0.02", facecolor=LLM_BG, edgecolor=LLM, linewidth=1.2))
ax.text(11.6, 7.82, "LLM-powered", fontsize=8.5, color=MUTED, va="center")

plt.tight_layout()
plt.savefig("images/Northwind_Architecture.png", dpi=110,
            bbox_inches="tight", facecolor=SURFACE)
print("wrote images/Northwind_Architecture.png")
