# 04 向量存储：以 Chroma / Milvus 为例

## 新手先懂什么是 Chroma
- `Chroma`：轻量向量数据库，适合本地开发、快速验证。
- 优点：上手快、依赖少。
- 场景：你先把流程跑通，再考虑升级到 Milvus 等方案。

## 运行逻辑
- 写入：文本 -> embedding -> 存入向量库
- 查询：问题 -> embedding -> 相似度检索 -> 返回 top-k

## 新手建议
- 本地调试优先 Chroma
- 生产再看 Milvus（规模、性能、集群）
