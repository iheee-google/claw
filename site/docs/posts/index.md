# 文章列表

<div class="post-grid">
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/ai-build-site-8-lessons">和 AI 一起搭站，我学到的 8 件事</a></h3>
  <div class="post-desc">1. 先做可回退，再做优化。 2. 内容结构比花哨样式更重要。 3. 一次只改一层，问题更容易定位。 4. 每一步提交，回滚才有抓手。 5. 线上验证要看真实访问路径。 6. 自动…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/ai-site-retro-detail">这几天和 AI 一起搭站：从混乱到可持续输出（细节版复盘）</a></h3>
  <div class="post-desc">这几天我和 AI 一起把网站从 0 搭到可公网访问，再到可以持续写作。过程中踩了不少坑，但每个坑都换来一条更稳的工作习惯。下面这篇不是“励志文”，而是我真实的操作复盘。 ## 1）…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/empty-output-reliability-checklist">从空输出到可控输出：消息可靠性改造清单</a></h3>
  <div class="post-desc">看起来最小的问题，往往最伤体验：消息发了但正文为空。 ## 常见触发点 - 长任务阻塞导致回复提交时机混乱 - 并发消息覆盖，正文未正确落地 ## 改造清单 - 发送前非空校验 -…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/git-push-failure-postmortem">Git 推送失败复盘：为什么“先说成功”是高风险动作</a></h3>
  <div class="post-desc">一次关键教训：在没有看到 push 成功原始输出前，任何“已同步”都不该说出口。 ## 问题过程 - 存在远端快进保护，直接 push 失败 - 若先口头宣称成功，会造成状态错判 …</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/hooks-governance-official-first">Hooks 治理复盘：为什么要优先用官方内置能力</a></h3>
  <div class="post-desc">在自动化流程里，能用官方内置 hooks，就尽量别先上自定义脚本。 ## 实践结论 - 统一启用官方 internal hooks（boot-md / bootstrap-extr…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/long-task-silence-is-worse-than-errors">一次教训：长任务静默比报错更伤体验</a></h3>
  <div class="post-desc">很多人以为“只要最后做成了就行”，但真实体验是：长任务中间没反馈，用户会更焦虑。 ## 现象 执行重启、部署、批量修改时，如果超过 10 秒无回执，用户会反复追问“卡住了吗”。 #…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/migration-retro">WordPress 到 VitePress 迁移复盘</a></h3>
  <div class="post-desc">## 为什么迁移 - WordPress 对轻内容站点来说维护成本偏高。 ## 做对了什么 - 先完整备份（文件 + 数据库 + Nginx） - 再切流到 VitePress -…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/openclaw-wordpress-backup-practice">OpenClaw + WordPress：把“能跑”变成“稳跑”的备份实践</a></h3>
  <div class="post-desc">这篇记录我在云服务器上为 WordPress 做自动备份的完整实践：不仅要“备份成功”，还要“可恢复、可追踪、可持续”。 ## 目标 - 每天自动备份数据库和 uploads - …</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/restart-handle-lost-fast-fallback">开发报错实录：重启句柄丢失时，如何快速止损并完成交付</a></h3>
  <div class="post-desc">这是一次典型线上故障：执行重启后会话句柄丢失，状态查询断掉。如果继续死等，只会让任务无限拖长。 ## 错误表现 - 重启命令已发出，但轮询会话找不到有效句柄 - 状态命令返回不稳定…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/subagent-paused-under-low-rpm">子 Agent 暂缓决策：在低配额下为什么串行更稳</a></h3>
  <div class="post-desc">这篇记录一个很实用的决策：在请求配额偏低（每分钟 4 次）的阶段，子 Agent 并发并不一定更快，反而可能放大超时与排队。 ## 当时背景 我们评估过并发子 Agent 方案，但…</div>
</article>
<article class="post-card">
  <span class="post-tag">复盘</span>
  <h3><a href="/posts/why-long-tasks-need-progress-updates">一次真实复盘：为什么长任务必须分阶段汇报</a></h3>
  <div class="post-desc">这篇是对近期搭站过程的真实复盘。技术问题并不可怕，可怕的是执行过程“静默”。 ## 问题现象 当任务超过十几秒没有反馈，人的感受不是“你在忙”，而是“你是不是卡住了”。 ## 关键…</div>
</article>
</div>
