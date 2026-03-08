# 文件：01-数据导入-DataLoading/01-简单文本读取/03-03-用LangChain加载目录时更改工具.py

- 相对路径：`01-数据导入-DataLoading/01-简单文本读取/03-03-用LangChain加载目录时更改工具.py`
- 大小：`660` bytes
- 原文件：[01-数据导入-DataLoading/01-简单文本读取/03-03-用LangChain加载目录时更改工具.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/01-简单文本读取/03-03-用LangChain加载目录时更改工具.py)

```python
from langchain_community.document_loaders import DirectoryLoader, TextLoader

import os
# 获取当前脚本文件所在的目录
script_dir = os.path.dirname(__file__)
print(f"获取当前脚本文件所在的目录：{script_dir}") 
# 结合相对路径构建完整路径
data_dir = os.path.join(script_dir, '../../90-文档-Data/黑悟空')

# 加载目录下所有 Markdown 文件
loader = DirectoryLoader(data_dir,
                         glob="**/*.md",
                         loader_cls=TextLoader # 指定加载工具
                         )
docs = loader.load()
print(docs[0].page_content[:100])  # 打印第一个文档内容的前100个字符

```
