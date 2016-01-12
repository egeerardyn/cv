\ProvidesClass{cv-egeerardyn}[2016/01/09 CV class]
\NeedsTeXFormat{LaTeX2e}
% Based upon Adrien Friggeri's CV which is BSD-licensed:
%
% # License
% Copyright (C) 2012, Adrien Friggeri
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption{grids}{\def\@cv@grids{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

%% Version Control
\input{vc.tex}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{myRed}{cmyk}{0.15,1,1,0}
\definecolor{grayBase}{cmyk}{0.80,0.75,0.71,0.38}
\definecolor{grayDark}{RGB}{55,65,75}
\definecolor{grayBG}{RGB}{80,90,95}
\definecolor{grayLight}{RGB}{120,120,120}
\definecolor{grayVeryLight}{RGB}{225,225,225}
\definecolor{accent}{cmyk}{1,0,0,0}
\definecolor{base03}{RGB}{4,32,41}
\definecolor{accentLight}{cmyk}{0.6,0,0,0}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}


\colorlet{footer}{grayLight}
\colorlet{headerline}{accent}
\colorlet{headings}{accent}
\ifdefined\@cv@print
  \colorlet{tagline}{accent}
  \colorlet{fillheader}{grayVeryLight}
  \colorlet{header}{grayDark}
  \colorlet{personalia}{header}
  \colorlet{profiles}{gray}
\else
  \colorlet{tagline}{accentLight}
  \colorlet{fillheader}{grayBG}
  \colorlet{header}{white}
  \colorlet{personalia}{header}
  \colorlet{profiles}{grayVeryLight}
\fi
\colorlet{phone}{personalia}
\colorlet{address}{personalia}
\colorlet{email}{personalia}
\colorlet{birth}{profiles}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}


\newfontfamily\bodyfont[]{Avenir Next}
\newfontfamily\thinfont[]{Avenir Next Ultra Light}
\newfontfamily\headingfont[]{Avenir Next Demi Bold}

\newcommand{\firstNameFont}{}
\newcommand{\lastNameFont}{\bfseries}
\newcommand{\tagFont}{\textbf}
\newcommand{\phoneFont}{ }
\newcommand{\emailFont}{ }
\newcommand{\addressFont}{ }
\newcommand{\websiteFont}{ }
\newcommand{\profileFont}{ }

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Avenir Next}[UprightFont={* Regular},BoldFont={* Medium},BoldItalicFont={* Demi Bold}]
\setmonofont[Scale=MatchLowercase]{Source Code Pro}


