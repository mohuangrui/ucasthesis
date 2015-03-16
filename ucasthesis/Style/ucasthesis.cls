%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** version information *********************************
%%
%% this is the "ucasthesis.cls" file for "ucasthesis" class definition
%% This file was recreated by Mo Huangrui from file(s) of the CASthesis package project.
%% $Last-modified: 16 Mar 2015 01:07:36 PM
%%
%% This program can be redistributed and/or modified under the terms
%% of the GNU Public License, version 2.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ucasthesis}
  [2014/10/01 v0.1 ucasthesis
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifUCAS@versioninfo \UCAS@versioninfofalse
\DeclareOption{draftversion}{% draft information reminder
  \UCAS@versioninfotrue%
}
\newif\ifUCAS@doublesided \UCAS@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
  \UCAS@doublesidedtrue%
}
\newif\ifUCAS@printcopy \UCAS@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
  \UCAS@doublesidedtrue% auto enable double-sided style
  \UCAS@printcopytrue%
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
\ifUCAS@doublesided% if double-sided printing enabled
  \LoadClass[cs4size,a4paper,fancyhdr,fntef,hyperref,UTF8,twoside,winfonts]{ctexbook}[2011/03/11]
\else% if double-sided printing isn't enabled
  \LoadClass[cs4size,a4paper,fancyhdr,fntef,hyperref,UTF8,oneside,winfonts]{ctexbook}[2011/03/11]
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** package infomation *********************************
%%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
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
%% set margins to minimum permitted by thesis regulations:
%% part one -- horizontal widths
\ifUCAS@printcopy% if print copy layout enabled
  \setlength{\oddsidemargin}{6.35mm}% ensure binding side at least 0.125in + 1.0in (fixed)
  \setlength{\evensidemargin}{0mm}% ensure a uniform binding width for two-sided printed copy
\else
  \setlength{\oddsidemargin}{3.175mm}% ensure binding side at least 1.125in
  \setlength{\evensidemargin}{3.175mm}% ensure a uniform left margin for EThesis when two-sided
\fi
%% set margin for notes to zero to get the maximum textwidth
\setlength{\marginparwidth}{0pt}% width of margin notes
\setlength{\marginparsep}{0pt}% width of space between body text and margin notes
%% assuming A4 paper (210mm x 297mm) and note margins as above
%% if note margins are 0, then \textwidth should be \paperwidth - 2*1.0in - \oddsidemargin
\setlength{\textwidth}{156.025mm}% text width
%% part two -- vertical heights
\setlength{\headheight}{13.6pt}% set a minimum header height
\raggedbottom
%% specifies the amount of space between paragraphs.
%% other reasonable specifications are \bigskipamount and \smallskipamount.
\setlength{\parskip}{\medskipamount}
%% line spacing
\renewcommand{\baselinestretch}{1} % this is the default line space setting
%% default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
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
%% define prechapter command
\newcommand\prechapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}
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
\renewcommand\title[2][\UCAS@value@title]{%
  \def\UCAS@value@title{#2}
  %\def\UCAS@value@titlemark{\MakeUppercase{#1}}}
  \def\UCAS@value@titlemark{#1}}
\def\@title{\UCAS@value@titlemark}
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
    \ifUCAS@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifUCAS@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** english titlepage items **********************************
%%
\newcommand\englishtitle[1]{\def\UCAS@value@englishtitle{#1}}
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
  {\prechapter{\UCAS@label@abstract}}
  {}
%% define chinese keywords
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \UCAS@label@keywords} #1}
%% define engish abstract
\newenvironment{englishabstract}
{\chapter[\UCAS@label@englishabstract]{
    \UCAS@value@englishtitle
     \vskip 5pt
     {\normalfont\zihao{4} \UCAS@value@englishauthor\\
     Directed by \UCAS@value@englishadvisortitle\ \UCAS@value@englishadvisor}
     \vskip 25pt
     \UCAS@label@englishabstract
  }}
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
    \prechapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
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
     {\prechapter{\bibname}%
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
     {\prechapter{\UCAS@label@publications}%
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
  {\prechapter{\UCAS@label@resume}}
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
  {\prechapter{\UCAS@label@thanks}}
  {}
%% nomenclature
\newenvironment{nomenclature}
  {\chapter{\UCAS@label@nomenclature}}
  {\cleardoublepage}
\setcounter{secnumdepth}{4}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file `ucasthesis.cls'.
%%%%% --------------------------------------------------------------------------------
