# 文件：note.txt

- 相对路径：`note.txt`
- 大小：`182` bytes
- 原文件：[note.txt](/learn/rag-in-action/repo-raw/rag-in-action/note.txt)

```text
Show all films and their descriptions.

MATCH (c:ObjectConcept {id: '267036007'})
MATCH (c)-[r]->(target)
WHERE type(r) <> 'IS_A' AND type(r) <> 'HAS_DESCRIPTION'
RETURN c, r, target
```
