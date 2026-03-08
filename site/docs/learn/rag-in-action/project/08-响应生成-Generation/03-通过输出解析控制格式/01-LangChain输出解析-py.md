# 文件：08-响应生成-Generation/03-通过输出解析控制格式/01-LangChain输出解析.py

- 原路径：`08-响应生成-Generation/03-通过输出解析控制格式/01-LangChain输出解析.py`
- 原文件链接：[01-LangChain输出解析.py](/rag-in-action-repo/rag-in-action/08-响应生成-Generation/03-通过输出解析控制格式/01-LangChain输出解析.py)

```python
from langchain_core.output_parsers import JsonOutputParser
from langchain_deepseek import ChatDeepSeek
from langchain.prompts import PromptTemplate
# 定义输出格式
parser = JsonOutputParser()
prompt = PromptTemplate.from_template("请返回JSON格式的用户信息：{query}")
# 调用大模型并解析
llm = ChatDeepSeek(model="deepseek-chat")
output = llm(prompt.format(query="用户ID 123"))
# 从 AIMessage 中提取内容
parsed_output = parser.parse(output.content)
print(parsed_output)

```
