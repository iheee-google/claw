# 文件：01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py

- 原路径：`01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py`
- 原文件链接：[01-LangChain-TextLoader-JSON.py](/rag-in-action-repo/rag-in-action/01-数据导入-DataLoading/02-结构化文档读取/01-LangChain-TextLoader-JSON.py)

```python
from langchain_community.document_loaders import TextLoader
print("=== TextLoader 加载结果 ===")
text_loader = TextLoader("90-文档-Data/灭神纪/人物角色.json")
text_documents = text_loader.load()
print(text_documents)

```
