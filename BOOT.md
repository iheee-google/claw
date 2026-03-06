# BOOT.md

当网关启动完成后，执行以下动作（仅一次）：

1. 获取当前 Asia/Shanghai 时间。
2. 使用 `message` 工具发送一条 Feishu 私聊消息到用户：`user:ou_2a61b491c5e0fe25dbedd3a85551b5b3`。
   - action: send
   - channel: feishu
   - accountId: default
   - target: user:ou_2a61b491c5e0fe25dbedd3a85551b5b3
   - message: `重启成功 ✅（${time}）`
3. 若发送失败，重试最多 3 次（间隔 3 秒）。
4. 除上述通知外，不执行任何额外外发动作。
