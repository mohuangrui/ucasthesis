%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Huangrui Mo <huangrui.mo@gmail.com> 
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ucasthesis}
  [2014/10/01 v1.0 ucasthesis
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
\newif\ifUCAS@singlesided \UCAS@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
  \UCAS@singlesidedtrue%
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
%%%%*************************** Loadclass Infomation *********************************
%%
\ifUCAS@doublesided% if double-sided printing enabled
  \LoadClass[UTF8,a4paper,twoside,12pt]{ctexbook}
\else% if double-sided printing isn't enabled
  \LoadClass[UTF8,a4paper,oneside,12pt]{ctexbook}
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% color packages
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{Style/ucasthesis.cfg}{}{}
  \makeatother
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************
%%
%% part one -- horizontal widths
%% left side width + textwidth + right side width = paperwidth
%% left side width of [odd, even] page = [odd, even]sidemargin + 1.0in (fixed) + hoffset
%% binding side width + textwidth + nonbinding side width = paperwidth
%% binding side width of [odd, even] page = [left, right] side width
%% assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{150mm}% set required text width first
\ifUCAS@printcopy% if print copy layout enabled
  \setlength{\oddsidemargin}{10mm}% binding side width
  \setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
  \setlength{\oddsidemargin}{5mm}% left side width
  \setlength{\evensidemargin}{5mm}% ensure uniform left side width for EThesis
\fi
 %% set margin for notes to zero
\setlength{\marginparwidth}{0pt}% width of margin notes
\setlength{\marginparsep}{0pt}% width of space between body text and margin notes
%% part two -- vertical heights
%% top height + textheight + bottom height = paperheight
%% top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{240mm}% set required text height first
\setlength{\voffset}{-15mm}% set a minimum header height
\setlength{\headheight}{15pt}% set a minimum header height
%% specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%% line spacing
\renewcommand{\baselinestretch}{1.3} % line space setting
\raggedbottom % prevent adding vertical white space in strange places
%% default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%% redefine cleardoublepage to empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%% underline
\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\UCAS@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\UCASunderline{\@ifnextchar[\UCAS@underline\CJKunderline}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************** Chinese Titlepage Items ***********************************
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
\newcommand\advisorinstitute[1]{\def\UCAS@value@advisorinstitute{#1}}
\newcommand\degree[1]{\def\UCAS@value@degree{#1}}
\newcommand\degreetype[1]{\def\UCAS@value@degreetype{#1}}
\newcommand\major[1]{\def\UCAS@value@major{#1}}
\newcommand\institute[1]{\def\UCAS@value@institute{#1}}
\newcommand\chinesedate[1]{\def\UCAS@value@chinesedate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Chinese Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{4}\bfseries\songti
    \hfill{} {\UCAS@label@confidential \UCASunderline[50pt]{\zihao{5}\songti\UCAS@value@confidential}}
    \vskip \stretch{3}
      \UCAS@value@schoollogo
    \vskip \stretch{4}
      {\zihao{1}\heiti \UCAS@value@degree\UCAS@label@thesis}
    \vskip \stretch{4}
      {\zihao{3} \UCASunderline{\ \UCAS@value@title\ }}
    \vskip \stretch{6}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.4}
    %\hskip -15pt
    \begin{tabular}{lc}
      \UCAS@label@author & \UCASunderline[295pt]{\UCAS@value@author}
    \\
      \UCAS@label@advisor & \UCASunderline[295pt]{\UCAS@value@advisor}
    \\
      & \UCASunderline[295pt]{\UCAS@value@advisorinstitute}
    \\
      \UCAS@label@degree & \UCASunderline[295pt]{\UCAS@value@degreetype\UCAS@value@degree}
    \\
      \UCAS@label@major &  \UCASunderline[295pt]{\UCAS@value@major}
    \\
      \UCAS@label@institute & \UCASunderline[295pt]{\UCAS@value@institute}
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
%%%%*********************** English Titlepage Items **********************************
%%
\newcommand\englishtitle[1]{\def\UCAS@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\UCAS@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\UCAS@value@englishadvisor{#1}}
\newcommand\englishdegree[1]{\def\UCAS@value@englishdegree{#1}}
\newcommand\englishthesistype[1]{\def\UCAS@value@englishthesistype{#1}}
\newcommand\englishmajor[1]{\def\UCAS@value@englishmajor{#1}}
\newcommand\englishinstitute[1]{\def\UCAS@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\UCAS@value@englishdate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** Make English Titlepage ***********************************
%%
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{3}\bfseries
    \vspace*{20pt}
    {\UCASunderline{\ \UCAS@value@englishtitle\ }}
    \vskip \stretch{1}
    by \\
    \UCAS@value@englishauthor
    \vskip \stretch{2}
    \zihao{4}\bfseries
    \UCAS@label@englishstatement
    \vskip 30pt
    \UCAS@value@englishinstitute
    \vskip 20pt
    \UCAS@value@englishdate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** Make Author Declaration ***********************************
%%
\newcommand\makedeclaration{%
  \cleardoublepage
  \thispagestyle{empty}

  \begin{center}
      {\zihao{3}\heiti \UCAS@value@declare@create}
  \end{center}

  \UCAS@value@declare@creativity\\

  \hfill{} {\UCAS@value@declare@s \UCASunderline[70pt]{ } \ \ \UCAS@value@declare@d \UCASunderline[70pt]{ }}\\

  \vskip 150pt

  \begin{center}
      {\zihao{3}\heiti \UCAS@value@declare@right}
  \end{center}

  \UCAS@value@declare@rights

  {\heiti \UCAS@value@declare@rule}\\

  \hfill{} {\UCAS@value@declare@s \UCASunderline[70pt]{ } \ \ \UCAS@value@declare@t \UCASunderline[70pt]{ } \ \ \UCAS@value@declare@d \UCASunderline[70pt]{ }}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%****************************** New Environments **********************************
%%
%% define chinese abstract
\newenvironment{abstract}
{\chapter[\UCAS@label@abstract]{
     {\zihao{3}\heiti \UCAS@value@title}
     \vskip 25pt
     {\zihao{-3}\heiti \UCAS@label@abstract}
  }}
  {}
%% define chinese keywords
\newcommand\keywords[1]{%
    \vspace{2ex}\noindent{\zihao{4}\heiti \UCAS@label@keywords} #1}
%% define engish abstract
\newenvironment{englishabstract}
{\chapter[\UCAS@label@englishabstract]{
     {\zihao{3}\bfseries \UCAS@value@englishtitle}
     \vskip 25pt
     {\zihao{-3}\bfseries \UCAS@label@englishabstract}
  }}
  {}
%% define engish keywords
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\zihao{4}\bfseries \UCAS@label@englishkeywords} #1}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Dotted Line in TOC **********************************
%%
%% define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{2em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{8bp}% spacing between chapter titles
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
     \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par\penalty\@highpenalty}%
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
       \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip \@chaptervspace \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
