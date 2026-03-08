# 08 响应生成：把检索结果转成答案

## 对应源码
- `08-响应生成-Generation/**`
- `00-简单RAG-SimpleRAG/03_LangChain_LCEL_RAG_v1.py`

## 代码片段（LCEL 链）
```python
chain = (
  {"context": retriever | format_docs, "question": RunnablePassthrough()}
  | prompt
  | llm
  | StrOutputParser()
)
```

## 新手提示词要点
- 只基于上下文回答
- 无答案时明确说“不知道”
