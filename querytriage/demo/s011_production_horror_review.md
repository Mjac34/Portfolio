# Review: s011_production_horror

37 warn, 0 info

| Severity | Rule | Object | Message |
|---|---|---|---|
| warn | `circular_ref` | dbo.usp_JobA -> dbo.usp_JobB -> dbo.usp_JobA | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `circular_ref` | dbo.usp_LoopP -> dbo.usp_Night_A -> dbo.usp_Night_B -> dbo.usp_Night_C -> dbo.usp_LoopP | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `circular_ref` | dbo.usp_Sync_X -> dbo.usp_Sync_Y -> dbo.usp_Sync_X | Circular dependency — must be broken manually (no acyclic order exists) |
| warn | `deprecated_syntax` | dbo.usp_AuditTrail | Deprecated syntax: COMPUTE — must be rewritten |
| warn | `deprecated_syntax` | dbo.usp_Dead1 | Deprecated syntax: *= — must be rewritten |
| warn | `deprecated_syntax` | dbo.usp_MartSales | Deprecated syntax: SET ROWCOUNT — must be rewritten |
| warn | `deprecated_syntax` | dbo.usp_OldExport | Deprecated syntax: SET ROWCOUNT — must be rewritten |
| warn | `dynamic_sql` | dbo.usp_Dyn1 | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | dbo.usp_Dyn2 | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `dynamic_sql` | dbo.usp_Dyn3 | Dynamic SQL — static analysis cannot see the dependencies (EXEC of variable/string) |
| warn | `external_ref` | ERPCRP.Finance.dbo.GL | Linked server / 4-part name — object lives outside corpus |
| warn | `external_ref` | LEGACY.BI.dbo.Cube | Linked server / 4-part name — object lives outside corpus |
| warn | `select_star` | dbo.usp_StgSales | SELECT * — implicit column contract breaks on schema change (2 occurrence(s)) |
| warn | `select_star` | dbo.vw_AllSales | SELECT * — implicit column contract breaks on schema change (1 occurrence(s)) |
| warn | `select_star` | dbo.vw_JoinMart | SELECT * — implicit column contract breaks on schema change (1 occurrence(s)) |
| warn | `temp_dependency` | dbo.usp_StgSales | #temp table — dependency not visible in static DAG |
| warn | `unreferenced` | dbo.fn_OldLookup | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.fn_Price | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.fn_Status | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Archive | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Dead1 | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Dead2 | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Dyn1 | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Dyn2 | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Dyn3 | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Master | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_OldExport | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_Report | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.usp_SyncExt | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.vw_AuditLog | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.vw_JoinMart | No inbound references — entry point or dead code? |
| warn | `unreferenced` | dbo.vw_OldReport | No inbound references — entry point or dead code? |
| warn | `unresolvable_ref` | dbo.LitDim | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | dbo.LitSrc | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | dbo.usp_GhostJob | Referenced but has no definition in corpus |
| warn | `unresolvable_ref` | dbo.usp_RemotePurge | Referenced but has no definition in corpus |
| warn | `write_never_read` | dbo.WriteOnly | Written but never read — dead data? |

## Not migrated

Constructs observed in the source that cannot be migrated automatically — require a human decision.

| Severity | Object | Message |
|---|---|---|
| warn | dbo.usp_Dyn1 | dynamic SQL — target objects cannot be resolved statically |
| warn | dbo.usp_Dyn3 | dynamic SQL — target objects cannot be resolved statically |
| info | dbo.usp_Dead1 | object kept via regex fallback, but its structure is not fully understood |

## Proposals (AI/mock)

Proposals — reviewed, never auto-accepted. Verification is code.

