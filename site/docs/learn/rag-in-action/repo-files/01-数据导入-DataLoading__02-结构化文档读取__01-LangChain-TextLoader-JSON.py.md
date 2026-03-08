# 文件：01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py

- 相对路径：`01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py`
- 大小：`230` bytes
- 原文件：[01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py)

```python
from langchain_community.document_loaders import TextLoader
print("=== TextLoader 加载结果 ===")
text_loader = TextLoader("90-文档-Data/灭神纪/人物角色.json")
text_documents = text_loader.load()
print(text_documents)

```
