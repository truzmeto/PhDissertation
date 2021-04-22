\typeout{KSU Ph.D. Dissertation Macros, Version 2, October 6,1993}
\typeout{This is the single advisor version, }
\typeout{converted to LaTeX2e by Ben Norman (16 Jan 2003)}
\input report.cls

%---jjp: better to use geometry and setspace in document
%\makeatletter
%\oddsidemargin 0.5in \evensidemargin 0.5in
%\marginparwidth 40pt \marginparsep 10pt
%\topmargin -0.375in \headheight 12pt \headsep .708in
%\textheight 8.5in \textwidth 6in
%\footskip 0.375in
%\brokenpenalty=10000
%\renewcommand{\baselinestretch}{1.765}



% fix names  - officially these should be in Upper Case
\def\chapterprint{Chapter}
\def\appendixprint{Appendix}
\def\tableofcontentsprint{Table of Contents}
\def\listoffiguresprint{List of Figures}
\def\bibliographyprint{References}
\def\listoftablesprint{List of Tables}

% fix verbatim to be single space
\def\@verbatim{\trivlist \item[]\if@minipage\else\vskip 12pt\fi
\leftskip\@totalleftmargin\rightskip\z@
\parindent\z@\parfillskip\@flushglue\parskip\z@
\@tempswafalse \def\par{\if@tempswa\hbox{}\fi\@tempswatrue\@@par}
\obeylines \tt \baselineskip 12pt \let\do\@makeother \dospecials}

% fix chapter headings
\def\chapter{\clearpage \thispagestyle{plain} \global\@topnum\z@
\@afterindenttrue \secdef\@chapter\@schapter}

\def\@makechapterhead#1{ \vspace*{0.125in} {
 \ifnum \c@secnumdepth >\m@ne
 \begin{center}
%	\@chapapp{} \thechapter \\[12pt]
	\chapterprint{} \thechapter \\[12pt]
	\fi
	#1 \\[12pt]
 \end{center}
 \markright{}
 \nobreak } }

\def\@makeschapterhead#1{ \vspace*{0.125in} { \parindent 0pt
 \begin{center}
	#1 \\[12pt]
 \end{center}
 \markright{}
 \nobreak } }

% fix appendix
\newif\ifresetcounter
\resetcountertrue
\def\appendix{\par
\ifresetcounter
   \setcounter{chapter}{0}
  \resetcounterfalse
\fi
\setcounter{section}{0}
%\def\@chapapp{Appendix}
\def\chapterprint{\appendixprint}
\def\thechapter{\Alph{chapter}}}

% fix section headings
\def\section{\@startsection {section}{1}{\z@}{12pt}{1pt plus -1pt}{\normalsize}
}
\def\subsection{\@startsection{subsection}{2}{\z@}{12pt}{1pt plus -1pt}{\normalsize}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{12pt}{1pt plus -1pt}{\normalsize}}
\def\paragraph{\@startsection
 {paragraph}{4}{\z@}{-12pt}{-1em}{\normalsize}}
\def\subparagraph{\@startsection
 {subparagraph}{4}{\parindent}{-12pt}{-1em}{\normalsize}}

%fix add to contents lines
\def\l@chapter#1#2{\pagebreak[3]
 \vskip 1.0em plus 1pt \@tempdima 1.5em \begingroup
 \@dottedtocline{0}{0em}{1.4em}{#1}{#2}
 \endgroup}
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

