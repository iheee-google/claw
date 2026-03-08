# 项目完整树结构（全量）

> 现在是完整多层结构，不再是一层目录。

你提到的路径示例：`rag-in-action/05-检索前处理-PreRetrieval/01-查询构建/Text2SQL/Sakila`（已覆盖在下方完整树中）

```text
rag-in-action/
├── 00-简单RAG-SimpleRAG/
│   ├── 01_01_LlamaIndex_5行代码.py
│   ├── 01_02_LlamaIndex_更换嵌入模型.py
│   ├── 01_03_LlamaIndex_更换兼容OPENAI API的模型
│   ├── 01_03_LlamaIndex_更换生成模型.py
│   ├── 01_04_LlamaIndex_5行代码_DeepSeek.py
│   ├── 01_05_LlamaIndex_5行代码_Ollama.py
│   ├── 02_01_LangChain_DeepSeek_Model_v1.py
│   ├── 02_02_LangChain_DeepSeek_Model_v2.py
│   ├── 02_03_LangChain_OpenAI_Model.py
│   ├── 02_04_LangChain_HuggingFace_Model.py
│   ├── 02_05_LangChain_Ollama_Model.py
│   ├── 03_LangChain_LCEL_RAG_v1.py
│   ├── 03_LangChain_LCEL_RAG_v2.py
│   ├── 03_LangChain_LCEL_RAG_v3.py
│   ├── 04_LangGraph_RAG.ipynb
│   ├── 04_LangGraph_RAG.py
│   ├── 04_LangGraph_RAG_Ollama.py
│   ├── 05_RAG_from_Scratch_Claude.py
│   ├── 05_RAG_from_Scratch_DeepSeek.py
│   ├── 05_RAG_from_Scratch_Ollama.py
│   └── 99_Testing.py
├── 01-数据导入-DataLoading/
│   ├── 01-简单文本读取/
│   │   ├── 00-简单文档导入(LangChain).ipynb
│   │   ├── 01-用LangChain读入txt文件.py
│   │   ├── 02-构建LangChain Document对象.py
│   │   ├── 03-01-用LangChain加载目录中所有文档.py
│   │   ├── 03-02-用LangChain加载目录时指定参数.py
│   │   ├── 03-03-用LangChain加载目录时更改工具.py
│   │   ├── 03-04-用LangChain加载目录时跳过错误.py
│   │   ├── 05-用LlamaIndex-加载目录文档.py
│   │   ├── 06-LlamaIndex-构建Document对象.py
│   │   ├── 07-使用Unstructured_v1.py
│   │   └── 07-使用Unstructured_v2.py
│   ├── 02-结构化文档读取/
│   │   ├── 01-LangChain-TextLoader-JSON.py
│   │   ├── 02-LangCHain-JSONLoader-JSON.py
│   │   ├── 03-LangChain-WebBaseLoader.py
│   │   ├── 04-LangChain-UnstructuredMarkdownLoader.py
│   │   ├── 05-01-Unstrutured-简单示例.py
│   │   └── 05-02-Unstrutured-整理父子元素.py
│   ├── 03-解析图文数据/
│   │   ├── 01-Unstructured读图.py
│   │   ├── 02-Unstructured读PPT.py
│   │   └── 03-大模型读取图文.py
│   ├── 04-PDF文件读取/
│   │   ├── 01-使用PyPDF.py
│   │   ├── 02-使用PyMuPDF.py
│   │   ├── 03-使用pytesseract+pdf2image.py
│   │   ├── 04-使用LlamaParser.py
│   │   ├── 05-LangChain-Unstrucured-PDF-提取文档结构.py
│   │   ├── 05-LangChain-Unstrucured-PDF-简单展示.py
│   │   ├── 06-Unstrctured-使用partition函数解析PDF-v1.py
│   │   ├── 06-Unstrctured-使用partition函数解析PDF-v2.py
│   │   ├── 07-Unstructed-PDF-比较各种模式.ipynb
│   │   ├── 08-分析PDF布局.ipynb
│   │   ├── 08-渲染PDF页面版式.py
│   │   ├── 09-Parent-Child-Unstructured-LangChain.py
│   │   └── 09-Parent-Child-Unstructured-ParitionPDF.py
│   ├── 05-表格数据读取/
│   │   ├── 01-01-导入CSV.py
│   │   ├── 01-02-导入目录时指定CSVLoader.py
│   │   ├── 02-01-LlamaIndex-SQLDB.py
│   │   ├── 02-02-SQLDB-connection-test-pymysql.py
│   │   ├── 02-03-SQLDB-connection-test-sqlalchemy.py
│   │   ├── 03-01-camelot提取PDF表格.py
│   │   ├── 04-01-pdfplumber提取PDF表格.py
│   │   ├── 04-02-pdfplumber提取PDF表格并问答.py
│   │   ├── 05-01-unstructured表格提取.py
│   │   ├── 05-02-unstructured表格提取+上下文.py
│   │   ├── 05-03-unstructured表格提取推断表格结构.py
│   │   └── 06-01-llamaparser提取PDF表格.py
│   └── 99-其它/
│       ├── 15_LangChain_PDF-PyPDFLoader.py
│       ├── 15_LangChain_PDF_Unstructured.py
│       ├── 15_LlamaIndex_PDF.py
│       ├── 15_LlamaIndex_PDF_Small2Big.py
│       ├── 15_LlamaParse_PDF no_Rerank.py
│       ├── 15_LlamaParse_PDF.py
│       ├── 15_LlamaPaser_PDF_Small2Big.py
│       └── 99-使用Textract.py
├── 02-文本切块-DocChunking/
│   ├── 01-LangChain-CharacterTextSplitter.py
│   ├── 02-LangChain-RecursiveharacterTextSplitter.py
│   ├── 03_LlamaIndex-分块大小影响准确性.py
│   ├── 04-LangChain-为代码分块.py
│   ├── 04-LangChain-为代码普通分块.py
│   ├── 05-LlamaIndex-语义分块.py
│   └── 99-工具-PDF-切割.py
├── 03-向量嵌入-Embedding/
│   ├── 01-openai-embedding-recomendation-system.py
│   ├── 02-jina-embeddings-v3-clustering.py
│   ├── 03-BM25.py
│   ├── 03-LangChain-BM25.py
│   ├── 04-BGE-M3.py
│   └── 05-多模态嵌入.py
├── 04-向量存储-VectorDB/
│   ├── LlamaIndex/
│   │   ├── saved_index/
│   │   │   ├── default__vector_store.json
│   │   │   ├── docstore.json
│   │   │   ├── graph_store.json
│   │   │   ├── image__vector_store.json
│   │   │   └── index_store.json
│   │   └── 创建本地向量存储-BuildIndex.ipynb
│   ├── Milvus/
│   │   ├── 01-集合和实体/
│   │   │   ├── 01-database.py
│   │   │   ├── 02-collection.py
│   │   │   ├── 03-schema.py
│   │   │   └── 04-entity(data).py
│   │   ├── 02-索引/
│   │   │   ├── 01-milvus_flat_index.py
│   │   │   ├── 02-ivf_flat_index.py
│   │   │   ├── 03-ivf_pq_index.py
│   │   │   ├── 04-hnsw_index.py
│   │   │   └── 05-DiskANN.py
│   │   ├── 03-搜索和度量/
│   │   │   ├── 01-basic-ann.py
│   │   │   ├── 02-ann-diff-metrics.py
│   │   │   ├── 03-filtered-search.py
│   │   │   ├── 04-range-search.py
│   │   │   ├── 05-group-search.py
│   │   │   ├── 06-full-text-search-bm25-ch.py
│   │   │   ├── 06-full-text-search-bm25-en.py
│   │   │   ├── 07-text-match.py
│   │   │   ├── 08-search-iter.py
│   │   │   └── 09-metadata-query.py
│   │   ├── a-working-sample.py
│   │   ├── create_milvus_db.py
│   │   └── docker-compose.yml
│   ├── 多模态检索/
│   │   ├── Milvus+Visual-BGE多模态检索-中文.py
│   │   ├── Milvus+Visual-BGE多模态检索-英文.py
│   │   ├── Milvus+Visual-BGE纯检索程序.py
│   │   ├── search_results.jpg
│   │   ├── search_with_filter.jpg
│   │   └── search_without_filter.jpg
│   └── 混合检索/
│       ├── Milvus+BGE-M3混合检索-v1-极简.py
│       ├── Milvus+BGE-M3混合检索-v2-细节.py
│       └── Milvus+BGE-M3混合检索-v3-重排.py
├── 05-检索前处理-PreRetrieval/
│   ├── 01-查询构建/
│   │   ├── Text2Cypher/
│   │   │   ├── 03-Text2Cypher-SNOMED-v1-失败.py
│   │   │   └── 03-Text2Cypher-SNOMED-v2-成功.py
│   │   ├── Text2SQL/
│   │   │   ├── Sakila/
│   │   │   │   ├── 01-generate-ddl.py
│   │   │   │   ├── 02-ingest-ddl.py
│   │   │   │   ├── 03-ingest-q2sql.py
│   │   │   │   ├── 04-ingest-db-desc.py
│   │   │   │   ├── 05-text2sql-rag-v1-error.py
│   │   │   │   ├── 05-text2sql-rag-v2-ok.py
│   │   │   │   └── 05-text2sql-rag-v3-agent.py
│   │   │   ├── 01-Text2SQL-创建数据库表.py
│   │   │   ├── 02-Text2SQL-LLM-DeepSeek.py
│   │   │   └── 02-Text2SQL-LLM-OpenAI.py
│   │   └── 构建元数据Filter/
│   │       ├── 01-加载Youtube示例.py
│   │       └── 02-Query中生成元数据.py
│   ├── 02-查询翻译/
│   │   ├── 01-查询重写-1-通过提示词重写.py
│   │   ├── 01-查询重写-2-RePhraseQueryRetriever.py
│   │   ├── 02-查询分解-1-MultiQueryRetriever.py
│   │   ├── 02-查询分解-2-MultiQueryRetriever.py
│   │   ├── 03-查询澄清-构建查询澄清树.ipynb
│   │   └── 04-查询扩展-HyDE假设文档生成.py
│   └── 03-查询路由/
│       ├── 01-逻辑路由.py
│       └── 02-语义路由.py
├── 06-索引优化-Indexing/
│   ├── 01-从小块到大上下文/
│   │   ├── 01-节点句子滑动窗口-测评版.ipynb
│   │   ├── 01-节点句子滑动窗口.py
│   │   ├── 02-父子文本块检索.py
│   │   └── 03-前后向扩展上下文.py
│   ├── 02-构建有层次的索引/
│   │   ├── 00-直接读入文档，索引，并问答.py
│   │   ├── 01-双层索引-Milvus-能跑但是不成熟版.py
│   │   ├── 02-双层索引-Milvus-成功的分层索引.py
│   │   ├── 03-双层索引-PandasNode.py
│   │   ├── 04-粗中有细的示例.py
│   │   ├── 05-分层合并的示例.py
│   │   ├── 98-双层索引-FAISS.py
│   │   └── 99-查询测试.py
│   ├── 03-构建多表示的索引/
│   │   ├── 01-用EnsembleRetriever做混合检索.py
│   │   └── 02-用MultiVectorRetriever构建多表示索引.py
│   └── 99-其它测试/
│       ├── camelot+llamaindex表格问答.py
│       ├── llamaparsePDF问答.py
│       └── Unstructured+llamaindex表格问答.py
├── 07-检索后处理-PostRetrieval/
│   ├── 01-重排/
│   │   ├── 01-RRF重排.py
│   │   ├── 02-CrossEncoder重排.py
│   │   ├── 03-CoBERT重排.py
│   │   ├── 04-Cohere重排.py
│   │   ├── 05-RankLLM重排.py
│   │   └── 06-时效加权重排.py
│   ├── 02-压缩/
│   │   ├── 01-ContextualCompressionRetriever压缩.py
│   │   ├── 02-LLMLingua压缩.py
│   │   └── 03-SentenceEmbeddingOptimizer压缩.py
│   └── 03-校正/
│       └── 01-CRAG-反思式检索.py
├── 08-响应生成-Generation/
│   ├── 01-模型的选择和调用/
│   │   ├── 01-使用Qwen3.py
│   │   └── 02-微调Qwen3.py
│   ├── 02-通过提示词优化响应/
│   │   ├── 01-使用提示模板明确生成目标.py
│   │   ├── 02-使用Few Shots为响应提供参考.py
│   │   ├── 03-增加响应结果的全面性和多样性.py
│   │   └── 04-通过路由选择合适提示模板.py
│   ├── 03-通过输出解析控制格式/
│   │   ├── 01-LangChain输出解析.py
│   │   ├── 02-LlamaIndex输出解析.py
│   │   ├── 03-JSON-Output.py
│   │   ├── 04-Pydantic-v1.py
│   │   ├── 04-Pydantic-v2.py
│   │   ├── 05-function-calling-v1-LangChain.py
│   │   └── 05-function-calling-v2-DeepSeek.py
│   └── 04-动态生成优化策略/
│       ├── graph.png
│       ├── RRR - 2023.emnlp-main.322.pdf
│       ├── Self-RAG 2310.11511v1.pdf
│       ├── self-rag.png
│       └── Self-RAG完整实现.py
├── 09-系统评估-Evaluation/
│   ├── 01-RAGAS.py
│   ├── 02-Trulens.py
│   ├── 03-DeepEval.py
│   └── 04-LlamaIndexEvaluation.py
├── 10-高级RAG-AdvanceRAG/
│   ├── 01-GraphRAG/
│   │   └── GraphRAG - 2404.16130v2.pdf
│   ├── 02-ContextRetrieval/
│   │   ├── LlamaIndex实现.py
│   │   └── Mivlus实现.py
│   ├── 03-ModularRAG/
│   │   └── 模块化RAG-2407.21059v1.pdf
│   ├── 04-AgenticRAG/
│   │   ├── 01-AgenticRAG-Graph.png
│   │   ├── 01-LangChain-AgenticRAG.py
│   │   ├── 02-AdaptiveRAG-Flow.png
│   │   ├── 02-AdaptiveRAG-Graph.png
│   │   └── 02-LangChain-AdaptiveRAG.py
│   └── 05-MultiModalRAG/
│       ├── 01-Weaviate-Multimodal-Search.py
│       ├── 02-Weaviate-Multimodal-RAG.py
│       └── docker-compose.yml
├── 90-文档-Data/
│   ├── sakila/
│   │   ├── db_description.yaml
│   │   ├── ddl_statements.yaml
│   │   └── q2sql_pairs.json
│   ├── 复杂PDF/
│   │   ├── 十大富豪/
│   │   │   ├── billionaires_merged.xlsx
│   │   │   ├── billionaires_table_1.csv
│   │   │   ├── billionaires_table_2.csv
│   │   │   ├── billionaires_table_3.csv
│   │   │   ├── billionaires_table_4.csv
│   │   │   ├── billionaires_table_5.csv
│   │   │   ├── billionaires_table_6.csv
│   │   │   ├── merge_csv_to_excel.py
│   │   │   └── 世界十大富豪.xlsx
│   │   ├── billionaires_page-1-5.pdf
│   │   ├── billionaires_page.pdf
│   │   ├── IPCC_AR6_WGII_Chapter03.pdf
│   │   ├── ipcc_eval_qr_dataset.json
│   │   ├── uber_10q_march_2022.pdf
│   │   ├── uber_10q_march_2022_page1-3.pdf
│   │   └── uber_10q_march_2022_page26.pdf
│   ├── 多模态/
│   │   ├── Weaviate/
│   │   │   ├── 悟空和白骨精.jpg
│   │   │   ├── 悟空妖怪搏斗.jpg
│   │   │   └── 悟空着火了.jpg
│   │   ├── 01.jpg
│   │   ├── 02.jpg
│   │   ├── 03.jpg
│   │   ├── 04.jpg
│   │   ├── 05.jpg
│   │   ├── 06.jpg
│   │   ├── 07.jpg
│   │   ├── 08.jpg
│   │   ├── 09.jpg
│   │   ├── metadata.json
│   │   └── query_image.jpg
│   ├── 山西文旅/
│   │   ├── 云冈石窟-ch.pdf
│   │   ├── 云冈石窟-en.pdf
│   │   ├── 云冈石窟.docx
│   │   ├── 云冈石窟.txt
│   │   ├── 五台山-ch.pdf
│   │   ├── 五台山-en.pdf
│   │   ├── 佛光寺-ch.pdf
│   │   ├── 佛光寺-en.pdf
│   │   ├── 壶口瀑布-ch.pdf
│   │   ├── 壶口瀑布-en.pdf
│   │   ├── 山西-en.pdf
│   │   ├── 平遥古城-ch.pdf
│   │   ├── 平遥古城-en.pdf
│   │   ├── 悬空寺-ch.pdf
│   │   ├── 悬空寺-en.pdf
│   │   ├── 晋祠-ch.pdf
│   │   └── 晋祠-en.pdf
│   ├── 灭神纪/
│   │   ├── 人物角色.json
│   │   ├── 战斗场景.json
│   │   ├── 游戏描述.csv
│   │   ├── 游戏说明.json
│   │   ├── 用户评价.csv
│   │   └── 设定.txt
│   └── 黑悟空/
│       ├── 设定.txt
│       ├── 黑悟空wiki.txt
│       ├── 黑悟空版本介绍.md
│       ├── 黑悟空英文.jpg
│       ├── 黑悟空销量.jpg
│       ├── 黑神话悟空.csv
│       ├── 黑神话悟空.pdf
│       └── 黑神话悟空.pptx
├── 91-环境-Environment/
│   ├── archive/
│   │   ├── requirements_langchain_20250305(Ubuntu-with-GPU).txt
│   │   └── requirements_llamaindex_20250305(Ubuntu-with-GPU).txt
│   ├── requirements_camelot_20250413.txt
│   ├── requirements_langchain_20250413_Ubuntu-with-GPU.txt
│   ├── requirements_langchain_Ubuntu-with-CPU.txt
│   ├── requirements_langchain_无GPU版_Mac-Win.txt
│   ├── requirements_langchain_简单RAG_后续模块还要安装其它包.txt
│   ├── requirements_llamaindex_20250413_Ubuntu-with-GPU.txt
│   ├── requirements_llamaindex_Ubuntu-with-CPU.txt
│   ├── requirements_llamaindex_无GPU版_Mac-Win.txt
│   ├── requirements_llamaindex_简单RAG_后续模块还要安装其它包.txt
│   └── requirements_marker_20250413.txt
├── 92-图片-Pic/
│   ├── output/
│   │   ├── page_1.png
│   │   ├── page_2.png
│   │   ├── page_3.png
│   │   ├── page_4.png
│   │   └── page_5.png
│   ├── RAG.PNG
│   ├── RAG实战.jpg
│   ├── RAG技术框架.png
│   └── star-history.png
├── temp_images/
│   ├── page_1.jpg
│   ├── page_2.jpg
│   ├── page_3.jpg
│   ├── page_4.jpg
│   └── page_5.jpg
├── .gitignore
├── note.txt
└── Readme.md
```
