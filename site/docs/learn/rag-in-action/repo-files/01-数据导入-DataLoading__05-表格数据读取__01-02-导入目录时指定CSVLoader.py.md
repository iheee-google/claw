# 文件：01-数据导入-DataLoading/05-表格数据读取/01-02-导入目录时指定CSVLoader.py

- 相对路径：`01-数据导入-DataLoading/05-表格数据读取/01-02-导入目录时指定CSVLoader.py`
- 大小：`476` bytes
- 原文件：[01-数据导入-DataLoading/05-表格数据读取/01-02-导入目录时指定CSVLoader.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/05-表格数据读取/01-02-导入目录时指定CSVLoader.py)

```python
from langchain_community.document_loaders import DirectoryLoader
from langchain_community.document_loaders import CSVLoader

loader = DirectoryLoader(
    path="data/黑神话",  # Specify the directory containing your CSV files
    glob="**/*.csv",                # Use a glob pattern to match CSV files
    loader_cls=CSVLoader            # Specify CSVLoader as the loader class
)

docs = loader.load()
print(f"文档数：{len(docs)}")  # 输出文档总数
print(docs[0])

```
