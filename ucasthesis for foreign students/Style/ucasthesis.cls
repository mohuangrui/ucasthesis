%%%%% --------------------------------------------------------------------------------
%% This is file `ucasthesis.cls'
%% This file was recreated by Mo Huangrui from file(s) of the CASthesis package project.
%%%%% --------------------------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%%
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** version infomation *********************************
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ucasthesis}
  [2014/02/14 v0.1 ucasthesis
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifUCAS@typeinfo \UCAS@typeinfofalse
\DeclareOption{draftinfo}{% draft information reminder
  \UCAS@typeinfotrue%
}
\DeclareOption*{% handle non-implemented options
  \PassOptionsToClass{\CurrentOption}{ctexbook}%
}
%% terminates all options processing
\ProcessOptions\relax
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** loadclass infomation *********************************
%%
\LoadClass[nocap,noindent,cs4size,a4paper,fancyhdr,fntef,hyperref,UTF8,adobefonts]{ctexbook}[2011/03/11]
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** package infomation *********************************
%%
%% math packages
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ load class configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{ucasthesis.cfg}{}{}
  \makeatother
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* page layout **************************************
%%
\oddsidemargin 1.5 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 1.5 true cm
\fi
\textheight 21 true cm
\textwidth 14.5 true cm
\headheight 15pt
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* some style control commands ********************************
%%
%% redefine \cleardoublepage to handle both oneside and twoside modes
\def\cleardoublepage{%
  \clearpage%
  \if@twoside%
    \ifodd\c@page%
      % do nothing
    \else%
      \thispagestyle{empty}%
      \hbox{}%
      \newpage%
      \if@twocolumn%
        \hbox{}%
        \newpage%
      \fi%
    \fi%
  \fi}%
%% space used in items title
\newcommand\UCASspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
%% underline
\def\UCAS@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\UCASunderline{\@ifnextchar[\UCAS@underline\CTEXunderline}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************** chinese titlepage items ***********************************
%%
\newcommand\confidential[1]{\def\UCAS@value@confidential{#1}}
\newcommand\schoollogo[2]{\def\UCAS@value@schoollogo{\includegraphics[#1]{#2}}}
\renewcommand\title[1]{\def\UCAS@value@title{#1}}
\renewcommand\author[1]{\def\UCAS@value@author{#1}}
\newcommand\advisor[1]{\def\UCAS@value@advisor{#1}}
\newcommand\advisortitle[1]{\def\UCAS@value@advisortitle{#1}}
\newcommand\advisorinstitute[1]{\def\UCAS@value@advisorinstitute{#1}}
\newcommand\degree[1]{\def\UCAS@value@degree{#1}}
\newcommand\degreetype[1]{\def\UCAS@value@degreetype{#1}}
\newcommand\major[1]{\def\UCAS@value@major{#1}}
\newcommand\institute[1]{\def\UCAS@value@institute{#1}}
\newcommand\chinesedate[1]{\def\UCAS@value@chinesedate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** make chinese titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \bf\songti\zihao{4}
    \hfill{} {\bf\songti\zihao{4} \UCAS@label@confidential \UCASunderline[30pt]{\UCAS@value@confidential}}
    \vskip \stretch{3}
      \UCAS@value@schoollogo
    \vskip \stretch{4}
      {\bf\heiti\zihao{1} \UCAS@value@degree\UCAS@label@thesis}
    \vskip \stretch{4}
      {\bf\songti\zihao{3} \UCASunderline{\ \UCAS@value@title\ }}
    \vskip \stretch{6}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{lc}
      \UCAS@label@author & \UCASunderline[299pt]{\UCAS@value@author}
    \\
      \UCAS@label@advisor & \UCASunderline[299pt]{\UCAS@value@advisor\ \UCAS@value@advisortitle}
    \\
      & \UCASunderline[299pt]{\UCAS@value@advisorinstitute}
    \\
      \UCAS@label@degree & \UCASunderline[299pt]{\UCAS@value@degreetype\UCAS@value@degree}
    \\
      \UCAS@label@major &  \UCASunderline[299pt]{\UCAS@value@major}
    \\
      \UCAS@label@institute & \UCASunderline[299pt]{\UCAS@value@institute}
    \end{tabular}
    \vskip \stretch{6}
    \UCAS@value@chinesedate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifUCAS@typeinfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\UCAS@value@englishdate)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** english titlepage items **********************************
%%
\newcommand\englishtitle[2][\UCAS@value@englishtitle]{%
  \def\UCAS@value@englishtitle{#2}
  \def\UCAS@value@englishtitlemark{\MakeUppercase{#1}}}
\newcommand\englishauthor[1]{\def\UCAS@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\UCAS@value@englishadvisor{#1}}
\newcommand\englishadvisortitle[1]{\def\UCAS@value@englishadvisortitle{#1}}
\newcommand\englishdegree[1]{\def\UCAS@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\UCAS@value@englishmajor{#1}}
\newcommand\englishinstitute[1]{\def\UCAS@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\UCAS@value@englishdate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** make english titlepage ***********************************
%%
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt}
      \bf\zihao{3} \UCASunderline{\ \UCAS@value@englishtitle\ }
    \vskip \stretch{1}
    By \\
      \bf\zihao{3} \UCAS@value@englishauthor
    %\vskip \stretch{1}
      %\normalfont\zihao{4} \UCAS@label@englishadvisor
    %\vskip 3pt
      %\normalfont\zihao{4} \UCAS@value@englishadvisor
    \vskip \stretch{2}
      \bf\zihao{4} \UCAS@label@englishstatement
    \vskip 30pt
      \bf\zihao{4} \UCAS@value@englishinstitute
    \vskip 20pt
      \bf\zihao{4} \UCAS@value@englishdate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%****************************** new environments **********************************
%%
%% define chinese abstract
\newenvironment{abstract}
  {\Nchapter{\UCAS@label@abstract}}
  {}
%% define chinese keywords
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \UCAS@label@keywords} #1}
%% define engish abstract
\newenvironment{englishabstract}
{\chapter{\UCAS@label@englishabstract}}
{}
%% define engish keywords
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \UCAS@label@englishkeywords} #1}
%% redefine table of contents
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \Nchapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
%% define Nchapter command
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newenvironment{publications}[1]
     {\Nchapter{\UCAS@label@publications}%
      \@mkboth{\MakeUppercase\UCAS@label@publications}
              {\MakeUppercase\UCAS@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
\newenvironment{resume}
  {\Nchapter{\UCAS@label@resume}}
  {}
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}
\renewenvironment{thanks}
  {\Nchapter{\UCAS@label@thanks}}
  {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* set headings *************************************
%%
%% set page style by fancyhdr:
  %% The syntax is: \fancyhead[selectors]{output you want}
  %% E Even page
  %% O Odd page
  %% L Left field
  %% C Center field
  %% R Right field
  %% H Header
  %% F Footer
  %% so [CE,RO] will refer to the center of the even pages and to the right side of the odd pages.
%% configure fancy style
\pagestyle{fancy}
  %% the style for chapter and section mark
  %\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername\ \thechapter.\ #1}}{}}
  %\renewcommand{\sectionmark}[1]{\markright{\MakeUppercase{\thesection.\ #1}}}
  \fancyhf{}% clear all header and footer fields
  %% header configure:
  \fancyhead[CE]{\small \UCAS@value@englishtitlemark}% title name in header, \@title is the default value
  \fancyhead[CO]{\small \leftmark}% chapter name in header
  %% footer configure:
  \fancyfoot[CE,CO]{\small \thepage}% page number in footer at center
  %% the thickness of the decorative lines on both the header and the footer
  %\renewcommand{\headrulewidth}{0.5pt}
  %\renewcommand{\footrulewidth}{0pt}
%% Some LATEX commands, like \chapter, use the \thispagestyle command to automatically switch
%% to the plain page style, thus ignoring the page style currently in effect.
%% To customize even such pages you must redefine the plain pagestyle.
%% redefine plain style:
\fancypagestyle{plain}{%
  \fancyhf{}% remove everything
  %% header configure:
  \fancyhead[C]{\small \leftmark}% chapter name at left of odd page header
  %% the thickness of the decorative lines on both the header and the footer
  %\renewcommand{\headrulewidth}{0.5pt}% remove lines as well
  %\renewcommand{\footrulewidth}{0pt}% remove lines as well
}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file `ucasthesis.cls'.
%%%%% --------------------------------------------------------------------------------
