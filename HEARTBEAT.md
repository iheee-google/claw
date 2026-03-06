# HEARTBEAT.md

## 记忆维护（每周一次）
读取 `memory/heartbeat-state.json`，检查 `lastMemoryMaintenance` 字段。
如果距今 >= 7 天：
1. 读最近 7 天的 `memory/YYYY-MM-DD.md` 日志
2. 提炼有价值的信息到对应文件（projects.md / lessons.md）
3. 压缩已完成一次性任务的日志为一行结论
4. 删除过期信息
5. 更新 `heartbeat-state.json` 的 `lastMemoryMaintenance` 为今天

## 每日日志缺口检查（每次心跳）
- 检查今天 `memory/YYYY-MM-DD.md` 是否存在且非空。
- 如果今天有会话活动但日志为空：立刻补写至少 1 条当日结论日志。

## 会话收口补丁（heartbeat，兜底）
- 仅在 09:00–23:00（Asia/Shanghai）执行。
- 若最近 2 小时有会话活动，且今天日志无新增：
  - 追加 1 条简洁结论到 `memory/YYYY-MM-DD.md`
  - 更新 `memory/memory-maintenance-state.json` 的 `lastRun.sessionClosePatch`
- 23:30–08:30 为静默时段：非紧急不外发提醒。
- 说明：该补丁仅作“漏写兜底”，不替代 `/new`、`/reset`、会话关闭前的强制收口钩子。
