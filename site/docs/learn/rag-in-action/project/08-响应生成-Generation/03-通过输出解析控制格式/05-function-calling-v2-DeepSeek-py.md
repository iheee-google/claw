# 文件：08-响应生成-Generation/03-通过输出解析控制格式/05-function-calling-v2-DeepSeek.py

- 原路径：`08-响应生成-Generation/03-通过输出解析控制格式/05-function-calling-v2-DeepSeek.py`
- 原文件链接：[05-function-calling-v2-DeepSeek.py](/rag-in-action-repo/rag-in-action/08-响应生成-Generation/03-通过输出解析控制格式/05-function-calling-v2-DeepSeek.py)

```python
from openai import OpenAI
from dotenv import load_dotenv
import os
import json

load_dotenv()

def send_messages(messages):
    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=messages,
        tools=tools
    )
    return response.choices[0].message

client = OpenAI(
    api_key=os.getenv("DEEPSEEK_API_KEY"),
    base_url="https://api.deepseek.com",
)

tools = [
    {
        "type": "function",
        "function": {
            "name": "get_weather",
            "description": "Get weather of an location, the user shoud supply a location first",
            "parameters": {
                "type": "object",
                "properties": {
                    "location": {
                        "type": "string",
                        "description": "The city and state, e.g. San Francisco, CA",
                    }
                },
                "required": ["location"]
            },
        }
    },
]

messages = [{"role": "user", "content": "How's the weather in Hangzhou?"}]
print(f"User>\t {messages[0]['content']}")

message = send_messages(messages)
print("\nModel's Function Call Response:")
print(f"Content: {message.content}")
print(f"Tool Calls: {json.dumps(message.tool_calls[0].function.model_dump(), indent=2)}")

tool = message.tool_calls[0]
messages.append(message)

messages.append({"role": "tool", "tool_call_id": tool.id, "content": "24℃"})
message = send_messages(messages)
print(f"\nModel's Final Response: {message.content}")
```
