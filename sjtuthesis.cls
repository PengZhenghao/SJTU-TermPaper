%# -*- coding: utf-8-unix -*-
%==================================================
%% sjtuthesis.cls for SJTU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sjtuthesis}[2017/02/19 v0.9.5 Shanghai Jiao Tong University Template]
\def\version{v0.9.5}

\newif\ifmultiauthorflag\multiauthorflagfalse
\newif\ifsjtu@project\sjtu@projectfalse
\newif\ifsjtu@bachelor\sjtu@bachelorfalse
\newif\ifsjtu@master\sjtu@masterfalse
\newif\ifsjtu@doctor\sjtu@doctorfalse
\newif\ifsjtu@review\sjtu@reviewfalse
\newif\ifsjtu@submit\sjtu@submitfalse
\DeclareOption{project}{\sjtu@projecttrue}
\DeclareOption{bachelor}{\sjtu@bachelortrue}
\DeclareOption{master}{\sjtu@mastertrue}
\DeclareOption{doctor}{\sjtu@doctortrue}
\DeclareOption{review}{\sjtu@reviewtrue}
\DeclareOption{submit}{\sjtu@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,UTF8,scheme=chinese]{ctexbook}
\ifsjtu@bachelor\relax\else
  \ifsjtu@master\relax\else
    \ifsjtu@doctor\relax\else
     \ifsjtu@project\relax\else
      \ClassError{sjtuthesis}%
      		{You have to specify one of thesis options: project, bachelor, master or doctor.}{}
     \fi
    \fi
  \fi
\fi


%% sjtuthesis.cls segments
% 0. Import sjtuthesis.cfg
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands. 
% 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
% 4. Draw the sjtuthesis

%==========
% Segment 0. Import sjtuthesis.cfg 
%==========

%% 导入 sjtuthesis.cfg 文件
\AtEndOfClass{\input{sjtuthesis.cfg}}


%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage[centering,a4paper,body={16cm,22cm}]{geometry} %设置版面
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{fontspec}
\RequirePackage{metalogo,doc}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{booktabs}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm,mathrsfs} 
\RequirePackage{upgreek}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\DeclareCiteCommand{\citen} %加入一个水平引用函数
  {[\usebibmacro{cite:init}%直接添加方括号
   \usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{cite:comp}}
  {}
  {\usebibmacro{cite:dump}%
   \usebibmacro{postnote}]}
\RequirePackage{xcolor}
\RequirePackage{wasysym}
\RequirePackage{listings}
\RequirePackage[xetex, bookmarksnumbered, colorlinks, urlcolor=black, linkcolor=black, citecolor=black, plainpages=false, pdfstartview=FitH]{hyperref}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{tikz}
\RequirePackage{xparse}
\usetikzlibrary{shapes.geometric, arrows}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
    
% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% upper math letter
\newcommand{\me}{\mathrm{e}} 
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

\def\cleardoublepage{\clearpage%
	\if@openright%
	  \ifodd
	    \c@page%
	  \else%
  	    \thispagestyle{empty}%
  	    \hbox{}%
	    \newpage%
	  \fi%
	\fi}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX} 

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% Declare command for customized font size
\DeclareDocumentCommand\setfontsize{mo}{\IfValueTF{#2}{\fontsize{#1}{#2}}{\fontsize{#1}{2\dimexpr#1}}\linespread{1}\selectfont\relax}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in sjtuthesis
%==========

% Set the mainfont
%\setmainfont{TeX Gyre Termes}

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{contentsname={\sjtu@contentsname}}
\ctexset{listfigurename={\sjtu@listfigurename}}
\ctexset{listtablename={\sjtu@listtablename}}
\floatname{algorithm}{\sjtu@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{输入:}} 
\renewcommand{\algorithmicensure}{\textbf{输出:}}
\renewcommand{\listalgorithmname}{\sjtu@listalgorithmname}
\renewcommand{\lstlistingname}{\sjtu@value@listingname}

% Title Settings at the chapter Level
\ctexset{chapter={
	nameformat={\Large\bfseries},
	titleformat={\Large\bfseries},
	beforeskip={15\p@},
	afterskip={12\p@},
	}
}
% Title Settings at the section Level
\ctexset{section={
	format={\large\bfseries},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
	format={\bfseries\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
	format={\normalfont\normalsize},
	indent={0\ccwd},
	afterskip={1.0ex \@plus .2ex},
	}
}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in caption and bicaption pacakge
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font=small}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}

\DeclareCaptionOption{bi-first}[]{
    \def\tablename{\sjtu@tablename}
    \def\figurename{\sjtu@figurename}

}
\DeclareCaptionOption{bi-second}[]{
    \def\tablename{Table}
    \def\figurename{Figure}

}

% Ref https://github.com/weijianwen/SJTUThesis/issues/186
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法的编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand{\theequation}{\arabic{chapter}--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}--\arabic{figure}}
\renewcommand\p@subfigure{\thefigure}
\renewcommand{\thetable}{\arabic{chapter}--\arabic{table}}
\renewcommand{\thealgorithm}{\arabic{chapter}--\arabic{algorithm}}

% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\sjtu@label@algo~}[chapter]
  \newtheorem{thm}{\sjtu@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\sjtu@label@lem~}
  \newtheorem{prop}[thm]{\sjtu@label@prop~}
  \newtheorem{cor}[thm]{\sjtu@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\sjtu@label@defn~}[chapter]
  \newtheorem{conj}{\sjtu@label@conj~}[chapter]
  \newtheorem{exmp}{\sjtu@label@exmp~}[chapter]
  \newtheorem{rem}{\sjtu@label@rem~}
  \newtheorem{case}{\sjtu@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\sjtu@label@thm~}
  \newtheorem{blem}[thm]{\sjtu@label@lem~}
  \newtheorem{bprop}[thm]{\sjtu@label@prop~}
  \newtheorem{bcor}[thm]{\sjtu@label@cor~}
  \renewcommand{\proofname}{\bf\sjtu@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions add Switch statement to LaTeX algorithmicx package
% It's based on Werner's answer on stackoverflow
% http://tex.stackexchange.com/questions/53357/switch-cases-in-algorithmic  

% New definitions
\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algnewcommand\algorithmicdefault{\textbf{default}}

% New "environments"
% using \algtext*{<env>} removes any typesetting of that command
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
%\algtext*{EndSwitch}%
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
\algtext*{EndCase}%
\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
\algtext*{EndDefault}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following add some extra commands to LaTeX algorithmicx package

% Assert
\algnewcommand\algorithmicassert{\texttt{assert}}
\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the sjtuthesis
%==========

\renewcommand\maketitle[1]{%
  \pdfbookmark[0]{封~~~~面}{titlepage}
  	\make@project@cntitle \cleardoublepage
}

\newcommand\classification[1]{\def\sjtu@value@classification{#1}}
\newcommand\studentnumber[1]{\def\sjtu@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\sjtu@value@confidential{#1}}
\newcommand\school[1]{\def\sjtu@value@school{#1}}
\newcommand\chinesedegree[1]{\def\sjtu@value@chinesedegree{#1}}
\renewcommand\title[2][\sjtu@value@title]{%
  \def\sjtu@value@title{#2}
  \def\sjtu@value@titlemark{\MakeUppercase{#1}}}
  
\renewcommand\author[1]{\def\sjtu@value@author{#1}}

%\newcommand{\@multiauthor}{}
%\newcommand{\multiauthor}[1]{\renewcommand{\@multiauthor}{#1}}


\newcommand\advisor[1]{\def\sjtu@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\sjtu@value@coadvisor{#1}}
\newcommand\major[1]{\def\sjtu@value@major{#1}}
\newcommand\submitdate[1]{\def\sjtu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\sjtu@value@defenddate{#1}}
\newcommand\institute[1]{\def\sjtu@value@institute{#1}}
\newcommand\chairman[1]{\def\sjtu@value@chairman{#1}}

\newcommand\setmultiauthor{
\multiauthorflagtrue}

\newif\ifone@flag\one@flagfalse
\newif\iftwo@flag\two@flagfalse
\newif\ifthree@flag\three@flagfalse
\newif\iffour@flag\four@flagfalse
\newif\iffive@flag\five@flagfalse
\newif\ifsix@flag\six@flagfalse
\newif\ifseven@flag\seven@flagfalse
\newif\ifeight@flag\eight@flagfalse
\newif\ifnine@flag\nine@flagfalse

\NewDocumentCommand \multiauthorone{gg}
{
\def\@one@name{#1}
\def\@one@num{#2}
\one@flagtrue}

\NewDocumentCommand \multiauthortwo{gg}
{
\def\@two@name{#1}
\def\@two@num{#2}
\two@flagtrue}

\NewDocumentCommand \multiauthorthree{gg}
{
\def\@three@name{#1}
\def\@three@num{#2}
\three@flagtrue}

\NewDocumentCommand \multiauthorfour{gg}
{
\def\@four@name{#1}
\def\@four@num{#2}
\four@flagtrue}

\NewDocumentCommand \multiauthorfive{gg}
{
\def\@five@name{#1}
\def\@five@num{#2}
\five@flagtrue}

\NewDocumentCommand \multiauthorsix{gg}
{
\def\@six@name{#1}
\def\@six@num{#2}
\six@flagtrue}

\NewDocumentCommand \multiauthorseven{gg}
{
\def\@seven@name{#1}
\def\@seven@num{#2}
\seven@flagtrue}

\NewDocumentCommand \multiauthoreight{gg}
{
\def\@eight@name{#1}
\def\@eight@num{#2}
\eight@flagtrue}

\NewDocumentCommand \multiauthornine{gg}
{
\def\@nine@name{#1}
\def\@nine@num{#2}
\nine@flagtrue}



\newcommand \foo[2]{
\makebox[180pt]{ #1{}}&\makebox[180pt]{#2{}}\\
\Xhline{0.75pt}
}

\newcommand\parse
{
%~\\
\ifone@flag
\foo{\@one@name}{\@one@num}
\fi
\iftwo@flag
\foo{\@two@name}{\@two@num}
\fi
\ifthree@flag
\foo{\@three@name}{\@three@num}
\fi
\iffour@flag
\foo{\@four@name}{\@four@num}
\fi
\iffive@flag
\foo{\@five@name}{\@five@num}
\fi
\ifsix@flag
\foo{\@six@name}{\@six@num}
\fi
\ifseven@flag
\foo{\@seven@name}{\@seven@num}
\fi
\ifeight@flag
\foo{\@eight@name}{\@eight@num}
\fi
\ifnine@flag
\foo{\@nine@name}{\@nine@num}
\fi
% ~\\
 指导教师：	& \underline{\makebox[180pt]{\sjtu@value@advisor}}\\
}


% 绘制project封面页
\newcommand\make@project@cntitle[1]{%
  \cleardoublepage
  \newgeometry{body={16cm,24cm}}
  \thispagestyle{empty}
  \begin{center}
    \vspace*{37pt}
    \begin{figure}[!h]
      \centering
      \includegraphics{sjtulogo}
    \end{figure}
    \vskip 15pt
    \vskip 3pt
    \begin{figure}[!h]
     \centering
     \includegraphics[width=6cm]{sjtubadge}
    \end{figure}
    \vskip \stretch{2}
    {\kaishu\zihao{2}
    \begin{tabular}{r@{：}l}
      \sjtu@label@title &
      {\zihao{-2}\underline{\begin{minipage}{360pt}\centering\sjtu@value@title\end{minipage}}}
    \end{tabular}}
    \vskip \stretch{1}
    {\kaishu\zihao{3}
    \def\arraystretch{1.1}
\ifmultiauthorflag %多作者
      \begin{tabular}{r@{}l}    
      \parse
      \end{tabular}
\else %单作者
    \begin{tabular}{r@{：}l}

        \begin{CJKfilltwosides}{4em}\sjtu@label@author\end{CJKfilltwosides}	& \underline{\makebox[180pt]{\sjtu@value@author}} \\
        \begin{CJKfilltwosides}{4em}\sjtu@label@studentnumber\end{CJKfilltwosides} & \underline{\makebox[180pt]{\sjtu@value@studentnumber}} \\

      \begin{CJKfilltwosides}{4em}\sjtu@label@major\end{CJKfilltwosides} 	 & \underline{\makebox[180pt]{\sjtu@value@major}} \\

        \begin{CJKfilltwosides}{4em}\sjtu@label@advisor\end{CJKfilltwosides} 	 & \underline{\makebox[180pt]{\sjtu@value@advisor}} \\

      \begin{CJKfilltwosides}{4em}\sjtu@label@institute\end{CJKfilltwosides} 	 & \underline{\makebox[180pt]{\sjtu@value@institute}}
       
  \end{tabular}
       \fi
       }
      % 单作者end
      
  \end{center}
  \restoregeometry
  \cleardoublepage
}


% fancyhdr页眉页脚设置
\ifsjtu@project
	% 本科学位论文页眉页脚设置
	%% 正文页眉页脚
	\fancypagestyle{main}{
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries\pageref{last}}~页}
	  \renewcommand{\headheight}{32pt}
	}
  %% 英文大摘要
  \fancypagestyle{biglast}{
    \fancyhf{}
    \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
    \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
    \fancyfoot[C]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries\pageref{biglast}}~页}
    \renewcommand{\headheight}{32pt}
  }
	%% 开章页页眉页脚
	\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
	  \fancyhf{}
	  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
	  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
	  \fancyfoot[C]{\small 第~{\bf\thepage}~页\,共~{\bf\pageref{last}}~页}
	  \renewcommand{\headheight}{32pt}
	}
\fi

% 中英文摘要
\newenvironment{abstract}{\cleardoublepage \pdfbookmark[0]{\sjtu@label@abstract}{abstract}
\chapter*{\sjtu@value@title\vskip 20pt\sjtu@label@abstract}\markboth{\sjtu@label@abstract}{}}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@keywords} #1}
\newenvironment{englishabstract}{\cleardoublepage\pdfbookmark[0]{\sjtu@label@englishabstract}{englishabstract}
\chapter*{\sjtu@value@englishtitle\vskip 20pt\bfseries \sjtu@label@englishabstract}\markboth{\sjtu@label@englishabstract}{}}{}
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\bf\large \sjtu@label@englishkeywords} #1}

\renewcommand\tableofcontents{%
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{toc}
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}





 
\renewenvironment{thanks}
  {\chapter{\sjtu@label@thanks}}
  {}
  
\newenvironment{finish}{}{\label{last}}

\newenvironment{summary}
{\chapter*{\sjtu@label@summary\markboth{\sjtu@label@summary}{}}\addcontentsline{toc}{chapter}{\sjtu@label@summary}
}{\label{last}}

\newenvironment{symbolnote}{\chapter{\sjtu@label@symbolnote}
}{}

\newenvironment{bigabstract}
{
\setcounter{page}{1}
\fancypagestyle{biglast}{
  \fancyhf{}
  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
  \fancyfoot[C]{\small 第~{\bfseries\thepage}~页\,共~{\bfseries\pageref{biglast}}~页}
  \renewcommand{\headheight}{32pt}
}

\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}
  \fancyhead[L]{\includegraphics[width=0.22\textwidth]{figure/sjtubanner}}
  \fancyhead[R]{\nouppercase{\small\kaishu\sjtu@value@titlemark}}
  \fancyfoot[C]{\small 第~{\bf\thepage}~页\,共~{\bf\pageref{biglast}}~页}
  \renewcommand{\headheight}{32pt}
}

\chapter*{\bf\MakeUppercase{\sjtu@value@englishtitle}\vskip 20pt }
}
{\label{biglast}}

\endinput

%%
%% End of file `sjtuthesis.cls'.


\endinput
