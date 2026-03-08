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

## 会话收口补丁（heartbeat）
- 仅在 09:00–23:00（Asia/Shanghai）执行。
- 触发条件（必须同时满足）：
  1. 最近 2 小时有会话活动
  2. 今天日志自上次补丁后无新增
  3. 距离上次 `sessionClosePatch` 已满 2 小时（冷却时间）
- 满足后执行：
  - 追加 1 条简洁结论到 `memory/YYYY-MM-DD.md`
  - 更新 `memory/memory-maintenance-state.json` 的 `lastRun.sessionClosePatch`
- 23:30–08:30 为静默时段：非紧急不外发提醒。

## 每日总结回写（22:00 cron）
- 若 `memory/daily-summary-state.json` 显示今日已发送成功：
  - 必须在 `memory/YYYY-MM-DD.md` 追加 1 条“Daily Summary Cron”结论日志（含 sentAt/attempts/result）。
- 若发送失败：
  - 在当日日志记录失败原因与下一步补救动作。


## 三天一次：笔记回写网站（VitePress）
- 触发频率：每 3 天一次（Asia/Shanghai）。
- 数据范围：最近 3 天 `memory/YYYY-MM-DD.md` + `memory/projects.md` + `memory/lessons.md`。
- 执行动作：
  1. 提炼这三天的新增结论、复盘和可复用清单；
  2. 写入网站对应分支（`feat/vitepress-only-*`）的学习笔记模块；
  3. 提交并推送网站分支；
  4. 在当日 `memory/YYYY-MM-DD.md` 记录“已回写网站”结论与 commit 信息。
- 约束：
  - 仅同步可公开内容，隐私信息不入站；
  - 若网络/仓库异常，必须在当日日志记录失败原因与下一步补救。

