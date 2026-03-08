# 文件：01-数据导入-DataLoading/02-结构化文档读取/05-01-Unstrutured-简单示例.py

- 原路径：`01-数据导入-DataLoading/02-结构化文档读取/05-01-Unstrutured-简单示例.py`
- 原文件链接：[05-01-Unstrutured-简单示例.py](/rag-in-action-repo/rag-in-action/01-数据导入-DataLoading/02-结构化文档读取/05-01-Unstrutured-简单示例.py)

```python
# 使用UnstructuredLoader加载网页
from langchain_unstructured import UnstructuredLoader
page_url = "https://zh.wikipedia.org/wiki/黑神话：悟空"
loader = UnstructuredLoader(web_url=page_url)
docs = loader.load()
for doc in docs[:5]:
    print(f'{doc.metadata["category"]}: {doc.page_content}')


```
