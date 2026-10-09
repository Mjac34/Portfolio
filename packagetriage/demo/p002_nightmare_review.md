# Review: p002_nightmare

8 warn, 5 info

| Severity | Rule | Object | Message |
|---|---|---|---|
| warn | `circular_flow` | ForEach File -> Run Child Package -> Legacy Script -> Set Variables -> ForEach File | Circular precedence — control flow loops back (must be broken or is intentionally retriggered) |
| warn | `conditional_precedence` | Legacy Script -> Set Variables | Precedence uses expression/evaluation — flow depends on runtime outcome |
| warn | `dynamic_sql` | ForEach File.Dynamic Load | SQL source is not DirectInput — statement built at runtime (source: Variable) |
| warn | `exec_package` | Run Child Package | Executes child package — cross-package dependency must be resolved in the target |
| warn | `expression_driven` | Set Variables | Driven by SSIS expression(s) (1) — runtime values are not statically known |
| warn | `external_integration` | FTP Download | Task type 'Microsoft.FtpTask' touches systems outside SQL — needs an orchestrator equivalent |
| warn | `loop_container` | ForEach File | Loop container — iteration semantics must map to the target orchestrator |
| warn | `script_component` | Legacy Script | Script task — embedded .NET code cannot be auto-migrated; rewrite required |
| info | `disabled_task` | Old Disabled Step | Disabled — dead weight or feature flag? |
| info | `orphan_task` | Custom Vendor Task | No precedence in or out — entry point or dead task? |
| info | `orphan_task` | FTP Download | No precedence in or out — entry point or dead task? |
| info | `orphan_task` | ForEach File.Dynamic Load | No precedence in or out — entry point or dead task? |
| info | `orphan_task` | Old Disabled Step | No precedence in or out — entry point or dead task? |

## Not migrated

Constructs observed in the source that cannot be migrated automatically — require a human decision.

| Severity | Object | Message |
|---|---|---|
| warn | Custom Vendor Task | task type 'VendorCo.MagicTask' not specifically handled — structure recorded, semantics unknown |

## Proposals (AI/mock)

Proposals — reviewed, never auto-accepted. Verification is code.

| Flag | Object | Proposal | Verify |
|---|---|---|---|
| `circular_flow` | ForEach File -> Run Child Package -> Legacy Script -> Set Variables -> ForEach File | propose: break the precedence loop by ignoring the first edge (ForEach File -> Run Child P | breaks_cycle=ok; nonempty=ok |
| `conditional_precedence` | Legacy Script -> Set Variables | propose: convert the precedence expression to an explicit condition in the target orchestr | object_in_graph=not found; nonempty=ok |
| `dynamic_sql` | ForEach File.Dynamic Load | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `exec_package` | Run Child Package | propose: resolve the child package dependency — migrate it too or inline its work | object_in_graph=ok; nonempty=ok |
| `expression_driven` | Set Variables | propose: enumerate the runtime expressions and map each to a target-platform parameter | object_in_graph=ok; nonempty=ok |
| `external_integration` | FTP Download | propose: replace with the target orchestrator's equivalent (or drop if dead) | object_in_graph=ok; nonempty=ok |
| `loop_container` | ForEach File | propose: map iteration semantics to the target orchestrator's loop construct | object_in_graph=ok; nonempty=ok |
| `script_component` | Legacy Script | propose: rewrite the embedded .NET script in the target platform — extract its logic first | object_in_graph=ok; nonempty=ok |
| `not_migrated` | Custom Vendor Task | propose: review Custom Vendor Task manually — no template yet | object_in_graph=ok; nonempty=ok |
