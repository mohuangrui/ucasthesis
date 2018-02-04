%---------------------------------------------------------------------------%
%-                                                                         -%
%-                           Document Class                                -%
%-                                                                         -%
%---------------------------------------------------------------------------%
%- Copyright (C) Huangrui Mo <huangrui.mo@gmail.com> 
%- This is free software: you can redistribute it and/or modify it
%- under the terms of the GNU General Public License as published by
%- the Free Software Foundation, either version 3 of the License, or
%- (at your option) any later version.
%---------------------------------------------------------------------------%
%->> Identification
%---------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]%
\ProvidesClass{ucasthesis}[2014/10/01 v0.1 LaTeX document class]%
%---------------------------------------------------------------------------%
%->> Declare options
%---------------------------------------------------------------------------%
%-
%-> Layout
%-
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
%-
%-> Confidential info
%-
\newif\ifUCAS@mjinfo \UCAS@mjinfofalse
\DeclareOption{showmj}{%
    \UCAS@mjinfotrue%
}
%-
%-> Draft version info
%-
\newif\ifUCAS@versioninfo \UCAS@versioninfofalse
\DeclareOption{draftversion}{%
    \UCAS@versioninfotrue%
}
%-
%-> Handle non-implemented options
%-
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{ctexbook}%
}
%-
%-> Terminates all options processing
%-
\ProcessOptions\relax%
%---------------------------------------------------------------------------%
%->> Load class information
%---------------------------------------------------------------------------%
\ifUCAS@doublesided% if double-sided printing enabled
    \LoadClass[UTF8,a4paper,twoside,12pt]{ctexbook}
\else% if double-sided printing isn't enabled
    \LoadClass[UTF8,a4paper,oneside,12pt]{ctexbook}
\fi
%---------------------------------------------------------------------------%
%->> Required packages
%---------------------------------------------------------------------------%
\RequirePackage{ifxetex}% LaTeX engine detection
%---------------------------------------------------------------------------%
%->> Load class configuration
%---------------------------------------------------------------------------%
\AtEndOfPackage{% class cfg loaded after package to make preamble commands take effect
    \makeatletter
    \InputIfFileExists{Style/ucasthesis.cfg}{}{}
    \makeatother
}
%---------------------------------------------------------------------------%
%->> Page layout
%---------------------------------------------------------------------------%
%- part one -- horizontal widths
%- left side width + textwidth + right side width = paperwidth
%- left side width of [odd, even] page = [odd, even]sidemargin + 1.0in (fixed) + hoffset
%- binding side width + textwidth + nonbinding side width = paperwidth
%- binding side width of [odd, even] page = [left, right] side width
%- assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{150mm}% set required text width first
\ifUCAS@printcopy% if print copy layout enabled
    \setlength{\oddsidemargin}{10mm}% binding side width
    \setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
    \setlength{\oddsidemargin}{5mm}% left side width
    \setlength{\evensidemargin}{5mm}% ensure uniform left side width for EThesis
