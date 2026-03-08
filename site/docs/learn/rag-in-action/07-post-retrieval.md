# 07 检索后处理：结果重排与过滤

## 对应源码
- `07-检索后处理-PostRetrieval/**`

## 代码示意
```python
# 伪代码：重排
candidates = retriever.invoke(question)
reranked = reranker.rank(question, candidates)
context = reranked[:3]
```

## 新手重点
- 召回多不等于回答好
- 重排是“把最该看的放前面”
