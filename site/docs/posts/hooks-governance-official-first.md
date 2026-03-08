# Hooks 治理复盘：为什么要优先用官方内置能力

在自动化流程里，能用官方内置 hooks，就尽量别先上自定义脚本。

## 实践结论

- 统一启用官方 internal hooks（boot-md / bootstrap-extra-files / command-logger / session-memory）
- 减少自定义钩子与回归成本
- 故障排查路径更清晰

## 经验
自定义不是不能做，但应该在官方能力不满足时再加，而且要有明确回滚方案。
