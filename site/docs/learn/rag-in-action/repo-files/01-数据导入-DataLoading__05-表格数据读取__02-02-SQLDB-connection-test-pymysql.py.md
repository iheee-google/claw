# 文件：01-数据导入-DataLoading/05-表格数据读取/02-02-SQLDB-connection-test-pymysql.py

- 相对路径：`01-数据导入-DataLoading/05-表格数据读取/02-02-SQLDB-connection-test-pymysql.py`
- 大小：`432` bytes
- 原文件：[01-数据导入-DataLoading/05-表格数据读取/02-02-SQLDB-connection-test-pymysql.py](/learn/rag-in-action/repo-raw/rag-in-action/01-数据导入-DataLoading/05-表格数据读取/02-02-SQLDB-connection-test-pymysql.py)

```python
import pymysql

try:
    connection = pymysql.connect(
        host="localhost",
        user="newuser",
        password="password",
        database="example_db",
        port=3306
    )

    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM game_scenes")
        for row in cursor.fetchall():
            print(row)

    connection.close()

except Exception as e:
    print("数据库连接失败:", e)



```
