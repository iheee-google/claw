# 04 向量存储：以 Chroma / Milvus 为例

## 对应源码
- `04-向量存储-VectorDB/LlamaIndex/**`
- `04-向量存储-VectorDB/Milvus/**`

## 代码示例（内存向量库思路）
```python
from langchain_core.vectorstores import InMemoryVectorStore

vectorstore = InMemoryVectorStore(embeddings)
vectorstore.add_documents(all_splits)
retriever = vectorstore.as_retriever(search_kwargs={"k": 3})
```

## 举一反三
- 本地开发：先 Chroma/内存库
- 生产部署：再切 Milvus（规模与性能）
