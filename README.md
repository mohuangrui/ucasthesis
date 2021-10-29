# `ucasthesis` 国科大学位论文 LaTeX 模板 [最新样式]

## 模板下载

* 页面右边点击：**Clone or download -> Download Zip**
* [Overleaf](https://github.com/mohuangrui/ucasthesis/wiki/字体配置#linuxoverleaf-系统的字体配置)

## 重要建议

* 关于 ucasthesis 编译和设计的问题，请先读 **模板使用说明.pdf**，如发问需遵从[提问流程](https://github.com/mohuangrui/ucasthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)。
* 开题报告见：[ucasproposal: 中国科学院大学开题报告 LaTeX 模板](https://github.com/mohuangrui/ucasproposal)。
* 书脊制作见：[latexspine: LaTeX 书脊模板](https://github.com/mohuangrui/latexspine)。

<h1 align="center">
<img width="50%" src="https://github.com/mohuangrui/mohuangrui/blob/main/gallery/ucasthesis.gif" alt="ucasthesis">
</h1>

## 模板简介
 
* ucasthesis 为撰写中国科学院大学**本**、**硕**、**博**学位论文和[**任意高校博后**](https://github.com/mohuangrui/ucasthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98#%E5%A6%82%E4%BD%95%E5%A1%AB%E5%86%99%E5%8D%9A%E5%A3%AB%E5%90%8E%E7%9A%84-frontinfotex-)报告的 LaTeX 模版。ucasthesis 提供了简单明了的**模板使用说明.pdf**。无论你是否具有 LaTeX 使用经验，都可较为轻松地使用以完成学位论文的撰写和排版。谢谢大家的测试、反馈和支持，我们一起的努力让 ucasthesis 非常荣幸地得到了国科大本科部陆晴老师、本科部学位办丁云云老师和中科院数学与系统科学研究院吴凌云研究员的支持，并得到吴凌云学长在 [CTEX](http://www.ctex.org/HomePage) 的发布。

* 考虑到许多同学可能缺乏 LaTeX 使用经验，ucasthesis 将 LaTeX 的复杂性高度封装，开放出简单的接口，以便轻易使用。同时，对用 LaTeX 撰写论文的一些主要难题，如制图、制表、文献索引等，进行了详细说明，并提供了相应的代码样本，理解了上述问题后，对于初学者而言，使用此模板撰写学位论文将不存在实质性的困难。所以，如果你是初学者，请不要直接放弃，因为同样为初学者的我，十分明白让 LaTeX 简单易用的重要性，而这正是 ucasthesis 所追求和体现的。

* 此中国科学院大学学位论文模板 ucasthesis 基于中科院数学与系统科学研究院吴凌云研究员的 CASthesis 模板发展而来。当前 ucasthesis 模板满足最新的中国科学院大学学位论文撰写要求和封面设定。兼顾操作系统：Windows、Linux、MacOS；LaTeX 编译引擎：pdflatex、xelatex、lualatex；文献编译引擎：bibtex、biber (biblatex)；文献样式：著者-出版年制（authoryear）、顺序编码制（numbers）、上标顺序编码制（super）、字符编码制（alpha）。支持中文书签、中文渲染、中文粗体显示、拷贝 PDF 中的文本到其他文本编辑器等特性（[Windows 系统 PDF 拷贝乱码的解决方案需见：字体配置](https://github.com/mohuangrui/ucasthesis/wiki/%E5%AD%97%E4%BD%93%E9%85%8D%E7%BD%AE)）。此外，对模板的文档结构进行了精心设计，撰写了编译脚本提高模板的易用性和使用效率。

* ucasthesis 的目标在于简化学位论文的撰写，利用 LaTeX 格式与内容分离的特征，模板将格式设计好后，作者可只需关注论文内容。 同时，ucasthesis 有着整洁一致的代码结构和扼要的注解，对文档的仔细阅读可为初学者提供一个学习 LaTeX 的窗口。此外，模板的架构十分注重通用性，事实上，ucasthesis 不仅是国科大学位论文模板，同时，通过少量修改即可成为使用 LaTeX 撰写中英文文章或书籍的通用模板，并为使用者的个性化设定提供了接口。

## 重要通知

* `2021-09-27` 模板样式进行了修改，请查看下面的修改描述，以决定是否需要更新。

## 更新记录

* `2021-09-27` [benkwoook, issue #359](https://github.com/mohuangrui/ucasthesis/issues/359)，增强 artratex.sty，提供去掉“引言”类章节的章节编号的功能。

* `2021-03-30` 更新原创性声明和使用声明页。移除英文封面声明中的 "the"。

* `2020-07-28` [Tony, issue #299](https://github.com/mohuangrui/ucasthesis/issues/299)，更新 bibtex 样式。文献样式更多讨论可见：[文献样式](https://github.com/mohuangrui/ucasthesis/wiki/%E6%96%87%E7%8C%AE%E6%A0%B7%E5%BC%8F)。

* `2020-07-22` [hushidong, zepinglee, issue #296](https://github.com/mohuangrui/ucasthesis/issues/296)，完善 biblatex 和 bibtex 样式。

* `2020-07-17` [GitatHub, hushidong, issue #296](https://github.com/mohuangrui/ucasthesis/issues/296)，更新 bibtex 国标样式 [gbt7714-bibtex-style](https://github.com/CTeX-org/gbt7714-bibtex-style) ，增加 biblatex 国标样式 [biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)。

* `2020-05-22` [lipcaty, issue #281](https://github.com/mohuangrui/ucasthesis/issues/281) 修复 ctex 移除 xeCJKfntef 后对 ulem 的加载。

* `2020-03-20` [zepinglee, issue #250](https://github.com/mohuangrui/ucasthesis/issues/250) 增加 LaTeX 和依赖宏包版本检测功能。

* `2020-02-11` [ck2019ML, issue #182](https://github.com/mohuangrui/ucasthesis/issues/182)、[univeryinli, issue #229](https://github.com/mohuangrui/ucasthesis/issues/229) 将 ucasthesis 在 [Overleaf](https://github.com/mohuangrui/ucasthesis/wiki/字体配置#linuxoverleaf-系统的字体配置) 发布并支持调用外部字体，详见[字体配置](https://github.com/mohuangrui/ucasthesis/wiki/字体配置)。[xiaokongkong, issue #231](https://github.com/mohuangrui/ucasthesis/issues/231)修正几个书写。

* `2020-01-09` [NineSH, issue #223](https://github.com/mohuangrui/ucasthesis/issues/223) 修复`bicaption`错误。

* `2019-12-06` 移除 commit 中的二进制文件，以极大减少 Fork 后的文件大小。

* `2019-10-12` [huiwenzhang, issue #198](https://github.com/mohuangrui/ucasthesis/issues/198) 修复`mainmatter`下`\chapter*`的页眉错误。

* `2019-10-12` [Fancy0609, muzimuzhi, issue #195](https://github.com/mohuangrui/ucasthesis/issues/195) 调整由`AutoFakeBold`控制的伪粗体加粗程度。

* `2019-10-11` [Pantrick, issue #190](https://github.com/mohuangrui/ucasthesis/issues/190) 采用 [muzimuzhi](https://github.com/muzimuzhi) 提供的方法实现`\advisor{}`和`\institute{}`的自动换行功能。

* `2019-08-01` [vectorliu, issue #183](https://github.com/mohuangrui/ucasthesis/issues/183) 修改英文模式下的`plain`选项为`scheme=plain`以消除对`Algorithm`样式的修改。

* `2019-06-15` [HaorenWang, issue #177](https://github.com/mohuangrui/ucasthesis/issues/177) 调整矢量、矩阵、张量字体样式。

* `2019-06-09` [DRjy, issue #170](https://github.com/mohuangrui/ucasthesis/issues/170) 轻微缩减目录中编号与标题的间距；[e71828, issue #174](https://github.com/mohuangrui/ucasthesis/issues/174) 轻微增加页眉中编号与标题的间距。

* `2019-05-25` [CDMA2019, issue #169](https://github.com/mohuangrui/ucasthesis/issues/169) 提供横排图表环境下页眉页脚的横排，具体使用见 [横排图表](https://github.com/mohuangrui/ucasthesis/wiki/横排图表)。

* `2019-04-24` 拓展模版兼容 [博后报告](https://github.com/mohuangrui/ucasthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98#%E5%A6%82%E4%BD%95%E5%A1%AB%E5%86%99%E5%8D%9A%E5%A3%AB%E5%90%8E%E7%9A%84-frontinfotex-)。修复 [gsp2014, issue #156](https://github.com/mohuangrui/ucasthesis/issues/156) 文献引用中的连字符的间断显示和上标引用中逗号下沉。

* `2019-04-19` 修复 [nihaomiao, issue #117](https://github.com/mohuangrui/ucasthesis/issues/117)`\mathbf`失效问题。

* `2019-04-16` 修复国际生需要的`plain`模式下无法改变英文章标题字体大小的问题。

* `2019-04-09` 对部分宏命令进行调整，无功能及样式上的修改。若需更新，建议参考 [更新指南](https://github.com/mohuangrui/ucasthesis/wiki/更新指南)。

* `2019-04-04` [liuy334, songchunlin, issue #134](https://github.com/mohuangrui/ucasthesis/issues/134) ，调整行距使`LaTeX`版与`Word`版的行数和每行字数相一致。

* `2019-03-28` [zssasa, allenwoods, issue #49](https://github.com/mohuangrui/ucasthesis/issues/49) ，修复`bicaption`对`longtable`的兼容性。[BowenHou, issue #133](https://github.com/mohuangrui/ucasthesis/issues/133) ，使下划线能对长标题自动换行。

* `2019-03-25` [DRjy, muzimuzhi, issue #127](https://github.com/mohuangrui/ucasthesis/issues/127) ，为`摘要`等无需在目录中显示的结构元素建立书签。[muzimuzhi, issue #130](https://github.com/mohuangrui/ucasthesis/issues/130) ，修正对`\voffset`的使用。

* `2019-03-14` [opt-gaobin, issue #121](https://github.com/mohuangrui/ucasthesis/issues/121) ，修正中文标点使下划线断掉的问题。[Guoqiang Zhang, email; weili-ict, issue #120](https://github.com/mohuangrui/ucasthesis/issues/120) ，修复`\proofname`命令对2015年及更早`LaTeX`编译器的兼容性问题。

* `2019-02-20` [opt-gaobin, issue #100](https://github.com/mohuangrui/ucasthesis/issues/100) ，增加定理、定义、证明等数学环境。[DRjy, issue #102](https://github.com/mohuangrui/ucasthesis/issues/102) ，调整`\mathcal`字体样式。[zike Liu, email] ，适当缩减目录列表的缩进。[xiaoyaoE, issue #105](https://github.com/mohuangrui/ucasthesis/issues/105) ，使数字字体和英文字体一致。完善中文版和国际版之间的中英格式切换。

* `2019-01-10` [mnpengjk, issue #57](https://github.com/mohuangrui/ucasthesis/issues/57) ，将公式编号前加点纳入模版默认，更多讨论可见：[琐屑细节](https://github.com/mohuangrui/ucasthesis/wiki/琐屑细节) 。[yunyun2019, issue #95](https://github.com/mohuangrui/ucasthesis/issues/95)，更新文献样式。[邵岳林, email] ，将附录复原为常规的排版设置，若需将附录置于参考文献后，请见：[琐屑细节](https://github.com/mohuangrui/ucasthesis/wiki/琐屑细节)。

* `2018-04-03` 根据国科大本科部陆晴老师和本科部学位办丁云云老师的复审审核建议再次修复一些样式细节问题。

* `2018-04-02` 模板进行了重大更新，修复了样式、字体、格式等许多问题。

    * 根据国科大本科部陆晴老师的建议对模版样式进行了诸多拓展和修正，并完善对本科生论文元素的兼容性。
    * 在 [ctex](https://github.com/CTeX-org/ctex-kit) 开发者的帮助下解决了如何多次调用`Times New Roman`而不导致黑体调用错误的问题。[twn1993, email]，修复默认黑体为微软雅黑而不是`SimHei`的问题。
    * 繁复折腾测试后终于找出一个在`ctex`默认黑体替换粗宋体设定环境内全局`AutoFakeBold`失效状态下折衷特定字体库不全条件下生僻字显示和系统默认字重不全条件下粗宋体显示以及不同操作系统下如何平衡上述字库自重矛盾还有根据操作系统自动调用所带有的`Times`字体的方案。
    * 设定论文封面据英文学位名如自动切换。密级据是否填写自动显示。

* `2018-03-22` 演示表标题居表上，加粗图表标注，设置长图表标题悬挂缩进（由于`bicaption`宏包无法正确接受`caption`宏包的`margin`选项，图表中英标题第一行无法正确同步缩进，从而放弃第一行的缩进），强调多图中子图标题的规范使用，通过摘要和符号列表演示标题不在目录中显示却仍在页眉中显示。[赵永明, email]，设置双语图表标题和`bicaption`不在图形列表和表格列表中显示英文标题。

* `2018-03-21` [zhanglinbo, issue #42](https://github.com/mohuangrui/ucasthesis/issues/42) ，使用 [xiaoyao9933](https://github.com/xiaoyao9933/UCASthesis) 制作的`ucas_logo.pdf`使学校`logo`放大不失真。[Starsky Wong, issue #41](https://github.com/mohuangrui/ucasthesis/issues/41) ，设置标题英文设为`Times New Roman`。[will0n, issue #29](https://github.com/mohuangrui/ucasthesis/issues/29) ，[Man-Ting-Fang, issue #26](https://github.com/mohuangrui/ucasthesis/issues/26) ，[diyiliaoya, issue #12](https://github.com/mohuangrui/ucasthesis/issues/12) ，和 [赵永明, email] ，矫正一些格式细节问题。[tangjie1992, issue #30](https://github.com/mohuangrui/ucasthesis/issues/30) ，配置算法环境。

* `2018-02-04` 在 [ctex](https://github.com/CTeX-org/ctex-kit) 开发者的帮助下修复误用字体命令导致的粗宋体异常。然后，将模板兼容性进一步扩展为兼容操作系统`Windows`，`Linux`，`MacOS`和`LaTeX `编译引擎`pdflatex`，`xelatex`，`lualatex`。移除`microtype`宏包以提高编译效率。

* `2018-01-28` 基于国科大`2018`新版论文规范进行了重大修改，采用新的封面、声明、页眉页脚样式。展示标题中使用数学公式。

* `2017-05-14` [赵永明, email] ，增加`\citepns{}`和`\citetns{}`命令提供上标引用下混合非上标引用的需求。[臧光明, email] ，添加设定论文为`thesis`或`dissertation`的命令。

