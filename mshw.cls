%=====================================================================
% mshw.cls
% Provide mshw.cls class
% Derived from jhwhw.cls
% https://gist.github.com/jhwilson/1278588
% http://tex.stackexchange.com/questions/31183/class-file-for-homework-assignments
%=====================================================================

%=====================================================================
% Identification
%=====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mshw}[2013/09/05 Miles Steele's Homework Class]

\LoadClass[letterpaper, 12pt]{article}
\RequirePackage{fancyhdr}
\RequirePackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{parskip}
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amsfonts, amssymb}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{empheq}
\RequirePackage{ifthen}


%=====================================================================
% Commands
%=====================================================================

\setlength{\headheight}{28pt}
% \lhead{}\chead{\@title}\rhead{\@author\\\today}
\lhead{\@acadclass\\\@title}\chead{}\rhead{\@author\\\today}
\lfoot{}\cfoot{}\rfoot{\thepage}
\pagestyle{fancy}

\newcommand{\f}[0]{\frac}
\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\p}[1]{\left(#1\right)}

% academic class variable
\newcommand\acadclass[1]{\def\@acadclass{#1}}


\ifx\pdfoutput\undefined                         %LaTeX
  \RequirePackage[ps2pdf,bookmarks=true]{hyperref}
  \hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf}
  }
\else                                            %PDFLaTeX
  \RequirePackage[pdftex,bookmarks=true]{hyperref}
  \hypersetup{ %
    pdfauthor   = {\@author},
    pdftitle    = {\@title},
    pdfcreator  = {LaTeX with hyperref package},
    pdfproducer = {dvips + ps2pdf}
  }
\pdfadjustspacing=1
\fi

% Set up counters for problems and subsections

\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]

% \renewcommand{\theProblemNum}{\arabic{ProblemNum}}
% \renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}


% \newcommand*{\anyproblem}[1]{\section*{#1}}
% \newcommand*{\problem}[1]{\stepcounter{ProblemNum} %
%    \anyproblem{Problem \arabic{ProblemNum}. #1}}

\newcommand*{\problem}[2]{
  \stepcounter{ProblemNum}
  \setcounter{ProblemNum}{#1}
  \section*{Problem \arabic{ProblemNum}. #2}
}

\newcommand*{\subproblem}[1]{
  \stepcounter{SubProblemNum}
  \subsection*{Part \arabic{ProblemNum}-\alph{SubProblemNum}. #1}
}

% \newcommand*{\soln}[1]{\subsubsection*{#1}}
% \newcommand*{\solution}{\soln{Solution}}
% \renewcommand*{\part}{\stepcounter{SubProblemNum} %
%   \soln{Part (\theSubProblemNum)}}

\renewcommand{\theenumi}{(\alph{enumi})}
\renewcommand{\labelenumi}{\theenumi}
\renewcommand{\theenumii}{\roman{enumii}}

% \def\problemmark{}

% % Typesetting problems

% % \newcommand*{\prob}[1]{\newpage \noindent \textbf{\Large #1}}
% % \newcommand*{\problem}[1]{\stepcounter{ProblemNum} \prob{Problem %
% % \theProblemNum.}}
% % \newcommand*{\soln}[1]{\\ \noindent \textbf{\Large #1}}
% % \newcommand*{\solution}{\soln{Solution}}
% % \renewcommand*{\part}{\\ \noindent \stepcounter{SubProblemNum} %
% % \textbf{\Large Part (\theSubProblemNum)}}

% \newcommand\problem{\@startsection{problem}{1}{\z@}%
%                      {-3.25ex \@plus -1ex \@minus -.2ex}%
%                      {1.5ex \@plus .2ex}%
%                      {\normalfont\large\bfseries}}
