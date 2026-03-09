# 文件：05-检索前处理-PreRetrieval/01-查询构建/Text2Cypher/03-Text2Cypher-SNOMED-v1-失败.py（解释版）

> 目标：只解释“这段代码块在做什么”，不要求本地跑通结果。

- 原路径：`05-检索前处理-PreRetrieval/01-查询构建/Text2Cypher/03-Text2Cypher-SNOMED-v1-失败.py`
- 原文件链接：[03-Text2Cypher-SNOMED-v1-失败.py](/rag-in-action-repo/rag-in-action/05-检索前处理-PreRetrieval/01-查询构建/Text2Cypher/03-Text2Cypher-SNOMED-v1-失败.py)
- 当前定位：**失败版 v1**（用于暴露 Text2Cypher 第一版常见问题）

---

## 一、这份代码在章节里的位置（层层递进）

- **05 检索前处理（PreRetrieval）**：先把“用户问题”变成更适合检索的形式
- **01 查询构建**：把自然语言问题构造成可执行查询
- **Text2Cypher**：让 LLM 生成 Neo4j Cypher
- **v1-失败**：第一版流程能走通，但可靠性不足，容易生成不稳的查询

---

## 二、代码块拆解（只讲“在干什么”）

### Block 1：连接 Neo4j

```python
from neo4j import GraphDatabase
import os
from dotenv import load_dotenv
load_dotenv()

uri = "bolt://localhost:7687"
username = "neo4j"
password = os.getenv("NEO4J_PASSWORD")
driver = GraphDatabase.driver(uri, auth=(username, password))
```

**这段在干什么**
- 读取环境变量并初始化 Neo4j 连接。
- 给后续 Cypher 执行准备数据库会话。

**名词解释**
- `GraphDatabase.driver(...)`：Neo4j Python 驱动入口。
- `bolt://`：Neo4j 的二进制通信协议地址。

---

### Block 2：定义图谱 Schema 描述

```python
schema_description = """
...Concept / Description / Relationship...
...IS_A / HAS_DESCRIPTION / HAS_RELATIONSHIP...
"""
```

**这段在干什么**
- 用自然语言把图数据库结构告诉 LLM。
- 降低 LLM 生成“无效字段/无效关系”的概率。

**名词解释**
- `Schema Description`：给模型的“数据库地图”，不是数据库真实约束。

---

### Block 3：初始化 LLM 客户端

```python
from openai import OpenAI
client = OpenAI(
    base_url="https://api.deepseek.com",
    api_key=os.getenv("DEEPSEEK_API_KEY")
)
```

**这段在干什么**
- 用 OpenAI 兼容 SDK 访问 DeepSeek 接口。
- 后续用它完成两次生成：Cypher 生成 + 结果转自然语言。

**名词解释**
- `base_url`：兼容 OpenAI 协议时的服务地址。
- `api_key`：调用模型服务的鉴权令牌。

---

### Block 4：准备用户问题与提示词

```python
user_query = "查找与'Diabetes'相关的所有概念及其描述"
prompt = f"""
以下是SNOMED CT图数据库的结构描述：
{schema_description}
...
请只返回Cypher查询语句...
"""
```

**这段在干什么**
- 把“用户问题 + schema + 输出要求”组合成生成 Cypher 的提示词。
- 明确要求只返回查询语句，减少杂质输出。

**名词解释**
- `prompt`：给 LLM 的任务指令文本。

---

### Block 5：调用 LLM 生成 Cypher

```python
response = client.chat.completions.create(
    model="deepseek-chat",
    messages=[...],
    temperature=0
)
```

**这段在干什么**
- 让模型根据问题和 schema 生成一段 Cypher。
- `temperature=0` 让输出更稳定、可复现。

**名词解释**
- `messages`：聊天格式输入（system + user）。
- `temperature`：采样随机度，越低越确定。

---

### Block 6：清洗模型输出

```python
cypher = response.choices[0].message.content.strip()
cypher = cypher.replace('```cypher', '').replace('```', '').strip()
```

**这段在干什么**
- 去掉模型可能带的 Markdown 代码围栏。
- 尽量确保传给数据库的是纯查询语句。

**名词解释**
- 代码围栏：```cypher ... ``` 这类展示标记。

---

### Block 7：执行 Cypher

```python
def run_query(tx, query):
    result = tx.run(query)
    return [record for record in result]

with driver.session() as session:
    results = session.execute_read(run_query, cypher)
```

**这段在干什么**
- 在只读事务里执行生成的 Cypher。
- 把查询结果转成 Python 列表，供后续处理。

**名词解释**
- `execute_read`：Neo4j 的只读事务执行接口。
- `record`：每一行查询结果对象。

---

### Block 8：把结构化结果转自然语言

```python
if results:
    nl_prompt = f"""
    查询结果如下：
    {results}
    请将这些数据转换为自然语言描述...
    """
    response_nl = client.chat.completions.create(...)
```

**这段在干什么**
- 第二次调用 LLM，把数据库结果翻译成用户更易读的描述。
- 属于“结果表达层”，不改变检索结果本身。

**名词解释**
- `nl_prompt`：Natural Language（自然语言）描述生成提示词。

---

### Block 9：收尾

```python
driver.close()
```

**这段在干什么**
- 关闭数据库连接，释放资源。

---

## 三、v1 为什么会失败（这页核心）

这份 v1 常见失败点不在“语法”，而在“约束不足”：

1. **Schema 只是文本提示，不是硬约束**  
   LLM 仍可能生成库里不存在的字段/关系。

2. **缺少生成后校验**  
   直接执行模型输出，没有 AST/规则校验步骤。

3. **结果到自然语言是二次生成**  
   二次生成可能带来信息丢失或表述偏移。

> 所以它适合作为“第一版教学样例”，但不适合直接当生产方案。
