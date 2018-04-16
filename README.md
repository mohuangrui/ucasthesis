# `ucasthesis` 国科大学位论文 LaTeX 模板 [最新样式]

## 模板下载

请在页面右边点击：**Clone or download -> Download Zip**

## 重要建议

* 关于 LaTeX 的知识性问题，请查阅 [ucasthesis 和 LaTeX 知识小站](https://github.com/mohuangrui/ucasthesis/wiki) 和 [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)。
* 关于模板编译和样式设计的问题，请先仔细阅读 **模板使用说明.pdf** 并遵从提问流程。
* 使用邮件传播 ucasthesis 时，请先删除 `artratex.bat` 以防范 Dos 脚本的潜在风险。
* 开题报告请见：[ucasproposal: 中国科学院大学开题报告 LaTeX 模板](https://github.com/mohuangrui/ucasproposal)。
* 添加一行

## 模板简介

* ucasthesis 为撰写中国科学院大学本、硕、博学位论文的 LaTeX 模版。ucasthesis 提供了简单明了的**模板使用说明.pdf**。无论你是否具有 LaTeX 使用经验，都可较为轻松地使用以完成学位论文的撰写和排版。谢谢大家的测试、反馈和支持，我们一起的努力让 ucasthesis 非常荣幸地得到了国科大本科部陆晴老师、本科部学位办丁云云老师和中科院数学与系统科学研究院吴凌云研究员的支持，并得到吴凌云学长在 [CTEX](http://www.ctex.org/HomePage) 的发布。

* 考虑到许多同学可能缺乏 LaTeX 使用经验，ucasthesis 将 LaTeX 的复杂性高度封装，开放出简单的接口，以便轻易使用。同时，对用 LaTeX 撰写论文的一些主要难题，如制图、制表、文献索引等，进行了详细说明，并提供了相应的代码样本，理解了上述问题后，对于初学者而言，使用此模板撰写学位论文将不存在实质性的困难。所以，如果你是初学者，请不要直接放弃，因为同样为初学者的我，十分明白让 LaTeX 简单易用的重要性，而这正是 ucasthesis 所追求和体现的。

* 此中国科学院大学学位论文模板 ucasthesis 基于中科院数学与系统科学研究院吴凌云研究员的 CASthesis 模板发展而来。当前 ucasthesis 模板满足最新的中国科学院大学学位论文撰写要求和封面设定。兼顾操作系统：Windows，Linux，MacOS 和 LaTeX 编译引擎：pdflatex，xelatex，lualatex。支持中文书签、中文渲染、中文粗体显示、拷贝 PDF 中的文本到其他文本编辑器等特性。此外，对模板的文档结构进行了精心设计，撰写了编译脚本提高模板的易用性和使用效率。

* ucasthesis 的目标在于简化学位论文的撰写，利用 LaTeX 格式与内容分离的特征，模板将格式设计好后，作者可只需关注论文内容。 同时，ucasthesis 有着整洁一致的代码结构和扼要的注解，对文档的仔细阅读可为初学者提供一个学习 LaTeX 的窗口。此外，模板的架构十分注重通用性，事实上，ucasthesis 不仅是国科大学位论文模板，同时，通过少量修改即可成为使用 LaTeX 撰写中英文文章或书籍的通用模板，并为使用者的个性化设定提供了接口。

## 重要通知

* `2018-04-03` 模板样式进行了修改，请查看下面的修改描述，以决定是否需要更新。

## 更新记录

* `2018-04-08` 将附录复原为常规的排版设置。问题/建议由邵岳林提出。修改的文件为：Thesis.tex，Appendix.tex。

* `2018-04-03` 根据国科大本科部陆晴老师和本科部学位办丁云云老师的复审审核建议再次修复一些样式细节问题。

* `2018-04-02` 模板进行了重大更新，修复了样式、字体、格式等许多问题。

    * 根据国科大本科部陆晴老师的建议对模版样式进行了诸多拓展和修正，并完善对本科生论文元素的兼容性。
    * 在赵永明同学的建议下对数学符号字体进行调整。在 [ctex](https://github.com/CTeX-org/ctex-kit) 开发者的帮助下解决了如何多次调用 Times New Roman 而不导致黑体调用错误的问题。修复 twn1993 发现的默认黑体为微软雅黑而不是SimHei的问题。
    * 繁复折腾测试后终于找出一个在ctex默认黑体替换粗宋体设定环境内全局AutoFakeBold失效状态下折衷特定字体库不全条件下生僻字显示和系统默认字重不全条件下粗宋体显示以及不同操作系统下如何平衡上述字库自重矛盾还有根据操作系统自动调用所带有的Times字体的方案。祝贺大家不用再为字体调用苦恼了。
    * 设定论文封面据英文学位名如 Bachelor，Master，或 Doctor 自动切换。密级据是否填写自动显示。

* `2018-03-22` 演示表标题居表上，加粗图表标注，设置长图表标题悬挂缩进（由于 bicaption 宏包无法正确接受 caption 宏包的 margin 选项，图表中英标题第一行无法正确同步缩进，从而放弃第一行的缩进），强调多图中子图标题的规范使用，通过摘要和符号列表演示标题不在目录中显示却仍在页眉中显示，修改附录为学位办给出的特殊显示行为。设置 bicaption 不在图形列表和表格列表中显示英文标题，问题/建议由赵永明提出。

* `2018-03-21` 使用 [xiaoyao9933](https://github.com/xiaoyao9933/UCASthesis) 制作的 ucas_logo.pdf 使学校 logo 放大不失真，问题/建议由 zhanglinbo 提出。回答标题英文如何设为 Times New Roman 字体，问题/建议由 Starsky Wong 提出。矫正由 will0n 和赵永明提出的一些格式细节问题，根据赵永明的建议设置双语图表标题，根据 tangjie1992 的建议配置算法环境。

* `2018-02-04` 在 [ctex](https://github.com/CTeX-org/ctex-kit) 开发者的帮助下修复误用字体命令导致的粗宋体异常。然后，将模板兼容性进一步扩展为兼容操作系统 Windows，Linux，MacOS 和 LaTeX 编译引擎 pdflatex，xelatex，lualatex。移除 microtype 宏包以提高编译效率。

* `2018-01-28` 基于国科大 2018 新版论文规范进行了重大修改，采用新的封面、声明、页眉页脚样式。展示标题中使用数学公式。使用 [zepinglee](https://github.com/zepinglee/gbt7714-bibtex-style) 开发的文献国标样式。

* `2017-05-14` 增加 \citepns{} 和 \citetns{} 命令提供上标引用下混合非上标引用的需求，问题/建议由赵永明提出。添加设定论文为 thesis 或 dissertation 的命令 \englishthesistype{}，问题/建议由臧光明提出。

