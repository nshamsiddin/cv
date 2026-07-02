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

% ---- Font selection ----------------------------------------------------------
% Pick the typeface with a class option in resume.tex, e.g.
%     \documentclass[charter]{cv}
% All options ship with TeX Live and work with the pdfLaTeX CI build:
%     lmodern    Latin Modern serif ....... (default)
%     charter    XCharter serif ........... clean, very ATS-friendly
%     palatino   Palatino-style serif ..... (newpx)
%     times      Times-style serif ........ (newtx)
%     helvet     Helvetica-style sans
%     sourcesans Source Sans (sans) ....... closest to the web/Inter look
%     lato       Lato (sans)
\newcommand{\cv@font}{lmodern}
\DeclareOption{lmodern}{\renewcommand{\cv@font}{lmodern}}
\DeclareOption{charter}{\renewcommand{\cv@font}{charter}}
\DeclareOption{palatino}{\renewcommand{\cv@font}{palatino}}
\DeclareOption{times}{\renewcommand{\cv@font}{times}}
\DeclareOption{helvet}{\renewcommand{\cv@font}{helvet}}
\DeclareOption{sourcesans}{\renewcommand{\cv@font}{sourcesans}}
\DeclareOption{lato}{\renewcommand{\cv@font}{lato}}

% ---- Template selection ------------------------------------------------------
% Pick the layout/design with a class option, e.g. \documentclass[modern]{cv}
% Combine with a font, e.g. \documentclass[modern,sourcesans]{cv}
%     classic   serif, small-caps section rules ...... (default)
%     modern    uppercase headers, full-width rules, airy tech look
%     minimal   monochrome, understated, maximum ATS-safety
%     compact   dense — smaller margins/spacing for content-heavy CVs
\newcommand{\cv@template}{classic}
\DeclareOption{classic}{\renewcommand{\cv@template}{classic}}
\DeclareOption{modern}{\renewcommand{\cv@template}{modern}}
\DeclareOption{minimal}{\renewcommand{\cv@template}{minimal}}
\DeclareOption{compact}{\renewcommand{\cv@template}{compact}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[letterpaper,10pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{etoolbox}

% Load the chosen font family (no math packages needed — see \textbullet below)
\ifdefstring{\cv@font}{lmodern}{\RequirePackage{lmodern}}{}
\ifdefstring{\cv@font}{charter}{\RequirePackage{XCharter}}{}
\ifdefstring{\cv@font}{palatino}{\RequirePackage{newpxtext}}{}
\ifdefstring{\cv@font}{times}{\RequirePackage{newtxtext}}{}
\ifdefstring{\cv@font}{helvet}{\RequirePackage{helvet}\renewcommand{\familydefault}{\sfdefault}}{}
\ifdefstring{\cv@font}{sourcesans}{\RequirePackage[default]{sourcesanspro}}{}
\ifdefstring{\cv@font}{lato}{\RequirePackage[default]{lato}}{}

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
  parsep=0pt, label=\textcolor{accent}{\small\textbullet}}

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

% ==============================================================================
%  Everything above is the DEFAULT (classic) template. A template file may
%  override any of it — colors, geometry, \section format, \name/\job/\skill,
%  etc. — via \renewcommand / \titleformat / \geometry / \definecolor.
%  Adding a template = add its option above + a styles/<name>.tex file.
% ==============================================================================
\input{styles/\cv@template.tex}
