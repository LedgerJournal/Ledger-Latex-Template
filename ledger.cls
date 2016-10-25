\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ledger}

% PACKAGES

\RequirePackage{mathptmx} % Use the Adobe Times Roman as the default text font together with math symbols from the Symbol, Chancery and Computer Modern fonts
\renewcommand{\@xpt}{11}
\renewcommand{\@xiipt}{13}
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI} % This 'sets' the font size to 11pt.  This is modified on from part of the source of size10.clo.


\RequirePackage{microtype} % Helps with overfull/underfull boxes

\setlength{\headheight}{34pt} % This is the minimum that fancyhdr asks for
\newlength{\topmarginheight} % Margin from top of page to top of text
\setlength{\topmarginheight}{2.4cm}
\newlength{\headersep} % Margin from bottom of header to top of text
\setlength{\headersep}{\topmarginheight}
\addtolength{\headersep}{-\headheight}
\addtolength{\headersep}{-1.5cm}
\RequirePackage[left=3.1cm,right=3.1cm,top=\topmarginheight,bottom=1cm,headsep=\headersep,includefoot]{geometry}

\RequirePackage{graphicx} % Used to include pictures
\graphicspath{{./images/}}

\RequirePackage{pbox} % \pbox is like \parbox but automatically determines box width

\RequirePackage{color} % used to change color of text

\RequirePackage{fancyhdr} % Allows customization of headers/footers
\renewcommand{\headrulewidth}{0pt}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \lhead{\includegraphics[height=1cm]{logoNew}}%
  \rhead{\raisebox{1cm-\height}{\begin{minipage}[t]{.48\textwidth}
\begin{flushright}
\fontsize{8pt}{8pt}\selectfont\sffamily \color{gray}SSN 2379-5980 (online) \\ DOI \\ 5195/LEDGER.2015.id
\end{flushright}
\end{minipage}}}%
}
\pagestyle{fancy}
\fancyhf{}
\lfoot{\raisebox{1cm-\height}{\includegraphics[height=8pt]{logoSmall}}}
\cfoot{\raisebox{1cm-\height}{\textbf{\thepage}}}
\rfoot{\raisebox{1cm-\height}{\begin{minipage}[t]{.48\textwidth}
\begin{flushright}
\fontsize{8pt}{8pt}\selectfont \sffamily\color{gray}SSN 2379-5980 (online) \\ DOI.5195/LEDGER.2015.id
\end{flushright}
\end{minipage}}}

\RequirePackage{fnpct} % Change default footnote/punctuation behavior

\RequirePackage{cleveref} % Used for 'smart' references

\RequirePackage[inline]{enumitem} % Allows inline lists.  Used for keywords.
\setlist{leftmargin=1.2cm,labelindent*=.6cm,itemsep=0cm,parsep=0cm,topsep=0cm}
\setlist[enumerate]{label=(\arabic*)}

\RequirePackage{endnotes} % Used for making endnotes

\RequirePackage{amsmath,amssymb} % Math

\RequirePackage{listings} % Code
\lstset{breaklines=true,basicstyle=\ttfamily\fontsize{10pt}{11pt}\selectfont,xleftmargin=1.2cm,breakindent=.6cm}


% SPACING COMMANDS

\newcommand{\blankline}{\vspace{\baselineskip}} % Adds a blank line

% Stores the length of a single space
\newlength{\spacelength}
\settowidth{\spacelength}{\ }


% FORMATTING

\setlength{\parskip}{0pt} % So that we know exactly how much space goes between different elements

% This gets rid of extra vertical spacing in the center environment
\let\oldcenter\center
\let\oldendcenter\endcenter
\renewenvironment{center}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \oldcenter
}{%
  \oldendcenter
}

% Redefines \maketitle to remove extra vertical space
\makeatletter
\let\old@maketitle\@maketitle
\renewcommand{\@maketitle}{\vskip -2em\old@maketitle\vspace{-1.5em}}
\makeatother

% Paragraph indentation
\setlength{\parindent}{.6cm}

% Centers footnotes
%\renewcommand{\footnoterule}{\noindent\hfil\rule{0.75\textwidth}{.4pt}\hfil}

% Title and authors

\RequirePackage{titling} % Allows customization of \maketitle

