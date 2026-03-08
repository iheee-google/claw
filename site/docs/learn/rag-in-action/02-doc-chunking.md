# 02 文本切块：切得好，检索才准

## 对应源码
- `02-文本切块-DocChunking/01-LangChain-CharacterTextSplitter.py`
- `02-文本切块-DocChunking/02-LangChain-RecursiveharacterTextSplitter.py`

## 代码示例（递归切块）
```python
from langchain_text_splitters import RecursiveCharacterTextSplitter

splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
chunks = splitter.split_documents(docs)
print(len(chunks))
```

## 名词解释
- `chunk_size`：每块最大长度
- `chunk_overlap`：相邻块重叠，防止语义断裂
