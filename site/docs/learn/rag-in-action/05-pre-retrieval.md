# 05 检索前处理：问题先“整理”再搜

## 对应源码
- `05-检索前处理-PreRetrieval/**`

## 示例思路
```python
# 伪代码：查询改写
query = "黑悟空有哪些战斗工具"
rewritten = rewrite(query)  # 同义改写/补全上下文
results = retriever.invoke(rewritten)
```

## 新手笔记
- 不是所有问题都直接搜原句
- 先改写，能显著提高召回
