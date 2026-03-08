# 03 向量嵌入：把文本变成可检索向量

## 对应源码
- `03-向量嵌入-Embedding/01-openai-embedding-recomendation-system.py`
- `03-向量嵌入-Embedding/04-BGE-M3.py`

## 代码示例
```python
from langchain_openai import OpenAIEmbeddings
emb = OpenAIEmbeddings()
vec = emb.embed_query("什么是 RAG")
print(len(vec))
```

## 名词解释
- Embedding：文本的向量表示
- 向量维度：每条向量的长度（例如 768/1024/1536）
