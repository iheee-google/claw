# BRANCHES.md - 分支提交内容对照规范

> 目标：避免再发生“记忆文件推到网站分支”或“网站改动推到 main”的混淆。

## 分支职责（强约束）

### `main`
只允许提交：
- 记忆与状态文件：`MEMORY.md`、`memory/**`
- 规则与身份文件：`AGENTS.md`、`SOUL.md`、`USER.md`、`IDENTITY.md`、`HEARTBEAT.md`、`TOOLS.md`
- 全局流程文档与运维记录（非网站页面改动）

禁止提交：
- 网站页面内容与样式（VitePress 站点文件）

---

### `feat/vitepress-only-*`
只允许提交：
- `site/**`（VitePress 页面、配置、主题样式）
- `deploy/**` 中与 VitePress 部署直接相关的脚本/说明

禁止提交：
- 任何 `memory/**`、`MEMORY.md`
- `AGENTS.md` / `SOUL.md` / `USER.md` 等人格与规则文件

---

### `feat/website-wordpress`
只允许提交：
- WordPress 站点改动脚本、主题/样式改动
- `deploy/` 下 WordPress 相关运维脚本

禁止提交：
- `memory/**` 与全局规则文件

---

## 提交前检查（必须执行）

提交前先跑：

```bash
git branch --show-current
git status --short
```

### 当分支是 `main` 时
若暂存区出现 `site/**` 或 WordPress 网站改动，必须中止提交并切分支。

### 当分支是 `feat/vitepress-only-*` 或 `feat/website-wordpress` 时
若暂存区出现以下文件，必须中止提交并移除：
- `memory/**`
- `MEMORY.md`
- `AGENTS.md` / `SOUL.md` / `USER.md` / `IDENTITY.md` / `HEARTBEAT.md` / `TOOLS.md`

---

## 纠错流程（误提交通用）

1. 立即停止继续提交。  
2. 先在当前分支移除误入文件并提交“清理 commit”。  
3. 再把正确内容切到正确分支提交。  
4. 回复中必须明确说明：
   - 错误发生原因
   - 清理 commit hash
   - 正确分支 commit hash

---

## 当前会话约定

- `main`：记忆/规则/流程类提交。
- `feat/vitepress-only-2026-03-08`：仅 VitePress 网站相关提交。

