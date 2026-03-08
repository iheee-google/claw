# 代码拆解：03_LangChain_LCEL_RAG_v1.py（新手版）

> 目标：把一个完整 RAG 文件拆成“像 Jupyter Notebook 一样的分块学习单元”，每块都有代码+解释+名词+案例。

## 这份代码在做什么（一句话）
从网页加载“黑神话：悟空”资料，切块后做向量检索，再用 LLM 按上下文回答问题。

---

## Block 1 - 加载文档

```python
from langchain_community.document_loaders import WebBaseLoader

loader = WebBaseLoader(
    web_paths=("https://zh.wikipedia.org/wiki/黑神话：悟空",)
)
docs = loader.load()
```

### 解释代码
- `WebBaseLoader`：从网页抓取文本并转成文档对象。
- `docs`：后续切块与检索的原始输入。

### 名词解释
- **Document**：LangChain 内部的文档结构，通常包含 `page_content` 和 `metadata`。

### 小案例
- 把 URL 换成你的文章地址，验证不同网页是否能成功加载。

---

## Block 2 - 文本切块

```python
from langchain_text_splitters import RecursiveCharacterTextSplitter

text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
all_splits = text_splitter.split_documents(docs)
```

### 解释代码
- `chunk_size=1000`：每段文本最大长度。
- `chunk_overlap=200`：相邻块重叠，减少语义断裂。

### 名词解释
- **Chunk**：切分后的检索最小单元。
- **Overlap**：避免切割造成上下文丢失的缓冲区。

### 小案例
- 把 `chunk_size` 改成 500，观察召回结果是否更细碎。

---

## Block 3 - 嵌入模型

```python
from langchain_openai import OpenAIEmbeddings

embeddings = OpenAIEmbeddings()
```

### 解释代码
- 这一步把文本映射到向量空间，用于语义检索。

### 名词解释
- **Embedding**：文本向量化表示，语义越近距离越近。

### 小案例
- 用不同 embedding 模型（如本地模型）比较召回质量。

---

## Block 4 - 向量存储

```python
from langchain_core.vectorstores import InMemoryVectorStore

vectorstore = InMemoryVectorStore(embeddings)
vectorstore.add_documents(all_splits)
```

### 解释代码
- 用内存向量库快速构建检索原型。
- `add_documents` 会执行向量化并入库。

### 名词解释
- **VectorStore**：保存向量并支持相似度检索的存储层。

### 小案例
- 先用 InMemory 跑通，再切换到 Chroma/Milvus。

---

## Block 5 - 检索器

```python
retriever = vectorstore.as_retriever(search_kwargs={"k": 3})
```

### 解释代码
- `k=3`：每次问题返回最相关 3 段上下文。

### 名词解释
- **Retriever**：负责召回上下文，不负责最终回答。

### 小案例
- 改成 `k=5`，看回答是否更完整或更啰嗦。

---

## Block 6 - 提示模板

```python
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_template("""
基于以下上下文，回答问题。如果上下文中没有相关信息，
请说"我无法从提供的上下文中找到相关信息"。
上下文: {context}
问题: {question}
回答:""")
```

### 解释代码
- 用模板强约束“只基于上下文回答”，降低幻觉。

### 名词解释
- **Prompt Template**：可参数化的提示词模板。

### 小案例
- 增加“回答时给出引用片段”约束，提升可验证性。

---

## Block 7 - 语言模型与输出解析

```python
from langchain_openai import ChatOpenAI
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough

llm = ChatOpenAI(model="gpt-3.5-turbo")
```

### 解释代码
- `ChatOpenAI` 负责生成答案。
- `StrOutputParser` 将模型输出解析为纯文本。
- `RunnablePassthrough` 用于原样透传问题。

### 名词解释
- **Parser**：把模型输出转换成你需要的数据形态。

---

## Block 8 - LCEL 管道链

```python
chain = (
    {
        "context": retriever | (lambda docs: "\n\n".join(doc.page_content for doc in docs)),        
        "question": RunnablePassthrough()
    }    
    | prompt 
    | llm 
    | StrOutputParser() 
)
```

### 解释代码
- 把“检索上下文 + 用户问题”打包进 prompt。
- 然后串到 LLM，再解析为文本。

### 名词解释
- **LCEL**：LangChain Expression Language，用 `|` 连接处理步骤。
- **Runnable**：可执行节点，支持链式组合。

### 小案例
- 在 `retriever` 后加重排器，比较答案准确率。

---

## Block 9 - 执行查询

```python
question = "黑悟空有哪些游戏场景？"
response = chain.invoke(question)
print(response)
```

### 解释代码
- `invoke` 同步执行整条链。
- 输入问题，输出最终回答。

### 小案例
- 问一个上下文没有的问题，验证“拒答文案”是否生效。

---

## 整体流程图（新手复述版）
1. 抓网页文本
2. 切块
3. 向量化并入库
4. 按问题检索 top-k
5. 把检索结果塞进 prompt
6. LLM 生成答案

---

## 完整原始代码（保留）

```python
# 1. 加载文档
from langchain_community.document_loaders import WebBaseLoader

loader = WebBaseLoader(
    web_paths=("https://zh.wikipedia.org/wiki/黑神话：悟空",)
)
docs = loader.load()

# 2. 分割文档
from langchain_text_splitters import RecursiveCharacterTextSplitter

text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
all_splits = text_splitter.split_documents(docs)

# 3. 设置嵌入模型
from langchain_openai import OpenAIEmbeddings

embeddings = OpenAIEmbeddings()

# 4. 创建向量存储
from langchain_core.vectorstores import InMemoryVectorStore

vectorstore = InMemoryVectorStore(embeddings)
vectorstore.add_documents(all_splits)

# 5. 创建检索器
retriever = vectorstore.as_retriever(search_kwargs={"k": 3})

# 6. 创建提示模板
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_template("""
基于以下上下文，回答问题。如果上下文中没有相关信息，
请说"我无法从提供的上下文中找到相关信息"。
上下文: {context}
问题: {question}
回答:""")

# 7. 设置语言模型和输出解析器
from langchain_openai import ChatOpenAI
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough

llm = ChatOpenAI(model="gpt-3.5-turbo")

# 8. 构建 LCEL 链
chain = (
    {
        "context": retriever | (lambda docs: "\n\n".join(doc.page_content for doc in docs)),        
        "question": RunnablePassthrough()
    }    
    | prompt 
    | llm 
    | StrOutputParser() 
)

# 9. 执行查询
question = "黑悟空有哪些游戏场景？"
response = chain.invoke(question)
print(response)
```