\renewcommand{\and}{,\ } % Command goes between author names
\renewcommand{\thanks}[1]{\footnote{\centering \fontsize{8pt}{9pt}\selectfont #1\vspace{1pt}}\thanksgap{\spacelength}} % An awkward hack to get footnote marks, punctuation, and spaces to work as desired

\pretitle{%
    \centering%
    \selectfont Ledger \LaTeX \ Template \par \blankline
    \fontsize{24pt}{28pt}\selectfont} % Title is centered and at 24pt
\posttitle{\par}
\preauthor{\vspace{13pt}\centering\fontsize{13pt}{13pt}\selectfont \setfnpct{punct-after=true,add-punct-marks=\and,before-dot-space=\spacelength,before-comma-space=\spacelength}} % Authors are centered and at 13 pt.  Continuation of awkward hack
\postauthor{\par\vspace{20pt}}
\predate{} % Removes date
\date{}
\postdate{}

% Abstract
\newlength{\abstractmargins}
\setlength{\abstractmargins}{1.2cm}
\newlength{\abstractwidth}
\setlength{\abstractwidth}{\textwidth}
\addtolength{\abstractwidth}{-2\abstractmargins}
\renewenvironment{abstract}{%
    \centering\begin{minipage}{\abstractwidth}\fontsize{10pt}{13pt}\selectfont \textbf{Abstract.}}{\end{minipage}\par}

% Body

\renewcommand{\baselinestretch}{1.13}
%\setcounter{secnumdepth}{1}
%\renewcommand\thesection{\arabic{section}}

% Keywords
\let\olditem\item
\renewcommand{\item}[1]{\olditem \mbox{#1}}
\newlength{\keywordsmargins}
\setlength{\keywordsmargins}{1cm}
\addtolength{\keywordsmargins}{\abstractmargins}
\newlength{\keywordswidth}
\setlength{\keywordswidth}{\textwidth}
\addtolength{\keywordswidth}{-2\keywordsmargins}
\newenvironment{keywords}{\vspace{9pt}
    {\centering\fontsize{10pt}{13pt}\selectfont\textsc{Key Words}\par}\vspace{6pt}
    \begin{center}\begin{minipage}{\keywordswidth}\begin{center}\begin{enumerate*}[itemjoin={\hspace{1em}},label=\arabic*.]}{\end{enumerate*}\end{center}\end{minipage}\end{center}}

% Section and subsection

\RequirePackage{titlesec} % Allows customization of \section

%
\titleformat{\section}{\fontsize{13pt}{13pt}\fontseries{b}\selectfont}{}{50em}{\thesection .\quad}
\titlespacing*{\section}{0pt}{15pt}{7pt}
\titleformat{\subsection}[runin]{\fontshape{it}\selectfont}{}{\parindent}{}[---]
\titlespacing{\subsection}{0em}{0em}{0em}

\def\appendix{
    \setcounter{section}{0}
    \renewcommand\thesection{Appendix \Alph{section}}
    \titleformat{\section}{\fontsize{13pt}{13pt}\fontseries{b}\selectfont}{}{50em}{Appendix \Alph{section}:\quad}
}

% Tables

\RequirePackage{tabularx} % Required for nontrivial tabular environments
\newcolumntype{C}{>{\centering\arraybackslash}X} % Automatically-sized centered columns

\renewcommand{\tablename}{\fontsize{10pt}{13pt}\selectfont Table} % Fixes font size of label

\setlength{\intextsep}{0pt}    % This shrinks space before and after
\setlength{\floatsep}{0pt}     % floating environments to conform
\setlength{\textfloatsep}{0pt} % with parameters

\setlength{\extrarowheight}{2pt} % With vertical centering, this effectively sets both the above and below "paragraph spacing" in tables to 1pt.

% The following redefines the tabularx environment to align with the required parameters
\let\oldtabularx\tabularx % Stores \begin{tabularx} command
\let\oldendtabularx\endtabularx % Stores \end{tabularx} command
\renewcommand{\tabularx}[2]{\centering\minipage{#1}\renewcommand*{\footnoterule}{}\fontsize{10pt}{12pt}\selectfont\oldtabularx{#1}{#2}} % tabularx is now wrapped in a minipage so that footnotes appear at the bottom of the table
\def \endtabularx {\relax} % A messy hack needed because of what I think is a bug in the tabularx package (without it, LaTeX complains on the next line that \endtabularx is not defined
\renewcommand{\endtabularx}{\vspace{-1em}\endminipage\oldendtabularx} % The vertical space is to get the footnotes to display properly

% The following redefines the footnote command in minipages so that the footnote text displays underneath the footnote symbol when wrapping to the next line
\makeatletter
\renewcommand\@makefntext[1]{%
    \fontsize{8pt}{11pt}\selectfont%
    %\parindent 1em%
    \noindent
    \hbox{\hss\@makefnmark}\ #1}\vspace{3pt}
\makeatother

\crefname{table}{Table}{Tables} % Tells \cref how to display references to tables

\newcommand{\tableheading}[1]{\pbox[c]{\textwidth}{\vspace{4pt}\fontsize{10pt}{13pt}\selectfont#1\vspace{4pt}}} % Standards ask for "table headings" to be displayed in a certain way, and so we make a command for this

% Figures

\renewcommand{\figurename}{\fontsize{10pt}{13pt}\selectfont Fig.} % In captions, changes "Figure" to "Fig." and fixes font size

\crefname{figure}{Figure}{Figures} % Tells \cref how to display references to figures

% Captions

\RequirePackage{caption} % Allows customization of captions

\captionsetup{labelsep=period,margin=1.2cm,compatibility=true} % Changes the colon after "Table X" to a period (similarly for "Fig. X") and sets appropriate margins for captions

% Redefines captions to conform with standards
\makeatletter
\let\oldcaption\caption
\def\@TABLE{table}
\def\@FIGURE{figure}
\renewcommand{\caption}[1]{%
    \ifx\@captype\@TABLE
        \vspace{15pt}
    \fi
    \oldcaption{\fontsize{10pt}{13pt}\selectfont #1}
    \ifx\@captype\@TABLE
        \vspace{6pt}
    \fi
    \ifx\@captype\@FIGURE
        \vspace{20pt}
    \fi
}
\makeatother

% Mathematics

\setlength{\abovedisplayskip}{9pt}
\setlength{\abovedisplayshortskip}{9pt}
\setlength{\belowdisplayskip}{7pt}
\setlength{\belowdisplayshortskip}{7pt}

% Endnotes

\renewcommand{\notesname}{Notes and References} % Changes the title of the section
\renewcommand\enoteformat{\fontsize{11pt}{13pt}\selectfont\rightskip=0pt \leftskip=0pt \parindent=0em
  \leavevmode\makeenmark\raggedright\vspace{5pt}} % Changes indentation
\let\oldtheendnotes\theendnotes
\def\theendnotes{
    \titleformat{\section}{\fontsize{13pt}{13pt}\fontseries{b}\selectfont}{}{50em}{}
    \oldtheendnotes
}
