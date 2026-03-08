# 文件：05-检索前处理-PreRetrieval/01-查询构建/构建元数据Filter/01-加载Youtube示例.py

- 相对路径：`05-检索前处理-PreRetrieval/01-查询构建/构建元数据Filter/01-加载Youtube示例.py`
- 大小：`286` bytes
- 原文件：[05-检索前处理-PreRetrieval/01-查询构建/构建元数据Filter/01-加载Youtube示例.py](/learn/rag-in-action/repo-raw/rag-in-action/05-检索前处理-PreRetrieval/01-查询构建/构建元数据Filter/01-加载Youtube示例.py)

```python
from langchain_community.document_loaders import YoutubeLoader

# 加载包含元数据的文档
docs = YoutubeLoader.from_youtube_url(
    "https://www.youtube.com/watch?v=zDvnAY0zH7U", add_video_info=True
).load()

# 查看加载的第一个文档的元数据
print(docs[0].metadata)

```
