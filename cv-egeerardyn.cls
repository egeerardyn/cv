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


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{myRed}{cmyk}{0.15,1,1,0}
\definecolor{grayBase}{cmyk}{0.80,0.75,0.71,0.38}
\definecolor{grayBG1}{RGB}{55,65,75}
\definecolor{grayBG2}{RGB}{80,90,95}
\definecolor{grayLight}{RGB}{120,120,120}
\definecolor{grayVeryLight}{RGB}{225,225,225}
\definecolor{accent}{cmyk}{1,0,0,0}
%\definecolor{base03}{Lab}{15,-12,-12}
\definecolor{base03}{RGB}{4,32,41}
\definecolor{accentLight}{cmyk}{0.6,0,0,0}

\definecolor{accentcolor}{named}{accent} %TODO: remove
\definecolor{darkgray}{named}{grayBG2}%TODO: remove
\definecolor{gray}{named}{grayBase}%TODO: remove
\definecolor{lightgray}{named}{grayLight}%TODO: remove

\definecolor{tagline}{named}{accentLight}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{grayBG2}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Avenir Next}
\newfontfamily\thinfont[]{Avenir Next Ultra Light}
\newfontfamily\headingfont[]{Avenir Next Demi Bold}

\newfontfamily\firstNameFont[]{Avenir Next}
\newfontfamily\lastNameFont[]{Avenir Next Medium}
\newfontfamily\tagFont[]{Avenir Next}
\newfontfamily\profileFont[]{Avenir Next}
\newfontfamily\phoneFont[]{Avenir Next}
\newfontfamily\emailFont[]{Avenir Next}
\newfontfamily\addressFont[]{Avenir Next}
\newfontfamily\websiteFont[]{Avenir Next}

%TODO: add footer: VC.tex, Egon Geerardyn n/N
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Avenir Next Regular}

\newcommand{\urlFormat}[1]{\color{grayVeryLight}{#1}}

%% Profiles
\RequirePackage{fontawesome}
\RequirePackage{academicons}

\def \@profiles {}

\newcommand{\profile}[3]{\g@addto@macro\@profiles{\href{#3}{{#1~#2}}\hspace{1.0em}}} %icon,text,url
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

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  
}

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
\setlength{\sep}{3cm}

\renewcommand{\maketitle}{
  \begin{tikzpicture}[remember picture,overlay]
    \ifdefined\@cv@grids
    \draw[step=\sep,color=black,densely dotted] ($(current page.north west) + (1.5cm,-3cm)$) grid ($(current page.south east) - (1.5cm,-2cm)$);
    \fi
    \node [rectangle, fill=fillheader,color=fillheader, anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node [anchor=north] (name) at ($(current page.north) - (\sep,1.5cm)$) {%
      \fontsize{36pt}{72pt}\color{header}%
      {\firstNameFont \@firstName}$\,${\lastNameFont \@lastName}
    };
    \node [anchor=north] (tag) at (name.south) {%
      \fontsize{14pt}{20pt}\color{tagline}%
      \tagFont \@tagLine%
    };
    \node [anchor=north] (profiles) at (tag.south) {%
      \fontsize{11pt}{16pt}\color{grayVeryLight}%
      \profileFont \@profiles
    };
    \node [anchor=north west,align=right,text width=2\sep,inner sep=1mm] (personalia) at ($(current page.north) + (\sep,-1.5cm)$) {%
      \fontsize{11pt}{16pt}\color{white}%
      \addressFont \@address\\
      \phoneFont \@phone\\
      \emailFont \href{mailto:\@email}{\@email}\\
      \websiteFont \href{https://\@website}{\@website}\\
      born \@birthDate\ (\@nationality)\\
    };

    \draw[color=accentcolor,line width=2pt] (box.south west) -- (box.south east);
  \end{tikzpicture}
  \vspace{17\parskip}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \color{accentcolor} #1%
  }
  \par\vspace{\parskip}
}
\newcommand{\sectionHidden}[1]{}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

%\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
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
\RequirePackage[left=1.5cm,top=1.5cm,right=1.5cm,bottom=2.5cm,nohead,nofoot,showframe,showcrop]{geometry}
\else
\RequirePackage[left=1.5cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\fi
\RequirePackage{hyperref}
