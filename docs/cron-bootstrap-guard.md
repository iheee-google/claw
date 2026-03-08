# Cron & Bootstrap Guard (2026-03-08)

## 发现
1. 22:40 左右出现 workspace 基础文件同批次刷新（AGENTS/SOUL/USER/TOOLS/IDENTITY/HEARTBEAT），来自 bootstrap-extra-files/onboarding。
2. memory 类 cron 在 feature 分支运行时，可能导致“写了本地但未推 main”或找不到 memory 文件。

## 修复
- 在所有 memory 相关 cron prompt 增加硬约束：
  - 运行前 `git checkout main`
  - 检查 `git status --short`，非空即中止并报错
  - 仅修改 memory 相关文件
  - 写入后必须 `git add/commit/push origin main`
  - push 失败必须写入 attempts 日志并给出修复命令

## 操作建议
- 网站改动仅在 `feat/vitepress-only-*`。
- 记忆维护仅在 `main`。
- 切分支前先确认工作区 clean。
