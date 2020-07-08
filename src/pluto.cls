% 
% pluto.cls for study note
%

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{pluto}[2019/06/01 v0.10 custom study note]
\def\version{v0.10}
\LoadClass[10pt, openany, oneside]{book}

% 中文断行
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

% 引入包
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\RequirePackage{ifplatform}
\RequirePackage{xcolor}
\RequirePackage{listings}       
\RequirePackage{appendix}
\RequirePackage{fourier}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{array}            % awesomebox依赖项
\RequirePackage{fontawesome5}     % awesomebox依赖项
\RequirePackage{ifthen}           % awesomebox依赖项
\RequirePackage{xcolor}           % awesomebox依赖项
\RequirePackage{xparse}           % awesomebox依赖项
\RequirePackage{awesomebox}
\RequirePackage{subfigure}
\RequirePackage{inputenc}         % 调整表格间距引入
% \usepackage{caption}


% 加载字体
% http://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf
% 在 Windows 下 TEX Live 提供的字体会自动为 XeTEX 所用，只要通过字体名称就可以了。
% 
% 在 Unix 系统中安装了 xetex 软件包,需要进行额外的配置。
\ifwindows
  \setmainfont{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
\else
  \ifmacosx
  \setCJKmainfont{Songti SC}
  \setCJKsansfont{Source Han Sans Light}[BoldFont = Source Han Sans Bold , ItalicFont = Wawati SC]  % 设置正文无衬线族的 CJK 字体
  \setCJKmonofont{Source Han Sans Light}                                                                 % 设置正文等宽族的 CJK 字体
  \newfontfamily\monaco{Monaco}
  \newfontfamily\menlo{Menlo}
  \else
    \setCJKmainfont[AutoFakeBold=true]{simsun.ttc}
    \newCJKfontfamily{\heiti}{simhei.ttf}
    \setmainfont[
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
    ]{times.ttf}
  \fi
\fi

% 设置边距
\geometry{
    a4paper,
    top            = 2.0cm,
    bottom         = 1.0cm,
    left           = 2.0cm,
    right          = 2.0cm,
    headsep        = 1.0cm,
}

% 自定义颜色
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\definecolor{verylightgray}{rgb}{.97,.97,.97}

% 配置listings 代码样式 %        
%% 字体配置 %% 
\lstdefinestyle{codefonts}{
  basicstyle   = \footnotesize\monaco\footnotesize,
  stringstyle  = \color{codepurple}\ttfamily\small,
  keywordstyle = \color{magenta},
  commentstyle = \color{codegreen},
  escapechar   = `,                            % 中文逃逸字符，用于中英混排
}

%% 配置选项 %%
\lstdefinestyle{codeconf}{
  keepspaces         = true,                  % tells the package not to drop spaces to fix column alignment and always converts tabulators to spaces.
  breakatwhitespace  = false,                 % If true, it allows line breaks only at white space.
  showstringspaces   = false,                 % lets blank spaces in strings appear or as blank spaces.
  showspaces         = false,                 % lets all blank spaces appear or as blank spaces.
  showtabs           = false,
  captionpos         = b,                     % specifies the positions of the caption: top and/or bottom of the listing.
  breaklines         = true,                  % activates or deactivates automatic line breaking of long lines.
}

%% 层配置 %% 
\lstdefinestyle{codelayout}{
  backgroundcolor    = \color{verylightgray},
  tabsize            = 4,
  columns            = fullflexible,
  framexleftmargin   = 5pt,
}
%% 标题配置 %%
\lstdefinestyle{codecaption}{
  numberbychapter   = ture,
  abovecaptionskip  = 10pt,                  % is the vertical space respectively above  each caption
  belowcaptionskip  = 10pt,                  % is the vertical space respectively below each caption
}

%% 间距配置 %%
\lstdefinestyle{codegeometry}{
  aboveskip   = 2em,
  belowskip   = 1em,
}

%% 行号配置 %%
\lstdefinestyle{codenumbers}{
  numbers     = left,
  numberstyle = \tiny,
  numbersep   = 5pt,                        % is the distance between number and listing.
  firstnumber = 1,
  stepnumber  = 5,
}
%% 加重 %%
\lstdefinestyle{codeemph}{
  emph       = {}                           % 添加字符
  emphstyle  = \bfseries
}

%% 代码默认样式 %%
\lstdefinestyle{defaultstyle}{
  style = codelayout,
  style = codeconf,
  style = codefonts,
  style = codegeometry,
  style = codecaption,
}

%% shell %%
\lstdefinelanguage{cshell}{
  language = {sh},
  style    = {defaultstyle},
  morekeywords={git, php, cd, for, if, else, then, fi, echo, case, in, jcmd, java, jps, javac, javap, javadoc, jstat, jstatd
      elif, esac, for, do, done, tar, while, until, shift, configure, uptime, top, free, vmstat, ps, mvn, telnet,
      mv, mkdir, ;;, \$\#, \$1, \$2},
}

%% java %%
\lstdefinestyle{cjava}{
  language = {Java},
  style = {defaultstyle},
}

%% php %%
\lstdefinestyle{cphp}{
  language = {php},
  style = {defaultstyle},
}

%% shell %%
\lstdefinestyle{cshell}{
  language = {cshell},
  style = {defaultstyle},
}

\lstset{style=defaultstyle}              % 自定义代码样式

%% 定义新命令 %% 
\renewcommand{\lstlistingname}{code snippet}

% hyperref
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,      
    urlcolor=blue,
}

\parindent 2pt                                                              % 段落缩进距离  
\parskip 10pt                                                               % 段落间的距离
\raggedright                                                                % 段落左对齐
\renewcommand{\baselinestretch}{1.3}                                        %正文行距
\graphicspath{ {images/} }

% 使用titlesec定制章节
\titleformat{\chapter}{\raggedright\Huge\bfseries\filcenter}{第\,\thechapter\,章}{1em}{}
\titlespacing{\chapter}{0cm}{1em}{1em}
\titleformat{\section}{\raggedright\Large\bfseries}{\,\thesection\,}{1em}{}
\titleformat{\subsection}{\raggedright\large\bfseries}{\,\thesubsection\,}{1em}{}

\titlespacing{\chapter}{0bp}{-30bp}{12bp}       % 标题间距
\titlespacing{\section}{0bp}{0bp}{12bp}
\titlespacing{\subsection}{0bp}{12bp}{0bp}
\titlespacing{\subsubsection}{0bp}{12bp}{0bp}

% 脚注编号带圈
\renewcommand\thefootnote{\ding{\numexpr171+\value{footnote}}}

\newcommand{\nft}{\fontsize{9pt}{9pt}\selectfont}                     % 9pt字体
\newcommand{\nftt}[1]{\qquad\nft{#1}}                                 % 带前置空格的9pt字体

% 设置表格标题在底部
% \captionsetup[table]{position=bottom}

\renewcommand{\contentsname}{\centerline{目 录}}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
\renewcommand{\indexname}{索引}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}