| Flag | Object | Proposal | Verify |
|---|---|---|---|
| `circular_ref` | dbo.usp_JobA -> dbo.usp_JobB -> dbo.usp_JobA | propose: break the cycle by ignoring the first edge (dbo.usp_JobA -> dbo.usp_JobB -> dbo.u | breaks_cycle=ok; nonempty=ok |
| `circular_ref` | dbo.usp_LoopP -> dbo.usp_Night_A -> dbo.usp_Night_B -> dbo.usp_Night_C -> dbo.usp_LoopP | propose: break the cycle by ignoring the first edge (dbo.usp_LoopP -> dbo.usp_Night_A -> d | breaks_cycle=ok; nonempty=ok |
| `circular_ref` | dbo.usp_Sync_X -> dbo.usp_Sync_Y -> dbo.usp_Sync_X | propose: break the cycle by ignoring the first edge (dbo.usp_Sync_X -> dbo.usp_Sync_Y -> d | breaks_cycle=ok; nonempty=ok |
| `deprecated_syntax` | dbo.usp_AuditTrail | propose: rewrite deprecated constructs before migration — they do not map to modern target | object_in_graph=ok; nonempty=ok |
| `deprecated_syntax` | dbo.usp_Dead1 | propose: rewrite deprecated constructs before migration — they do not map to modern target | object_in_graph=ok; nonempty=ok |
| `deprecated_syntax` | dbo.usp_MartSales | propose: rewrite deprecated constructs before migration — they do not map to modern target | object_in_graph=ok; nonempty=ok |
| `deprecated_syntax` | dbo.usp_OldExport | propose: rewrite deprecated constructs before migration — they do not map to modern target | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | dbo.usp_Dyn1 | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | dbo.usp_Dyn2 | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `dynamic_sql` | dbo.usp_Dyn3 | propose: extract the built SQL string and resolve its targets manually — static analysis c | object_in_graph=ok; nonempty=ok |
| `external_ref` | ERPCRP.Finance.dbo.GL | propose: confirm the linked-server object exists in the target — or mark as intentional ex | object_in_graph=ok; nonempty=ok |
| `external_ref` | LEGACY.BI.dbo.Cube | propose: confirm the linked-server object exists in the target — or mark as intentional ex | object_in_graph=ok; nonempty=ok |
| `select_star` | dbo.usp_StgSales | propose: expand SELECT * to explicit columns — the column contract then survives schema ch | object_in_graph=ok; nonempty=ok |
| `select_star` | dbo.vw_AllSales | propose: expand SELECT * to explicit columns — the column contract then survives schema ch | object_in_graph=ok; nonempty=ok |
| `select_star` | dbo.vw_JoinMart | propose: expand SELECT * to explicit columns — the column contract then survives schema ch | object_in_graph=ok; nonempty=ok |
| `temp_dependency` | dbo.usp_StgSales | propose: replace #temp with a staging table or CTE so the dependency becomes visible in th | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.fn_OldLookup | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.fn_Price | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.fn_Status | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Archive | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Dead1 | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Dead2 | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Dyn1 | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Dyn2 | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Dyn3 | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Master | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_OldExport | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_Report | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.usp_SyncExt | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.vw_AuditLog | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.vw_JoinMart | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unreferenced` | dbo.vw_OldReport | propose: no inbound references — if not an entry point, drop as dead code | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | dbo.LitDim | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | dbo.LitSrc | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | dbo.usp_GhostJob | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `unresolvable_ref` | dbo.usp_RemotePurge | propose: verify whether this is a missing corpus file or genuinely external — drop if dead | object_in_graph=ok; nonempty=ok |
| `write_never_read` | dbo.WriteOnly | propose: written but never read — drop the table or confirm an external consumer | object_in_graph=ok; nonempty=ok |
| `not_migrated` | dbo.usp_Dyn1 | propose: review dbo.usp_Dyn1 manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | dbo.usp_Dyn3 | propose: review dbo.usp_Dyn3 manually — no template yet | object_in_graph=ok; nonempty=ok |
| `not_migrated` | dbo.usp_Dead1 | propose: review dbo.usp_Dead1 manually — no template yet | object_in_graph=ok; nonempty=ok |

## Ingestion assumptions

The values below are inferred, not observed — review before relying on them.

| Severity | Object | Assumption |
|---|---|---|
| info | dbo.usp_Dyn2 | parsed but no edges extracted — edges inferred via regex (confidence=inferred) |
| warn | dbo.usp_Dead1 | could not be fully parsed — edges inferred via regex (confidence=inferred) |
