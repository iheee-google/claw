# 文件：01-数据导入-DataLoading/01-简单文本读取/01-用LangChain读入txt文件.py

- 相对路径：`01-数据导入-DataLoading/01-简单文本读取/01-用LangChain读入txt文件.py`
- 大小：`447` bytes
- 原文件：[01-数据导入-DataLoading/01-简单文本读取/01-用LangChain读入txt文件.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/01-简单文本读取/01-用LangChain读入txt文件.py)

```python
# 读取单个txt文件
import os
from langchain_community.document_loaders import TextLoader
# 获取当前脚本文件所在的目录
script_dir = os.path.dirname(__file__)
print(f"获取当前脚本文件所在的目录：{script_dir}") 
# 结合相对路径构建完整路径
file_dir = os.path.join(script_dir, '../../90-文档-Data/黑悟空/设定.txt')

loader = TextLoader(file_dir)
documents = loader.load()
print(documents)

```