\fi
%- set margin for notes to zero
\setlength{\marginparwidth}{0pt}% width of margin notes
\setlength{\marginparsep}{0pt}% width of space between body text and margin notes
%- part two -- vertical heights
%- top height + textheight + bottom height = paperheight
%- top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{240mm}% set required text height first
\setlength{\voffset}{-20mm}% set a minimum header height
\setlength{\headheight}{15pt}% set a minimum header height
%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%- line spacing
\linespread{1.3}% line space setting
\raggedbottom% prevent adding vertical white space in strange places
%- default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
%---------------------------------------------------------------------------%
%->> Style control commands
%---------------------------------------------------------------------------%
%- redefine cleardoublepage to have page style argument
\renewcommand{\cleardoublepage}[1][plain]{%
    \clearpage\if@twoside\ifodd\c@page\else%
    \thispagestyle{#1}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}
%- underline
\ifxetex% use underline from xeCJKfntef
    \renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}% set underline color
    \renewcommand{\uline}[1]{\CJKunderline{#1}}% unified name
\else% use underline from ulem
    \RequirePackage{ulem}%
\fi
\newcommand{\ulenhance}[2][1pt]{% enhanced underline
    \def\ULthickness{#1}% set thickness
    \uline{#2}}
\newcommand{\ulhshift}{-3em}% horizontal shift on underline
\newcommand{\ulextend}[2][350pt]{% extend underline length
    \hbox to #1{\hfill\hspace*{\ulhshift}#2\hfill}}
%---------------------------------------------------------------------------%
%->> Titlepage
%---------------------------------------------------------------------------%
%-
%-> Chinese item commands
%-
\newcommand{\confidential}[1]{\def\UCAS@value@confidential{#1}}
\newcommand{\schoollogo}[2]{\def\UCAS@value@schoollogo{\includegraphics[#1]{#2}}}
\renewcommand{\title}[2][\UCAS@value@title]{%
    \def\UCAS@value@title{#2}
    %\def\UCAS@value@titlemark{\MakeUppercase{#1}}}
    \def\UCAS@value@titlemark{#1}}
\renewcommand{\@title}{\UCAS@value@titlemark}
\renewcommand{\author}[1]{\def\UCAS@value@author{#1}}
\newcommand{\advisor}[1]{\def\UCAS@value@advisor{#1}}
\newcommand{\advisorsec}[1]{\def\UCAS@value@advisorsec{#1}}
\newcommand{\degree}[1]{\def\UCAS@value@degree{#1}}
\newcommand{\degreetype}[1]{\def\UCAS@value@degreetype{#1}}
\newcommand{\major}[1]{\def\UCAS@value@major{#1}}
\newcommand{\institute}[1]{\def\UCAS@value@institute{#1}}
\newcommand{\chinesedate}[1]{\def\UCAS@value@chinesedate{#1}}
%-
%-> Redefine Chinese style
%-
\renewcommand{\maketitle}{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \zihao{4}\bfseries
        \ifUCAS@mjinfo
            \hfill{} {\UCAS@label@confidential \ulenhance{\ulextend[50pt]{\hspace*{-\ulhshift}\zihao{5}\UCAS@value@confidential}}}
        \else
            \hfill{} {}
        \fi

        \vspace*{\stretch{4}}

        {\UCAS@value@schoollogo}

        \vspace*{\stretch{2}}

        {\zihao{1}\bfseries\sffamily \ulenhance[2.5pt]{\UCAS@value@degree\UCAS@label@thesis}}

        \vspace*{\stretch{3}}

        {\zihao{-3}\bfseries\sffamily \ulenhance[1.5pt]{\ \UCAS@value@title\ }}

        \vspace*{\stretch{3}}

        \def\tabcolsep{1pt}
        \def\arraystretch{1.4}
        \begin{tabular}{lc}
            \UCAS@label@author & \ulenhance[1.2pt]{\ulextend{\UCAS@value@author}}\\
            \UCAS@label@advisor & \ulenhance[1.2pt]{\ulextend{\UCAS@value@advisor}}\\
            & \ulenhance[1.2pt]{\ulextend{\UCAS@value@advisorsec}}\\
            \UCAS@label@degree & \ulenhance[1.2pt]{\ulextend{\UCAS@value@degreetype\UCAS@value@degree}}\\
            \UCAS@label@major & \ulenhance[1.2pt]{\ulextend{\UCAS@value@major}}\\
            \UCAS@label@institute & \ulenhance[1.2pt]{\ulextend{\UCAS@value@institute}}\\
        \end{tabular}

        \vspace*{\stretch{5}}

        {\UCAS@value@chinesedate}

        \vspace*{\stretch{3}}
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
        \cleardoublepage[empty]
    \else
        \ifUCAS@versioninfo
            \thispagestyle{empty}
            \vspace*{\stretch{1}}
            \begin{footnotesize}
                \noindent
                Draft Version (\today)
            \end{footnotesize}
            \cleardoublepage[empty]
        \fi
    \fi
}
%-
%-> English item commands
%-
\newcommand{\englishtitle}[1]{\def\UCAS@value@englishtitle{#1}}
\newcommand{\englishauthor}[1]{\def\UCAS@value@englishauthor{#1}}
\newcommand{\englishadvisor}[1]{\def\UCAS@value@englishadvisor{#1}}
\newcommand{\englishdegree}[1]{\def\UCAS@value@englishdegree{#1}}
\newcommand{\englishthesistype}[1]{\def\UCAS@value@englishthesistype{#1}}
\newcommand{\englishmajor}[1]{\def\UCAS@value@englishmajor{#1}}
\newcommand{\englishinstitute}[1]{\def\UCAS@value@englishinstitute{#1}}
\newcommand{\englishdate}[1]{\def\UCAS@value@englishdate{#1}}
%-
%-> Redefine English style
%-
\newcommand{\makeenglishtitle}{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \linespread{1.5}
        \zihao{4}\bfseries

        \vspace*{50pt}

        {\zihao{-3}\bfseries \ulenhance[1.5pt]{\ \UCAS@value@englishtitle\ }}

        \vspace*{\stretch{2}}

        {\UCAS@label@englishstatement}

        {By}

        {\UCAS@value@englishauthor}

        {\UCAS@value@englishadvisor}

        \vspace*{\stretch{3}}

        {\UCAS@value@englishinstitute}

        \vspace*{\stretch{1}}

        {\UCAS@value@englishdate}

        \vspace*{\stretch{3}}
    \end{center}
    \clearpage
    \if@twoside
      \thispagestyle{empty}
      \cleardoublepage[empty]
    \fi
}
%---------------------------------------------------------------------------%
%->> Author's declaration
%---------------------------------------------------------------------------%
\newcommand{\makedeclaration}{%
    \cleardoublepage
    \thispagestyle{empty}
    {
        \linespread{1.5}

        \vspace*{2ex}

        \begin{center}
            {\zihao{4}\bfseries\sffamily \UCAS@value@declare@create}
        \end{center}

        {\UCAS@value@declare@creativity}

        \vspace*{3ex}

        {\hfill{} {\UCAS@value@declare@s \hspace*{14em}}}

        {\hfill{} {\UCAS@value@declare@d \hspace*{14em}}}

        \vspace*{6ex}

        \begin{center}
            {\zihao{4}\bfseries\sffamily \UCAS@value@declare@right}
        \end{center}

        {\UCAS@value@declare@rights}

        {\UCAS@value@declare@rule}

        \vspace*{3ex}

        {\hfill{} {\UCAS@value@declare@s \hspace*{10em} \UCAS@value@declare@t \hspace*{9em}}}

        {\hfill{} {\UCAS@value@declare@d \hspace*{10em} \UCAS@value@declare@d \hspace*{9em}}}

        \vspace*{3ex}
    }
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage[empty]
    \fi
}
%---------------------------------------------------------------------------%
%->> New environments
%---------------------------------------------------------------------------%
%- define chinese keywords
\newcommand{\keywords}[1]{%
    \noindent {\bfseries \UCAS@label@keywords} #1}
%- define engish keywords
\newcommand{\englishkeywords}[1]{%
    \noindent {\bfseries \UCAS@label@englishkeywords} #1}
%---------------------------------------------------------------------------%
%->> Configure table of contents
%---------------------------------------------------------------------------%
%- define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{2em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{1ex}% spacing between chapter titles
%- redefine dottedtocline from classes.dtx and latex.ltx
\renewcommand*{\@dottedtocline}[5]{% [<level>,<indent>,<numwidth>,<title>,<page>]
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M
        \leavevmode \zihao{-4}\sffamily
        \@tempdima #3\relax
        \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
        {#4}\nobreak
        \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
        \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
        \par\penalty\@highpenalty}%
    \fi
}
%- redefine l@part from book.cls to add dotted toc line
\renewcommand*{\l@part}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >-2\relax
        \addpenalty{-\@highpenalty}%
        \addvspace{2.25em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            {\leavevmode
            \zihao{4}\sffamily #1
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
            \nobreak
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \endgroup
    \fi
}
%- redefine l@chapter from book.cls to add dotted toc line
\renewcommand*{\l@chapter}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip \@chaptervspace \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \zihao{4}\sffamily
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            #1\nobreak
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi
}
%---------------------------------------------------------------------------%
\endinput

