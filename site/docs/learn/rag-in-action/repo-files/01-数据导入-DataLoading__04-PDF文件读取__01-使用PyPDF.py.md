# 文件：01-数据导入-DataLoading/04-PDF文件读取/01-使用PyPDF.py

- 相对路径：`01-数据导入-DataLoading/04-PDF文件读取/01-使用PyPDF.py`
- 大小：`268` bytes
- 原文件：[01-数据导入-DataLoading/04-PDF文件读取/01-使用PyPDF.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/04-PDF文件读取/01-使用PyPDF.py)

```python
from langchain_community.document_loaders import PyPDFLoader
file_path = "90-文档-Data/黑悟空/黑神话悟空.pdf"
loader = PyPDFLoader(file_path)
pages = loader.load()
print(f"加载了 {len(pages)} 页PDF文档")
for page in pages:
    print(page.page_content)

```
