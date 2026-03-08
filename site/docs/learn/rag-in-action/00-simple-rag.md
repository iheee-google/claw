# 00 简单 RAG：先跑通最小闭环

## 这一章要达成什么
- 从 0 到 1 跑通：**加载文档 → 建索引/向量库 → 检索 → 生成回答**。

## 代码切片（LlamaIndex 5 行版）
```python
from llama_index.core import VectorStoreIndex, SimpleDirectoryReader

documents = SimpleDirectoryReader(input_files=["90-文档-Data/黑悟空/设定.txt"]).load_data()
index = VectorStoreIndex.from_documents(documents)
query_engine = index.as_query_engine()
print(query_engine.query("黑神话悟空中有哪些战斗工具?"))
```

## 新手笔记
- `SimpleDirectoryReader`：把文件读成文档对象。
- `VectorStoreIndex.from_documents`：做“向量化 + 索引建立”。
- `as_query_engine`：把索引包装成可问答接口。

## 运行逻辑（你要能复述）
1. 文档被切成内部结构。
2. 文档被向量化并存入索引。
3. 提问时，先在向量空间检索相关片段。
4. 再把检索片段交给模型生成答案。
