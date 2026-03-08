# 文件：01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py

- 相对路径：`01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py`
- 大小：`212` bytes
- 原文件：[01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py)

```python
from langchain_community.document_loaders import UnstructuredImageLoader
image_path = "90-文档-Data/黑悟空/黑悟空英文.jpg"
loader = UnstructuredImageLoader(image_path)

data = loader.load()
print(data)

```
