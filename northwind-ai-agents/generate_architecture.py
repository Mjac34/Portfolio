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

fig, ax = plt.subplots(figsize=(14, 8.6), dpi=110)
fig.patch.set_facecolor(SURFACE)
ax.set_xlim(0, 14)
ax.set_ylim(0, 8.6)
ax.axis("off")


def box(x, y, w, h, label, sub="", fill=SURFACE, edge=BORDER, label_color=TEXT, fontsize=9.5):
    ax.add_patch(FancyBboxPatch(
        (x, y), w, h,
        boxstyle="round,pad=0.06,rounding_size=0.12",
        facecolor=fill, edgecolor=edge, linewidth=1.6,
    ))
    if sub:
        ax.text(x + w / 2, y + h * 0.68, label, ha="center", va="center",
                fontsize=fontsize, fontweight="bold", color=label_color, linespacing=1.1)
        ax.text(x + w / 2, y + h * 0.18, sub, ha="center", va="center",
                fontsize=7.5, color=MUTED)
    else:
        ax.text(x + w / 2, y + h / 2, label, ha="center", va="center",
                fontsize=fontsize, fontweight="bold", color=label_color)


def arrow(x1, y1, x2, y2, color=MUTED, dashed=False):
    ax.add_patch(FancyArrowPatch(
        (x1, y1), (x2, y2),
        arrowstyle="-|>", mutation_scale=14,
        color=color, linewidth=1.4,
        linestyle="--" if dashed else "-",
    ))


ax.text(7, 8.35, "Northwind agent crew — architecture", ha="center",
        fontsize=15, fontweight="bold", color=TEXT)
ax.text(7, 8.02, "eleven sequential pipeline agents plus a tool-calling query agent — the model owns the narrative, never the numbers",
        ha="center", fontsize=9.5, color=MUTED)

# Orchestrator: a supervising frame around the whole crew
ax.add_patch(FancyBboxPatch(
    (0.3, 2.5), 13.6, 4.7,
    boxstyle="round,pad=0.06,rounding_size=0.15",
    facecolor="#f8fafc", edgecolor=ACCENT, linewidth=1.8, linestyle="--",
))
ax.text(7, 6.82, "Orchestrator — supervises every agent in the run", ha="center",
        fontsize=11, fontweight="bold", color=ACCENT)
ax.text(7, 6.52,
        "per-run events: agent started/finished/failed + durations  →  audit_trail.jsonl · pipeline_health.json · injects run_id + agent_sequence",
        ha="center", fontsize=8, color=MUTED)

W, H = 1.9, 1.05
Y1, Y2 = 5.05, 3.1
PITCH = W + 0.4
X0 = 0.45
X_END = X0 + 5 * PITCH + W  # 13.85

# Row 1: evenly spread, rightmost aligned with row 2's rightmost
R1_GAP = (X_END - X0 - 5 * W) / 4
row1 = [
    ("DataLoader\nAgent", "reads csv/"),
    ("DataModeling\nAgent", "star schema"),
    ("ModelAgent", "score + segments"),
    ("CRMCustomer\nProfileAgent", "RFM · churn · NBA"),
    ("AnalysisAgent", "summary stats"),
]
for i, (name, sub) in enumerate(row1):
    x = X0 + i * (W + R1_GAP)
    box(x, Y1, W, H, name, sub)
    if i:
        arrow(x - R1_GAP, Y1 + H / 2, x, Y1 + H / 2)

# Row 2 snakes right -> left: AnalysisAgent drops straight into InsightAgent
row2 = [  # visual order left -> right; flow runs right -> left
    ("Documentation\nAgent", "docs + narrative", "plain"),
    ("BIExport\nAgent", "bi_export.csv", "export"),
    ("NarrativeCheck\nAgent", "verifies every figure", "new"),
    ("LLMInsight\nAgent", "exec narrative", "llm"),
    ("FlowAnalysis\nAgent", "why — revenue drivers", "new"),
    ("InsightAgent", "top-N", "plain"),
]
for i, (name, sub, kind) in enumerate(row2):
    x = X0 + i * PITCH
    box(x, Y2, W, H, name, sub,
        fill={"new": ACCENT_BG, "llm": LLM_BG}.get(kind, SURFACE),
        edge={"new": ACCENT, "llm": LLM}.get(kind, BORDER),
        label_color={"new": ACCENT, "llm": LLM}.get(kind, TEXT))
    if i:
        arrow(x + W + 0.4, Y2 + H / 2, x + W, Y2 + H / 2)

# AnalysisAgent (rightmost row1) drops straight down into InsightAgent (rightmost row2)
arrow(X0 + 5 * PITCH + W / 2, Y1, X0 + 5 * PITCH + W / 2, Y2 + H)

# Outputs (written by BIExportAgent and DocumentationAgent — left half of row 2)
box(0.45, 0.45, 7.5, 1.35, "Outputs",
    "bi_export.csv · customer_profiles.csv · flow_analysis.json · narrative_check.json\npipeline_documentation.md · semantic_model.json",
    fill="#f8fafc")
box(9.45, 0.45, 4.4, 1.35, "QueryAgent",
    "tool calls over the exports\nquestion + tools → question_log.jsonl",
    fill=LLM_BG, edge=LLM, label_color=LLM)

arrow(X0 + W / 2, Y2, X0 + W / 2, 1.8)                    # DocumentationAgent -> Outputs
arrow(X0 + PITCH + W / 2, Y2, X0 + PITCH + W / 2, 1.8)    # BIExportAgent -> Outputs

# QueryAgent reads the exports
arrow(7.95, 1.12, 9.45, 1.12, dashed=True)

# Legend (below the subtitle, above the frame)
ax.add_patch(FancyBboxPatch((5.5, 7.35), 0.28, 0.2,
             boxstyle="round,pad=0.02", facecolor=ACCENT_BG, edgecolor=ACCENT, linewidth=1.2))
ax.text(5.9, 7.45, "new in v2", fontsize=8.5, color=MUTED, va="center")
ax.add_patch(FancyBboxPatch((7.1, 7.35), 0.28, 0.2,
             boxstyle="round,pad=0.02", facecolor=LLM_BG, edgecolor=LLM, linewidth=1.2))
ax.text(7.5, 7.45, "LLM-powered", fontsize=8.5, color=MUTED, va="center")

plt.tight_layout()
plt.savefig("images/Northwind_Architecture.png", dpi=110,
            bbox_inches="tight", facecolor=SURFACE)
print("wrote images/Northwind_Architecture.png")
