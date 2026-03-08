# 01 数据导入：先把数据喂进来

## 对应源码
- `01-数据导入-DataLoading/*`
- `00-简单RAG-SimpleRAG/01_01_LlamaIndex_5行代码.py`

## 代码示例（文件读取）
```python
from llama_index.core import SimpleDirectoryReader

documents = SimpleDirectoryReader(
    input_files=["90-文档-Data/黑悟空/设定.txt"]
).load_data()
print(len(documents))
```

## 新手易错点
- 文件路径写错（相对路径 vs 工作目录）
- 编码问题（中文文件）
- 读到了“脏数据”（页眉页脚/广告）
