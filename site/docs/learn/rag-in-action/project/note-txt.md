# 文件：note.txt

- 原路径：`note.txt`
- 原文件链接：[note.txt](/rag-in-action-repo/rag-in-action/note.txt)

```text
Show all films and their descriptions.

MATCH (c:ObjectConcept {id: '267036007'})
MATCH (c)-[r]->(target)
WHERE type(r) <> 'IS_A' AND type(r) <> 'HAS_DESCRIPTION'
RETURN c, r, target
```
