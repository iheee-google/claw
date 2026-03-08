# 文件：01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py

- 相对路径：`01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py`
- 大小：`309` bytes
- 原文件：[01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py)

```python
from langchain_core.documents import Document
documents = [
    Document(
        page_content="悟空是大师兄.",
        metadata={"source": "师徒四人.txt"},
    ),
    Document(
        page_content="八戒是二师兄.",
        metadata={"source": "师徒四人.txt "},
    ),
]
print(documents)


```
