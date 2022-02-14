\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{elbioimp2}
    [2022/01/13 v2.1.0 Revised document class for Journal of Electrical Bioimpedance]

%% This document class is based on the standard 'article' class.
%% The only allowed options concern the choice of language.
%% The default language is USenglish.
\def \elbioimp@language {USenglish}
\DeclareOption{american}{\def \elbioimp@language {USenglish}}
\DeclareOption{english}{\def \elbioimp@language {UKenglish}}
\DeclareOption{UKenglish}{\def \elbioimp@language {UKenglish}}
\DeclareOption{USenglish}{\def \elbioimp@language {USenglish}}
\DeclareOption*{\ClassWarningNoLine{elbioimp}{Class option \CurrentOption
    \space is illegal in this document class}}
\ProcessOptions \relax
\LoadClass[twocolumn]{article}

%% Select language.
\RequirePackage[\elbioimp@language]{babel}

%% Additional user interface:
\newcommand{\affiliation}[1]{\footnote{#1}}
\newcommand{\elbioimpdoi}[1]{\def \elbioimp@doi {#1}}
  \def \elbioimp@doi {nnnn}
\newcommand{\elbioimpfirstpage}[1]{\def \elbioimp@firstpage {#1}}
  \def \elbioimp@firstpage {1}
\newcommand{\elbioimppublished}[1]{\def \elbioimp@publ {#1}}
  \def \elbioimp@publ {dd mmm yyyy}
\newcommand{\elbioimpreceived}[1]{\def \elbioimp@rec {#1}}
  \def \elbioimp@rec {dd mmm yyyy}
\newcommand{\elbioimpvolume}[1]{\def \elbioimp@vol {#1}}
  \def \elbioimp@vol {??}
\newcommand{\elbioimpyear}[1]{\def \elbioimp@year {#1}}
  \def \elbioimp@year {\the\year}
\newcommand{\keywords}[1]{\paragraph*{Keywords:}~~#1}
\newcommand{\shortauthor}[1]{\def \elbioimp@shortauthor {#1}}
  \def \elbioimp@shortauthor {Author's name}
\newcommand{\shorttitle}[1]{\def \elbioimp@shorttitle {#1}}
  \def \elbioimp@shorttitle {Title}

%% The graphicx package is needed for the header image.
\RequirePackage{graphicx}

%% Headers should be in a steel blue colour.
\RequirePackage{color}
\definecolor{elbioimp@blue}{rgb}{0.008, 0.439, 0.639}

%% Select a suitable font:
%% The recommendation is Calibri 10 pt, but Computer Modern Bright
%% looks quite similar. It should be available in all
%% standard TeX distributions.
\RequirePackage[enlarged-baselineskips]{cmbright}
\RequirePackage[T1]{fontenc}
\pretolerance = 2000
\tolerance = 3000   \hbadness = \tolerance

%% Specify text dimensions and margins:
\RequirePackage[a4paper,margin=1.5cm,includefoot,top=2.5cm]{geometry}
\setlength{\columnsep}{1cm}

%% Define the headers and footers:
\RequirePackage{fancyhdr}
\RequirePackage{textcomp}
\setlength{\headheight}{12.5pt}
\fancyhead[C]{\color{elbioimp@blue}\small\sl 
  \elbioimp@shortauthor: \elbioimp@shorttitle. J Electr Bioimp, 
  \elbioimp@vol, \elbioimp@firstpage--\lastpageref{VeryLastPage}, \elbioimp@year}
\fancyhead[L,R]{}
\renewcommand{\headrulewidth}{0pt}
\setlength{\footskip}{40pt}
\fancyfoot[C]{\arabic{page}}
\fancyfoot[L,R]{}
\pagestyle{fancy}

%% The front page:
\fancypagestyle{plain}{%
  \fancyhead[C]{\makebox[\headwidth]{\raisebox{-2cm}[0pt][0pt]{%
      \includegraphics[width=\textwidth]{head-banner.png}}}}%
  \fancyhead[L,R]{}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[C,R]{}%
  \fancyfoot[L]{\raisebox{10pt}{\begin{minipage}{\textwidth}\raggedright
        \color{elbioimp@blue}\footnotesize 
        \textcopyright~\elbioimp@year~Author(s).
        This is an open access article licensed under the
        Creative Commons Attribution License~4.0.
      \end{minipage}}}%
}

\RequirePackage{pageslts}

%% Modify the section headers:
\RequirePackage[tiny,noindentafter]{titlesec}
\titleformat{\section}{\bf\color{elbioimp@blue}}{\thesection}{0em}{}
\titlespacing{\section}{0pt}{*2}{*0}
\titleformat{\subsection}{\bf\color{elbioimp@blue}}{\thesubsection}{0em}{}
\titlespacing{\subsection}{10pt}{*1.5}{*0}
\titleformat{\subsubsection}{\sl\color{elbioimp@blue}}{\thesubsubsection}{0em}{}
\titlespacing{\subsubsection}{5pt}{*1}{*0}
\titlespacing{\paragraph}{2pt}{*1}{*0}
\setcounter{secnumdepth}{-1}

%% Redefine \maketitle:
\RequirePackage{ifthen}
\newcommand{\elbioimp@rule}[1]{\par
  \bigskip\noindent\rule{#1}{0.6pt}\par \bigskip
}
\renewcommand{\maketitle}{%
  \pagenumbering{arabic}%
  \setcounter{page}{\elbioimp@firstpage}
  \twocolumn[%
    \vspace{1.2cm}
    \begin{NoHyper}
      \begin{minipage}{0.7\textwidth}
        \raggedright 
        {\fontsize{25}{20pt}\fontseries{sb}\selectfont
          \color{elbioimp@blue}\@title\par}
      \renewcommand{\and}{, }
      \def \@makefntext##1{\@thefnmark. \textit{##1}}
      \renewcommand{\footnoterule}{}
      \renewcommand{\thempfootnote}{\arabic{mpfootnote}}
    \end{minipage}
  \end{NoHyper}

  \begin{flushright}
    \color{elbioimp@blue}\small
    \textbf{Created by \@author}\\
    Publication date: \@date
  \end{flushright}
    \elbioimp@rule{\textwidth}
  ]
  \thispagestyle{plain}
}

%% Specify caption layout:
\RequirePackage[margin=5mm,footnotesize]{caption}

%% Redefine 'abstract':
\renewenvironment{abstract}
  {\section*{\abstractname}\small}
  {\elbioimp@rule{\columnwidth}}

%% Reduce font size in the bibliography:
%%\AtBeginDocument{\renewcommand{\bibfont}{\normalfont\small}}

%% Load package to balance columns on the last page:
\IfFileExists{pbalance.sty}{\RequirePackage{pbalance}}{}
%% (It is a recent package which may not be available in
%% all installations.)

%% Finally, introduce hypertext references:
\RequirePackage[colorlinks=false,pdfborder={0 0 0}]{hyperref}
\urlstyle{sf}

\endinput
