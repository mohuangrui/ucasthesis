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
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{ucasthesis}[2014/10/01 v1.0 LaTeX document class]%
%---------------------------------------------------------------------------%
%->> Declare options
%---------------------------------------------------------------------------%
%-
%-> Layout
%-
\newif\ifucas@singlesided \ucas@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
    \ucas@singlesidedtrue%
}
\newif\ifucas@doublesided \ucas@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
    \ucas@doublesidedtrue%
}
\newif\ifucas@printcopy \ucas@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
    \ucas@doublesidedtrue% auto enable double-sided style
    \ucas@printcopytrue%
}
%-
%-> Draft version info
%-
\newif\ifucas@versioninfo \ucas@versioninfofalse
\DeclareOption{draftversion}{%
    \ucas@versioninfotrue%
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
\ifucas@doublesided% if double-sided printing enabled
    \LoadClass[UTF8,a4paper,twoside,zihao=-4]{ctexbook}
\else% if double-sided printing isn't enabled
    \LoadClass[UTF8,a4paper,oneside,zihao=-4]{ctexbook}
\fi
%---------------------------------------------------------------------------%
%->> Required packages
%---------------------------------------------------------------------------%
\RequirePackage{ifxetex}% LaTeX engine detection
\RequirePackage{etoolbox}% a toolbox of programming facilities
\newcommand{\ucasifstreq}{\expandafter\ifstrequal\expandafter}% expansion control
\newcommand{\ucasifstrbk}{\expandafter\ifblank\expandafter}% expansion control
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
%- binding side width + textwidth + nonbinding side width = paperwidth
%- binding side width of [odd, even] page = [left, right] side width
%- left side width of [odd, even] page = 1.0in (fixed) + hoffset + [odd, even]sidemargin
%- assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{146.6mm}% set required text width first
\setlength{\hoffset}{0mm}% set horizontal offset
\ifucas@printcopy% if print copy layout enabled
    \setlength{\oddsidemargin}{12.6mm}% binding side margin
    \setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
    \setlength{\oddsidemargin}{6.3mm}% left side margin
    \setlength{\evensidemargin}{6.3mm}% ensure uniform left side width for EThesis
\fi
\setlength{\marginparwidth}{35pt}% width of margin notes
\setlength{\marginparsep}{10pt}% width of space between body text and margin notes
%- part two -- vertical heights
%- top height + textheight + bottom height = paperheight
%- top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{246.2mm}% set required text height first
\setlength{\voffset}{-17.4mm}% set vertical offset
\setlength{\topmargin}{20pt}% vertical margin above header
\setlength{\headheight}{12pt}% header height
\setlength{\headsep}{17.5pt}% vertical margin between header and body text
\setlength{\footskip}{29.5pt}% vertical margin between footer and body text
%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%- line spacing
\linespread{1.5}% line space setting
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
\newcommand{\ulhshift}{-4em}% horizontal shift on underline
\newcommand{\ulextend}[2][350pt]{% extend underline length
    \hbox to #1{\hfill\hspace*{\ulhshift}#2\hfill}}
%---------------------------------------------------------------------------%
%->> Titlepage
%---------------------------------------------------------------------------%
%-
%-> Chinese item commands
%-
\def\ucas@value@confidential{}
\newcommand{\confidential}[1]{\def\ucas@value@confidential{#1}}
\def\ucas@value@schoollogo{}
\newcommand{\schoollogo}[2]{\def\ucas@value@schoollogo{\includegraphics[#1]{#2}}}
\def\ucas@value@title{}
\def\ucas@value@titlemark{}
\renewcommand{\title}[2][\ucas@value@title]{%
    \def\ucas@value@title{#2}
    %\def\ucas@value@titlemark{\MakeUppercase{#1}}}
    \def\ucas@value@titlemark{#1}}
\renewcommand{\@title}{\ucas@value@titlemark}
\def\ucas@value@author{}
\renewcommand{\author}[1]{\def\ucas@value@author{#1}}
\def\ucas@value@advisor{}
\newcommand{\advisor}[1]{\def\ucas@value@advisor{#1}}
\def\ucas@value@advisorsec{}
\newcommand{\advisorsec}[1]{\def\ucas@value@advisorsec{#1}}
\def\ucas@value@degree{}
\newcommand{\degree}[1]{\def\ucas@value@degree{#1}}
\def\ucas@value@degreetype{}
\newcommand{\degreetype}[1]{\def\ucas@value@degreetype{#1}}
\def\ucas@value@major{}
\newcommand{\major}[1]{\def\ucas@value@major{#1}}
\def\ucas@value@institute{}
\newcommand{\institute}[1]{\def\ucas@value@institute{#1}}
\def\ucas@value@chinesedate{}
\newcommand{\chinesedate}[1]{\def\ucas@value@chinesedate{#1}}
%-
%-> Redefine Chinese style
%-
\renewcommand{\maketitle}{%
    \ucasifstreq{\ucas@value@englishdegree}{Bachelor}{%
        \def\ucas@label@thesis{\ucas@label@bacthesis}%
        \def\ucas@label@major{\ucas@label@ungradmajor}%
        \def\ucas@label@institute{\ucas@label@ungradinstitute}%
    }{%
    \ucasifstreq{\ucas@value@englishdegree}{Master}{%
        \def\ucas@label@thesis{\ucas@label@masthesis}%
        \def\ucas@label@major{\ucas@label@gradmajor}%
        \def\ucas@label@institute{\ucas@label@gradinstitute}%
    }{%
        \def\ucas@label@thesis{\ucas@label@docthesis}%
        \def\ucas@label@major{\ucas@label@gradmajor}%
        \def\ucas@label@institute{\ucas@label@gradinstitute}%
    }}%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \linespread{1.5}
        \zihao{4}\bfseries

        \hfill{} \ucasifstrbk{\ucas@value@confidential}{}{\ucas@label@confidential \ulenhance{\ulextend[50pt]{\hspace*{-\ulhshift}\zihao{5}\ucas@value@confidential}}}

        \vspace*{\stretch{4}}

        {\ucas@value@schoollogo}

        \vspace*{\stretch{2}}

        {\zihao{1}\bfseries\sffamily {\ucas@label@thesis}}

        \vspace*{\stretch{3}}

        {\zihao{-3}\bfseries\sffamily \ulenhance[1.5pt]{\ \ucas@value@title\ }}

        \vspace*{\stretch{3}}

        \def\tabcolsep{1pt}
        \def\arraystretch{1.3}
        \begin{tabular}{lc}
            \ucas@label@author & \ulenhance[1.2pt]{\ulextend{\ucas@value@author}}\\
            \ucas@label@advisor & \ulenhance[1.2pt]{\ulextend{\ucas@value@advisor}}\\
            & \ulenhance[1.2pt]{\ulextend{\ucas@value@advisorsec}}\\
            \ucas@label@degree & \ulenhance[1.2pt]{\ulextend{\ucas@value@degreetype\ucas@value@degree}}\\
            \ucas@label@major & \ulenhance[1.2pt]{\ulextend{\ucas@value@major}}\\
            \ucas@label@institute & \ulenhance[1.2pt]{\ulextend{\ucas@value@institute}}\\
        \end{tabular}

        \vspace*{\stretch{4.5}}

        {\ucas@value@chinesedate}

        \vspace*{\stretch{3.5}}
    \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \ifucas@versioninfo
            \vspace*{\stretch{1}}
            \begin{footnotesize}
                \noindent
                Draft Version (\today)
            \end{footnotesize}
        \fi
        \cleardoublepage[empty]
    \else
        \ifucas@versioninfo
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
\def\ucas@value@englishtitle{}
\newcommand{\englishtitle}[1]{\def\ucas@value@englishtitle{#1}}
\def\ucas@value@englishauthor{}
\newcommand{\englishauthor}[1]{\def\ucas@value@englishauthor{#1}}
\def\ucas@value@englishadvisor{}
\newcommand{\englishadvisor}[1]{\def\ucas@value@englishadvisor{#1}}
\def\ucas@value@englishdegree{}
\newcommand{\englishdegree}[1]{\edef\ucas@value@englishdegree{\zap@space#1 \@empty}}% expand and remove space
\def\ucas@value@englishdegreetype{}
\newcommand{\englishdegreetype}[1]{\def\ucas@value@englishdegreetype{#1}}
\def\ucas@value@englishthesistype{}
\newcommand{\englishthesistype}[1]{\def\ucas@value@englishthesistype{#1}}
\def\ucas@value@englishmajor{}
\newcommand{\englishmajor}[1]{\def\ucas@value@englishmajor{#1}}
\def\ucas@value@englishinstitute{}
\newcommand{\englishinstitute}[1]{\def\ucas@value@englishinstitute{#1}}
\def\ucas@value@englishdate{}
\newcommand{\englishdate}[1]{\def\ucas@value@englishdate{#1}}
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

        {\zihao{-3}\bfseries \ulenhance[1.5pt]{\ \ucas@value@englishtitle\ }}

        \vspace*{\stretch{2}}

        {\ucas@label@englishstatement}

        {By}

        {\ucas@value@englishauthor}

        {\ucas@value@englishadvisor}

        \vspace*{\stretch{3}}

        {\ucas@value@englishinstitute}

        \vspace*{\stretch{1}}

        {\ucas@value@englishdate}

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
        \zihao{-4}

        \vspace*{2ex}

        \begin{center}
            {\zihao{4}\bfseries\sffamily \ucas@value@declare@create}
        \end{center}

        {\ucas@value@declare@creativity}

        \vspace*{3ex}

        {\hfill{} {\ucas@value@declare@s \hspace*{14em}}}

        {\hfill{} {\ucas@value@declare@d \hspace*{14em}}}

        \vspace*{6ex}

        \begin{center}
            {\zihao{4}\bfseries\sffamily \ucas@value@declare@right}
        \end{center}

        {\ucas@value@declare@rights}

        {\ucas@value@declare@rule}

        \vspace*{3ex}

        {\hfill{} {\ucas@value@declare@s \hspace*{10em} \ucas@value@declare@t \hspace*{9em}}}

        {\hfill{} {\ucas@value@declare@d \hspace*{10em} \ucas@value@declare@d \hspace*{9em}}}

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
    \vspace{\baselineskip}
    \noindent {\bfseries \ucas@label@keywords} #1}
%- define engish keywords
\newcommand{\englishkeywords}[1]{%
    \vspace{\baselineskip}
    \noindent {\bfseries \ucas@label@englishkeywords} #1}
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

