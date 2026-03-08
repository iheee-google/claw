export default {
  title: 'iheee Notes',
  description: '学习笔记与项目复盘',
  lang: 'zh-CN',
  lastUpdated: true,
  cleanUrls: true,
  ignoreDeadLinks: true,

  vite: {
    assetsInclude: ['**/*.PNG', '**/*.JPG', '**/*.JPEG', '**/*.PDF', '**/*.DOCX', '**/*.PPTX', '**/*.XLSX']
  },
  themeConfig: {
    nav: [
      { text: '首页', link: '/' },
      { text: '快速开始', link: '/guide/getting-started' },
      { text: '文章', link: '/posts/' },
      { text: '学习笔记', link: '/learn/rag-in-action/' }
    ],
    sidebar: {
      '/guide/': [
        { text: '站点说明', link: '/guide/about-site' },
        { text: '文章索引', link: '/posts/' }
      ],

      '/learn/': [
        {
          text: 'RAG in Action（新手路径）',
          items: [
            { text: '总览', link: '/learn/rag-in-action/' },
            { text: '新手剖析视角', link: '/learn/rag-in-action/beginner-analysis' },
            { text: '项目结构总览', link: '/learn/rag-in-action/project-tree' },
            { text: '仓库文件总索引（全量）', link: '/learn/rag-in-action/repo-files/' },
            { text: '00 简单 RAG', link: '/learn/rag-in-action/00-simple-rag' },
            { text: '01 数据导入', link: '/learn/rag-in-action/01-data-loading' },
            { text: '02 文本切块', link: '/learn/rag-in-action/02-doc-chunking' },
            { text: '03 向量嵌入', link: '/learn/rag-in-action/03-embedding' },
            { text: '04 向量存储', link: '/learn/rag-in-action/04-vector-db' },
            { text: '05 检索前处理', link: '/learn/rag-in-action/05-pre-retrieval' },
            { text: '06 索引优化', link: '/learn/rag-in-action/06-indexing' },
            { text: '07 检索后处理', link: '/learn/rag-in-action/07-post-retrieval' },
            { text: '08 响应生成', link: '/learn/rag-in-action/08-generation' },
            { text: '09 系统评估', link: '/learn/rag-in-action/09-evaluation' },
            { text: '10 高级 RAG', link: '/learn/rag-in-action/10-advanced-rag' },
            { text: '术语词典', link: '/learn/rag-in-action/glossary' },
            { text: '源资料：黑悟空设定', link: '/learn/rag-in-action/materials/wukong-setting' }
          ]
        }
      ],
      '/posts/': [
        { text: '文章索引', link: '/posts/' },
        { text: '这几天和 AI 一起搭站：从混乱到可持续输出（细节版复盘）', link: '/posts/ai-site-retro-detail' },
        { text: 'OpenClaw + WordPress：把“能跑”变成“稳跑”的备份实践', link: '/posts/openclaw-wordpress-backup-practice' },
        { text: '一次真实复盘：为什么长任务必须分阶段汇报', link: '/posts/why-long-tasks-need-progress-updates' },
        { text: '子 Agent 暂缓决策：在低配额下为什么串行更稳', link: '/posts/subagent-paused-under-low-rpm' },
        { text: '一次教训：长任务静默比报错更伤体验', link: '/posts/long-task-silence-is-worse-than-errors' },
        { text: 'Hooks 治理复盘：为什么要优先用官方内置能力', link: '/posts/hooks-governance-official-first' },
        { text: '开发报错实录：重启句柄丢失时，如何快速止损并完成交付', link: '/posts/restart-handle-lost-fast-fallback' },
        { text: 'Git 推送失败复盘：为什么“先说成功”是高风险动作', link: '/posts/git-push-failure-postmortem' },
        { text: '从空输出到可控输出：消息可靠性改造清单', link: '/posts/empty-output-reliability-checklist' },
        { text: '和 AI 一起搭站，我学到的 8 件事', link: '/posts/ai-build-site-8-lessons' },
        { text: 'WordPress 到 VitePress 迁移复盘', link: '/posts/migration-retro' }
      ]
    },
    outline: { level: [2, 3], label: '本页目录' },
    docFooter: { prev: '上一篇', next: '下一篇' },
    lastUpdatedText: '最后更新',
    returnToTopLabel: '返回顶部',
    darkModeSwitchLabel: '外观',
    sidebarMenuLabel: '菜单',
    outlineTitle: '本页目录'
  }
}
