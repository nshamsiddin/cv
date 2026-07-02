%==============================================================================
%  cv.cls — presentation/template for a single-column, ATS-friendly resume.
%  ALL styling and layout live here. Content lives in resume.tex, which only
%  calls the semantic commands defined below (\name, \role, \contact,
%  \headline, \job, \edu, the `skills`/`tight` environments).
%
%  Builds identically under pdfLaTeX (GitHub Actions / latex-action) and
%  tectonic/XeTeX. No fontawesome / no external packages beyond TeX Live.
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2026/07/02 Single-column ATS-friendly resume class]
\LoadClass[letterpaper,10pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[margin=1.35cm]{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{hyperref}

% ---- Colors (edit these to re-theme) -----------------------------------------
\definecolor{ink}{HTML}{111418}
\definecolor{accent}{HTML}{0B3D63}
\definecolor{muted}{HTML}{6B7280}
\definecolor{rule}{HTML}{C9CED6}
\AtBeginDocument{\color{ink}}

\hypersetup{colorlinks=true, urlcolor=accent, linkcolor=accent}

% ---- Page layout -------------------------------------------------------------
\pagestyle{empty}
\setlength{\parindent}{0pt}
\linespread{1.03}

% Small inline separators
\newcommand{\dt}{\textcolor{rule}{\ \textbar\ }}   % contact separator "|"
\newcommand{\md}{\,\textperiodcentered\,}          % middot "·"

% Section headings: bold small-caps + accent rule
\titleformat{\section}{\normalsize\bfseries\scshape\color{accent}}
  {}{0em}{}[\vspace{1pt}{\color{rule}\titlerule[1pt]}]
\titlespacing*{\section}{0pt}{7pt}{4pt}

% Bullet list used inside jobs
\newlist{tight}{itemize}{1}
\setlist[tight]{leftmargin=1.25em, topsep=2pt, partopsep=0pt, itemsep=2pt,
  parsep=0pt, label=\textcolor{accent}{\small$\bullet$}}

% ---- Header commands ---------------------------------------------------------
\newcommand{\name}[1]{{\Huge\bfseries\color{accent}#1}\\[3pt]}
\newcommand{\role}[1]{{\large\bfseries\color{ink!80}#1}\\[5pt]}

% \contact{email}{linkedin-display}{github-display}{location}
% Displays are shown verbatim; links are https://<display> (mailto for email).
\newcommand{\contact}[4]{{\small
  \href{mailto:#1}{#1}\dt%
  \href{https://#2}{#2}\dt%
  \href{https://#3}{#3}\dt%
  #4}\\[4pt]}

\newcommand{\headline}[1]{{\small #1}\par\vspace{3pt}{\color{accent}\hrule height 1.5pt}}

% ---- Entry commands ----------------------------------------------------------
% \job{title}{company}{dates}   then a `tight` list of bullets
\newcommand{\job}[3]{%
  \smallskip\noindent\textbf{#1}~\textcolor{accent}{\textbf{--- #2}}%
  \hfill{\footnotesize\textcolor{muted}{#3}}\par\vspace{1pt}}

% \edu{degree}{school}{dates}
\newcommand{\edu}[3]{%
  \noindent\textbf{#1} \textcolor{ink}{--- #2}%
  \hfill{\footnotesize\textcolor{muted}{#3}}\par\vspace{2pt}}

% ---- Skills rows -------------------------------------------------------------
% \skill{Label}{values} — a bold fixed-width label beside a wrapping value.
% Uses minipages (not tabularx) so it composes cleanly as a plain command.
\newlength{\skilllabel}\setlength{\skilllabel}{3.5cm}
\newcommand{\skill}[2]{%
  \noindent
  \begin{minipage}[t]{\skilllabel}\raggedright\textbf{#1}\end{minipage}%
  \hspace{0.3cm}%
  \begin{minipage}[t]{\dimexpr\linewidth-\skilllabel-0.3cm\relax}#2\end{minipage}%
  \par\vspace{3pt}}
