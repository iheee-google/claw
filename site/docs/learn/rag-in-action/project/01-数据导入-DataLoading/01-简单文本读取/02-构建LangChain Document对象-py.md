# 文件：01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py

- 原路径：`01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py`
- 原文件链接：[02-构建LangChain Document对象.py](/rag-in-action-repo/rag-in-action/01-数据导入-DataLoading/01-简单文本读取/02-构建LangChain Document对象.py)

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
