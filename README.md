# Group Q 文件夹使用说明

根目录只有两个提交用的 TEX 入口。打开哪份文件并编译，就生成对应名称的 PDF；两份文件都已包含自己的正文、附录、图表代码、字数定义和参考文献，不需要编译另一份 TEX，也不需要单独运行 BibTeX。

## 提交文件

| 打开的 TEX | 生成的 PDF | 内容 |
|---|---|---|
| [Phase1.tex](Phase1.tex) | `Phase1.pdf` | 保留的 Phase 1 报告、自己的附录与参考文献 |
| [Phase2.tex](Phase2.tex) | `Phase2.pdf` | Phase 2 的 A–H 小组报告草稿 |

在本文件夹的 VS Code 工作区使用默认 Compile 配方，PDF 放在 `output/pdf/`。如果在其他编辑器直接运行 pdflatex，PDF 可能放在 TEX 旁边；文件名称仍对应所编译的 TEX。初次编译需要再次运行以解析作者年份引用；提供的配方会自动跑三次。

可直接打开 `AI-Ethics.code-workspace`。每份 TEX 首行明确指定自己为编译入口，避免编辑 Phase 2 时误编 Phase 1。

## 文件分类

| 文件夹或文档 | 存放内容 |
|---|---|
| [PROJECT_ALIGNMENT_BOARD.md](PROJECT_ALIGNMENT_BOARD.md) | 四人统一最终产品的公告墙 |
| `assets/images/phase1/` | Phase 1 图像 |
| `assets/images/phase2/` | Phase 2 草稿的原有截图，使用有含义的文件名 |
| `assets/images/unclassified/` | 原目录中用途尚不明确的图片 |
| `assets/branding/` | TU/e 标识 |
| `references/references.bib` | 原有参考文献数据库，保留供查阅 |
| `references/papers/` | 已有论文 PDF |
| `course/assignment-rules/` | 作业说明、格式、评分标准及例文 |
| `course/course-info/` | Study Guide 和 Case Descriptions |
| `course/lectures/` | 课堂材料 |
| `project-records/feedback/` | 已收到的评分和反馈 |
| `project-records/meetings/` | 会议与客户问答记录 |
| `project-records/reviews/` | 编辑评析与说明 |
| `archive/legacy-latex-project/` | 整理前的完整 TEX 项目，含其原有备份 |
| `archive/design-notes/` | 可单独编译的旧自评设计记录，非当前提交 |
| `archive/compiled-reports/` | 原来的不同命名 PDF 和编译记录 |
| `scripts/` | 编译辅助脚本 |
| `output/pdf/` | 当前两份提交文件的编译结果 |
| `tmp/` | 本地处理中间文件，不是提交材料 |

原始项目完整移动到 archive 后，已逐文件核对内容哈希；没有删除旧稿、同学内容或原始图片。两份新 TEX 只是整理与展开现有内容。

## 修改与编译

1. 修改 `Phase1.tex` 或 `Phase2.tex` 对应的内容；不在 archive 中继续维护最终稿。
2. 替换图片时更新对应的 `assets/images/` 文件和 TEX 图片路径。
3. 参考文献展示内容现在直接写在各 TEX 的 `thebibliography` 中。需要改作者、年份或条目时修改对应 TEX；仅改 `references.bib` 不会自动改变这两份独立报告。
4. 在编辑器编译当前 TEX，或运行 `scripts/compile.ps1 -Document Phase2`。脚本不指定 Document 时编译两份。
5. 查看对应 PDF。字数标签是当前核对值；修改正文后应重新核对，不把旧字数当作自动更新结果。

Pitch 视频、个人反思和个人评价仍是独立提交项。目前没有找到可作为这些提交项的完成稿，因此没有创建空文件冒充完成内容。

## 公告墙如何使用

公告墙服务于统一最终产品，而不是替代报告。当前方向是研究相似性与独特性的网页、一个概念性的知识景观圆、相似性树和独特性树，以及支持复用的标签。

1. 把公告墙的一个可编辑版本放入你们已有的共享空间，在文档顶端记录共享链接。
2. 四人先确认开头的四项：产品一句话、圆与两棵树的含义、共同演示案例、分工。
3. 每个主题下填写各自的意见，把共同决定写入决定表；分歧保留为 Open。
4. 用确认后的同一个方案更新报告、slides 和视频。

公告墙目前是本地文档，尚未上传为在线协作文档。组员未完成的内容保留；Phase 2 中旧自评内容与三棵树的描述仍明确标记为待对齐。
