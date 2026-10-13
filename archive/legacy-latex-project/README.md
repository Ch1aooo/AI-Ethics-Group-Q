# 报告文件入口与附录说明

从 2026 年 10 月 12 日起，报告、旧设计与组内讨论分开保存。

## 日常使用的入口

| 用途 | 文件 | 说明 |
|---|---|---|
| 四人对齐产品和演讲 | `../PROJECT_ALIGNMENT_BOARD.md` | 先更新这里的决定，再修改各自内容 |
| Phase 2 小组报告 | `Assignment 2.tex` | 当前仍是待整合草稿；B/F/G 是旧自评方案，C 仍写三棵树 |
| 保留的 Phase 1 | `phase1-report.tex` | 只包含历史 Phase 1 正文、参考文献及其附录 |
| 旧自评工具设计记录 | `historical-design-notes.tex` | 单独保留旧 Assess / Check & Learn / Query 页面和说明 |
| 原主文件兼容入口 | `samplemscthesis.tex` | 现在只调用 `phase1-report.tex`，不再把 Phase 2 说明叠在 Phase 1 前面 |

当前产品方向来自用户的新说明：网页聚焦相似性和独特性，用知识景观圆作概念示意，并呈现两棵结果树。四人的共识、页面细节与分工在公告墙确认；不能把旧模块或者第三棵树继续默认为已选功能。

## Phase 1 附录归属

- `chapters/phase1-body.tex`：历史 Phase 1 正文。
- `appendices/phase1-process.tex`：过程记录及历史检索说明。
- `appendices/phase1-planning.tex`：历史计划；日期不代表全部事项已经完成，不能作为当前排程。
- `appendices/phase1-sketches.tex`：早期界面与架构图。
- `archive/phase1-ai-use-comments.tex`：原文件末尾已有的 AI 使用注释，按原样保留。

这些内容不再自动插入 Phase 2。Phase 2 的 A–H 是正文组件，F/G/H 不应被当成可以忽略的历史附录。Pitch 和个人反思仍是分别提交的项目。

## 历史版本

`archive/2026-10-12-before-cleanup/` 保存本轮整理前的主 TEX、PDF、Assignment 2 和 Mock-up。`archive/legacy-backups/` 存放已有 backup 文件与目录。历史内容没有被删除或改成新的研究结果。

旧编辑说明在 `archive/editorial-notes/`，未使用的 Group X 模板在 `archive/templates/`；历史编译中间文件放在 `archive/legacy-build-files/`。

图片、模块文件、`references.bib` 和样式文件保留原路径，避免破坏引用。`Mock-up.tex` 及其三个模块属于旧设计，供历史设计记录调用，不再是当前产品规格。

## 演讲之前的顺序

1. 四人先在公告墙确认一个产品、两棵树、圆的含义和一个示例。
2. 作者将 A–D、F–H 对齐到这个产品；未完成的内容保持明确状态。
3. 用同一个示例制作 slides 和视频，不混用旧电量计算页面。
4. 真实使用过的工具、来源和提示词再进入 H；尚未做的测试不能写成结果。

生成文件统一放在 `../output/pdf/`。文件夹中的 PDF 是对应源文件的导出，不是第二份编辑源。