% fix bibliography
\def\thebibliography#1{\chapter*{\bibliographyprint\@mkboth
 {\ }{\ }}\list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}\addcontentsline{toc}{chapter}{\bibliographyprint} }
 \def\newblock{\hskip .11em plus .33em minus -.07em}
 \sloppy
 \sfcode`\.=1000
 \renewcommand{\baselinestretch}{0.956} \large\normalsize\vspace*{12pt}
 \relax}
\let\endthebibliography=\endlist

% table of contents definitions
\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \fi\chapter*{\tableofcontentsprint\@mkboth
    {\ }{\ }}
  \addcontentsline{toc}{chapter}{\tableofcontentsprint}
  \@starttoc{toc}\if@restonecol\twocolumn\fi}

% list of figures definitions
\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \fi\chapter*{\listoffiguresprint\@mkboth
    {\ }{\ }}
 \addcontentsline{toc}{chapter}{\listoffiguresprint}
 \@starttoc{lof}\if@restonecol\twocolumn
 \fi}

% list of tables definitions
\def\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{\listoftablesprint\@mkboth
 {\ }{\ }}
 \addcontentsline{toc}{chapter}{\listoftablesprint} 
 \@starttoc{lot}\if@restonecol\twocolumn
 \fi}

% \abstract
\def\namedegreedate#1{\gdef\@namedegreedate{#1}}
\def\@namedegreedate{}
\def\pages#1{\gdef\@pages{#1}}
\def\@pages{0}
\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{}

\newif\ifabstractpage
\abstractpagefalse

\def\abstract{
      \abstractpagetrue
      \pagestyle{empty}
      \vspace*{24pt}
\renewcommand{\baselinestretch}{0.956}\small\normalsize
      \noindent
      \@namedegreedate\hfill{\uppercase\expandafter{\@area}} \\
%      {\uppercase\expandafter{\@title}}\ \hfill
      {\uppercase\expandafter{\@title}}\ (\@pages\ pp.) \hfill
         \renewcommand{\baselinestretch}{1.765}\small\normalsize\\
      Director of Dissertation: \ \ \@advisor \hfill \\[12pt]
      \indent
}

% start of SU stuff
\def\cl@chapter{\@elt{section}\@elt{footnote}}
\def\thefigure{\@arabic\c@figure}
\def\thetable{\@arabic\c@table}
%\def\theequation{\arabic{equation}}
\@addtoreset{equation}{chapter}
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\def\theequation{\thechapter.\arabic{equation}}

%---jjp this is giving problems for todo so comment for now
%\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
%   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
%      \@parmoderr\@floatpenalty\z@
%    \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
%       \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
%       \@tfor \@tempa :=#2\do
%                        {\if\@tempa h\advance\@tempcnta \@ne\fi
%                         \if\@tempa t\advance\@tempcnta \tw@\fi
%                         \if\@tempa b\advance\@tempcnta 4\relax\fi
%                         \if\@tempa p\advance\@tempcnta 8\relax\fi
%         }\global\count\@currbox\@tempcnta}\@fltovf\fi
%       \global\setbox\@currbox\vbox\bgroup
%    \def\baselinestretch{0.956}\@normalsize
%    \boxmaxdepth\z@
%    \hsize\columnwidth \@parboxrestore}
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}


\def\dept#1{\gdef\@dept{#1}}
\def\area#1{\gdef\@area{#1}}
\def\degrees#1{\gdef\@degrees{#1}}
\def\@degrees{}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
%\def\@title{}\def\@author{}\def\@dept{Mathematics and Computer Science}
\def\@title{}\def\@author{}
\def\@dept{Physics \\[-10pt] \hspace{.90in} \vspace*{.5 \baselineskip}}
\def\@area{BIOLOGICAL PHYSICS}
\def\@submitdate{\ifcase\the\month\or
  May\or May\or May\or May\or August\or August\or
  August\or August\or December\or December\or December\or December\fi
  , \number\the\year}

\newif\ifcopyright \newif\iffigurespage \newif\iftablespage
\newif\ifprefacepage

\copyrightfalse \figurespagetrue \tablespagetrue \prefacepagefalse

\def\titlep{%
	\thispagestyle{empty}%
	\begin{center}
	        %\renewcommand{\baselinestretch}{0.956}\small\normalsize
      		\renewcommand{\baselinestretch}{1.912}\small\normalsize

		\vspace*{36pt}
		\vbox to36pt{
			\begin{tabular}{c}
				\uppercase\expandafter{\@title}\\
			\end{tabular}
			\vfill
		}
		\vskip78pt
                A dissertation submitted to\\
                Kent State University in partial\\
                fulfillment of the requirements for the\\
                degree of Doctor of Philosophy\\
		\vskip78pt
		\renewcommand{\baselinestretch}{1.765}\small\normalsize
		by \\
		\vskip50pt
		\@author \\
		\vskip50pt
%		\@submitdate
                \cdate  %to get the month that I want 
                \\
               	\copyright\ Copyright \ \\
				%by\\
%		\@author\\
		\ All rights reserved \ \\
		\ Except for previously published materials \
	\end{center}
	\newpage}

\def\copyrightpage{%
	\null\vfill
	\begin{center}
		\Large\copyright\ Copyright \@copyrightyear\\
				%by\\
%		\@author\\
	All rights reserved
	\end{center}
	\vfill\newpage}

\def\signaturepage{%
	\begin{center}
		\vspace*{36pt}
		\vbox to144pt{
			Dissertation written by \\
			\@author \\
                        \@degrees \\
                        \vfill
		}
%		\vskip188pt
%                \vskip173pt
%                \vskip148pt
		\vfill
%\renewcommand{\baselinestretch}{1.500}
%                Approved by \\[12pt]
		Approved by \\[8pt]
		$\underset{\text{\small{Dr. John J. Portman}}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{Chair, Doctoral Dissertation Committee} \\[12pt]
		$\underset{\text{\small{Dr. Hamza Balci}}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{} \\[12pt]
		$\underset{\text{\small{Dr. Robin Selinger}}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{} \\[12pt]
                $\underset{\text{\small{Dr. Sanjaya Abeysirigunawardena }}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{Members, Doctoral Dissertation Committee} \\[12pt]
                $\underset{\text{\small{Dr. Heather Caldwell}}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{} \\[12pt]
		Accepted by \\[8pt]
		$\underset{\text{\small{Dr. James T. Gleeson}}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{Chair, Department of Physics} \\[12pt]
		$\underset{\text{\small{Dr. James L. Blank}}}{\underline{\hspace{7cm}}}$ , \makebox[78mm][l]{Dean, College of Arts and Sciences} \\[12pt]
%		\_\hrulefill\ , \makebox[78mm]{Chair, Doctoral Dissertation Committee~~~~} \\
%		\_\hrulefill\ , \makebox[78mm]{Members, Doctoral Dissertation Committee} \\
%		\_\hrulefill\ , \makebox[78mm]{\ } \\
%		\_\hrulefill\ , \makebox[78mm]{\ } \\
%		\_\hrulefill\ , \makebox[78mm]{\ } \\[8pt]
%		Accepted by \\[8pt]
%		\_\hrulefill\ , \makebox[78mm]{Chair, Department of \@dept} \\[8pt]
%		\_\hrulefill\ , \makebox[65mm]{Chair, Dept. of \@dept} \\[8pt]
%		\_\hrulefill\ , \parbox[t]{68mm}{\raggedright Chair, Department of \@dept}  \\[-6pt] \vspace*{\baselineskip}
%		\_\hrulefill\ , \parbox[t]{78mm}{\raggedright Chair, Department of \@dept}  \\[8pt] 
%	 \_\hrulefill\ , \makebox[78mm][l]{Dean, College of Arts and Sciences}

        \end{center}
}
\renewcommand{\baselinestretch}{1.765}


\def\prefacesection#1{%
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}
	\prefacepagetrue
}

\def\frontmatter{
  \ifabstractpage
		\newpage
	\fi
        \pagenumbering{roman}
        \pagestyle{plain}
	\titlep
	\ifcopyright\copyrightpage\fi
	\signaturepage
        \thispagestyle{empty}           %jjp: turn off pagenumbering on signature page
	\newpage
	\tableofcontents
	\newpage
	\iffigurespage
		{\addvspace{10pt}
		\let\saveaddvspace=\addvspace
		\def\addvspace##1{}
		\listoffigures
		\let\addvspace=\saveaddvspace}
		\newpage
	\fi
	\iftablespage
		{\addvspace{10pt}
		\let\saveaddvspace=\addvspace
		\def\addvspace##1{}
		\listoftables
		\let\addvspace=\saveaddvspace}
		\newpage
	\fi
}

\def\startthesis{
	\ifprefacepage
	    \newpage
        \fi
	\pagenumbering{arabic}
	\pagestyle{headings}
}


% Start with pagestyle{headings} in case front matter isn't processed
\pagestyle{headings}
\makeatother
