# 文件：01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py

- 原路径：`01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py`
- 原文件链接：[01-Unstructured读图.py](/rag-in-action-repo/rag-in-action/01-数据导入-DataLoading/03-解析图文数据/01-Unstructured读图.py)

```python
from langchain_community.document_loaders import UnstructuredImageLoader
image_path = "90-文档-Data/黑悟空/黑悟空英文.jpg"
loader = UnstructuredImageLoader(image_path)

data = loader.load()
print(data)

```
