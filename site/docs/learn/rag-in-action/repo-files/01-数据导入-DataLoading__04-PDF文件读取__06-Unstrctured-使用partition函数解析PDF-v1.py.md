# 文件：01-数据导入-DataLoading/04-PDF文件读取/06-Unstrctured-使用partition函数解析PDF-v1.py

- 相对路径：`01-数据导入-DataLoading/04-PDF文件读取/06-Unstrctured-使用partition函数解析PDF-v1.py`
- 大小：`278` bytes
- 原文件：[01-数据导入-DataLoading/04-PDF文件读取/06-Unstrctured-使用partition函数解析PDF-v1.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/04-PDF文件读取/06-Unstrctured-使用partition函数解析PDF-v1.py)

```python
from unstructured.partition.auto import partition
filename = "90-文档-Data/黑悟空/黑神话悟空.pdf"
elements = partition(filename=filename, 
                     content_type="application/pdf"
                    )
print("\n\n".join([str(el) for el in elements][:10]))


```
