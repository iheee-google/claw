#!/usr/bin/env bash
set -euo pipefail

# 会话收口钩子：在 /new、/reset、会话关闭前执行
# 用法：
#   bash scripts/session-close-hook.sh --reason "/new" --summary "本会话主要结论"
#   bash scripts/session-close-hook.sh --reason "session-close" --summary "已完成X，待办Y"

WORKSPACE="/root/.openclaw/workspace"
MEM_DIR="$WORKSPACE/memory"
TZ="Asia/Shanghai"

reason="session-close"
summary="本会话收口：未提供摘要"
files="-"
lesson="-"
tags="#session-close #memory"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --reason)
      reason="${2:-$reason}"; shift 2 ;;
    --summary)
      summary="${2:-$summary}"; shift 2 ;;
    --files)
      files="${2:-$files}"; shift 2 ;;
    --lesson)
      lesson="${2:-$lesson}"; shift 2 ;;
    --tags)
      tags="${2:-$tags}"; shift 2 ;;
    *)
      echo "[session-close-hook] 未知参数: $1" >&2
      exit 2 ;;
  esac
done

mkdir -p "$MEM_DIR"

day=$(TZ="$TZ" date +%F)
now=$(TZ="$TZ" date +"%Y-%m-%d %H:%M:%S %z")
out="$MEM_DIR/$day.md"

cat >> "$out" <<EOF

### [PROJECT:Session Close] 会话收口（$reason）
- **Conclusion**: $summary
- **File Changes**: $files
- **Lesson**: $lesson
- **Tags**: $tags
- **Logged At**: $now
EOF

echo "[session-close-hook] 已写入: $out"