\newcommand{\urlFormat}[1]{\color{grayVeryLight}{#1}}

%% Profiles
\RequirePackage{fontawesome}
\RequirePackage{academicons}

\def \@profiles {}
\newcommand{\profile}[3]{\g@addto@macro\@profiles{\hlink{{#1~#2}}{#3}\hspace{1.0em}}} %icon,text,url
\newcommand{\profileGithub}[1]{\profile{\faicon{github}}{#1}{https://github.com/#1}} %username
\newcommand{\profileLinkedIn}[1]{\profile{\faicon{linkedin}}{#1}{https://www.linkedin.com/in/#1}} %username
\newcommand{\profileFacebook}[1]{\profile{\faicon{facebook}}{#1}{https://www.facebook.com/#1}}
\newcommand{\profileStackOverflow}[2]{\profile{\faicon{stack-overflow}}{#1}{http://stackoverflow.com/users/#2}} %username, userid
\newcommand{\profileResearchGate}[1]{\profile{\protect{\aiicon{researchgate}}}{#1}{https://www.researchgate.net/profile/#1}} %username

%%%%%%%%%%
% Header %
%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{calc}

\def\firstName#1{\gdef\@firstName{#1}}
\def\lastName#1{\gdef\@lastName{#1}}
\def\tagLine#1{\gdef\@tagLine{#1}}
\def\address#1{\gdef\@address{#1}}
\def\birthDate#1{\gdef\@birthDate{#1}}
\def\birthPlace#1{\gdef\@birthPlace{#1}}
\def\nationality#1{\gdef\@nationality{#1}}
\def\maritalStatus#1{\gdef\@maritalStatus{#1}}
\def\email#1{\gdef\@email{#1}}
\def\phone#1{\gdef\@phone{#1}}
\def\website#1{\gdef\@website{#1}}

\newlength{\sep}
\setlength{\sep}{0.1666666\columnwidth}
\setlength{\sep}{3cm} % this is approx 1/6 \columnwidth

\renewcommand{\maketitle}{
  \begin{tikzpicture}[remember picture,overlay]
    
    \node [rectangle, fill=fillheader,color=fillheader,anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node [anchor=north] (name) at ($(current page.north) - (\sep,1.5cm)$) {%
      {\fontsize{36pt}{72pt}\color{header}\textrm
      {\firstNameFont \@firstName}$\,${\lastNameFont \@lastName}}
    };
    \node [anchor=north] (tag) at (name.south) {%
      {\fontsize{14pt}{20pt}\color{tagline}\tagFont%
       \@tagLine}
    };
    \node [anchor=north] (profiles) at (tag.south) {%
      \fontsize{11pt}{16pt}\color{profiles}\textrm%
      \profileFont \@profiles
    };
    \node [anchor=north west,align=right,text width=2\sep,inner sep=1mm] (personalia) at ($(current page.north) + (\sep,-1.5cm)$) {%
      \fontsize{11pt}{16pt}\color{personalia}%
      \bodyfont
      \ifdefined\@address%
        \addressFont\color{address} \@address\\
      \fi%
      \ifdefined\@phone
        \phoneFont\color{phone} \@phone\\
      \fi
      \ifdefined\@email
        \emailFont\color{email} \hlink{\@email}{mailto:\@email}\\
      \fi
      \ifdefined\@website
        \websiteFont\color{website} \hlink{\@website}{http://\@website}\\
      \fi
      \ifdefined\@birthDate
        \textcolor{birth}{born \@birthDate\ (\@nationality)}\\
      \fi
    };

    \draw[color=headerline,line width=2.5pt] (box.south west) -- (box.south east);
    \ifdefined\@cv@grids
      \draw[step=\sep,color=black,densely dotted,opacity=0.5] ($(current page.north west) + (1.5cm,-3cm)$) grid ($(current page.south east) - (1.5cm,-2cm)$);
    \fi
  \end{tikzpicture}
  \vspace{2.25cm}
}

\newcommand{\jobTitle}[1]{\textbf{\emph{#1}}}
\newcommand{\note}[1]{\color{grayLight}#1}
\newcommand{\jobLocation}[1]{\color{grayLight}#1}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
%\RequirePackage{parskip}
\setlength{\parindent}{0cm}
\setlength{\parskip}{1.5em plus 1.5em minus 0.5em}

\renewcommand{\section}[1]{
  {%
    \par%
    \LARGE\headingfont%
    \color{headings} #1%
    \par%
  }
}
\newcommand{\sectionHidden}[1]{}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headings} #2%
  \par\vspace{.25\parskip}%
}


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{#3}{}{#3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\ifdefined\@cv@grids
  \RequirePackage[left=1.5cm,top=1.5cm,right=1.5cm,bottom=2.5cm,showframe,nohead,showcrop]{geometry}
  \newcommand{\maybeLine}{\hline}
\else
  \RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead]{geometry}
  \newcommand{\maybeLine}{ }
\fi


%% HEADER
\RequirePackage{lastpage} %http://tex.stackexchange.com/questions/34149/bibtex-references-not-compiling-because-of-lastpage-package
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{\hspace{\sep}\textcolor{footer} {\VCDateISO} {\thinfont\color{grayVeryLight}(\VCRevision)}}
\cfoot{}
\rfoot{\textcolor{footer}{CV --- \@firstName~\textbf{\@lastName} --- \textbf{\thepage}/\pageref{LastPage}}}

\RequirePackage{hyperref}

% http://tex.stackexchange.com/questions/27258/how-do-i-write-underline-text-but-with-a-dotted-line
\newcommand{\udensdot}[1]{%
    \tikz[baseline=(todotted.base)]{
        \node[inner sep=1pt,outer sep=0pt,text width={}] (todotted) {\vphantom{jg}#1}; %phantom with a descender to make the line appear at a constant height across links
        %reset text width to empty to avoid inheriting this property when nested inside another tikzpicture!
        \draw[densely dotted] (todotted.south west) -- (todotted.south east);
    }%
}%

\newcommand{\hlink}[2]{\udensdot{\href{#2}{#1}}}

%% Custom commands
% see also awesome-cv
\RequirePackage{tabu}
\RequirePackage{longtable}
\RequirePackage{multirow}
\newcommand{\keyword}[1]{\textbf{#1}}
\newcommand{\code}[1]{\texttt{#1}}

%\RequirePackage{array}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

%TODO: fix vertical alignment of notes (probably with multicolumn & multirow)
%TODO: organize different colors/fonts better

% http://tex.stackexchange.com/questions/117655/keeping-two-rows-on-one-page-using-longtable
%% define experience and education
% usage: \addJob[note]{DATERANGE}{TITLE}{COMPANY}{DESCRIPTION}
\newcommand{\addEducation}[5][]{
  {#2} & \jobTitle{#3} & \jobLocation{#4}\\*[0.25em] \maybeLine
  \parbox{\sep}{\note{#1}} & \multicolumn{2}{@{}l}{\parbox{5\sep}{#5}}\\[\parskip] \maybeLine
}
\newcommand{\addJob}[5][]{
  {#2} & \jobTitle{#3} & \jobLocation{#4}\\*[0.25em] \maybeLine
  \parbox{\sep}{\note{#1}} & \multicolumn{2}{@{}l}{\parbox{5\sep}{#5}}\\[\parskip] \maybeLine
}
%usage: \addText{DATERANGE}{DESCRIPTION}
%\newcommand{\addText}[3][]{
%  \parbox{\sep}{#2}        & \multicolumn{2}{@{}l}{\multirow{2}{*}{\parbox{5\sep}{#3}}}\\*
%  \parbox{\sep}{\note{#1}} & & \\[\parskip]
%}
\newcommand{\addText}[3][]{
  \parbox{\sep}{#2} & \multicolumn{2}{@{}l@{}}{\parbox{5\sep}{#3}}\\[\parskip] \maybeLine
}
\newenvironment{experience}{
  \section{experience}
  \begin{longtabu*} to \columnwidth {@{}L{\sep}@{}L{3\sep}@{}R{2\sep}@{}}
  \maybeLine
}{%
  \end{longtabu*}
  \vspace{-2\parskip}
}

\newenvironment{education}{
  \section{education}
  \begin{longtabu*} to \columnwidth {@{}L{\sep}@{}L{3\sep}@{}R{2\sep}@{}}
  \maybeLine
}{%
  \end{longtabu*}
  \vspace{-2\parskip}
}

%% define languages
% usage: \addLanguage{LANG}{LEVEL}{Description}
\newcommand{\addLanguage}[3]{\textbf{#1} & #2 & #3\\ \maybeLine}
\newenvironment{languages}{%
  \section{languages}
  \begin{longtabu*} to \columnwidth {@{}L{\sep}@{}L{\sep}@{}L{4\sep}@{}}%
  \maybeLine
}{%
  \end{longtabu*}%
  \vspace{-\parskip}
}


