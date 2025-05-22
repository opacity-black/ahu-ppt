\ProvidesClass{ahu-slide}[ahu Undergraduates Thesis Slide Template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% ahu Undergraduates Thesis Slide Template %%%%%%%%
%%%%%%%%             Made by: F5Soft              %%%%%%%%
%%%%%%%%  https://github.com/F5Soft/ahu-template  %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\PassOptionsToClass{\CurrentOption}{beamer}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

%%%%%%%% 宏包 %%%%%%%%

% 中文字体
\RequirePackage{xeCJK}
\RequirePackage{ctex}
% 图形背景
\RequirePackage{tikz}
% 插图
\RequirePackage{caption}
% 表格线
\RequirePackage{booktabs}
% 数学公式
\RequirePackage{array}
\RequirePackage{mathptmx}
\RequirePackage{bm}
% 绘图
\RequirePackage{pgfplots}
% 条件编译
\RequirePackage{ifthen}

%%%%%%%% 用户自定义变量 %%%%%%%%

\newcommand{\dark}{\def\ahu@dark{true}}        % 启用深色主题
\newcommand{\nav}{\def\ahu@nav{true}}          % 启用底部导航按钮
\renewcommand{\title}[1]{\def\ahu@title{#1}}   % 标题
\renewcommand{\author}[1]{\def\ahu@author{#1}} % 作者
\newcommand{\teacher}[1]{\def\ahu@teacher{#1}} % 指导教师
\newcommand{\pubdate}[1]{\def\ahu@pubdate{#1}} % 日期

%%%%%%%% 颜色定义 %%%%%%%%

\definecolor{ahublue}{RGB}{40,100,190}        % 厦大主题蓝色
\definecolor{ahumiddleblue}{RGB}{115,170,250} % 厦大主题中蓝色
\definecolor{ahulightblue}{RGB}{200,222,255}  % 厦大主题浅蓝色

\setbeamercolor{palette primary}{bg=ahublue,fg=white}
\setbeamercolor{palette secondary}{bg=ahulightblue,fg=ahublue}
\setbeamercolor{palette tertiary}{bg=ahublue,fg=white}
\setbeamercolor{palette quaternary}{bg=white,fg=ahublue}
\setbeamercolor{structure}{bg=white,fg=ahublue}
\setbeamercolor{block title}{bg=ahublue,fg=white}
\setbeamercolor{block body}{bg=ahulightblue,fg=ahublue}

%%%%%%%% 字体定义 %%%%%%%%

% 英文默认字体
\setmainfont{Times New Roman}
\setsansfont{Arial}
% 中文默认字体
\setCJKsansfont{simhei.ttf}

%%%%%%%% 幻灯片样式 %%%%%%%%

% 主题
\usetheme{default}
\useoutertheme{infolines}
\useinnertheme{circles}
\usefonttheme[onlymath]{serif}

\setbeamersize{text margin left=5ex,text margin right=5ex} % 页边距
\renewcommand{\baselinestretch}{1.25}                       % 行距
\setlength{\parskip}{1ex}                                  % 段落间距

%%%%%%%% 封面 %%%%%%%%

\renewcommand{\maketitle}{
    % 底部导航按钮
    \ifthenelse{\isundefined{\ahu@nav}}{\setbeamertemplate{navigation symbols}{}}{}

    \ifthenelse{\isundefined{\ahu@dark}}{
        % 浅色主题封面
        \begin{frame}[plain]
            \begin{center}
                \vskip 12pt
                \includegraphics[height=25pt]{ahu-logo-text.jpg}
                \vskip -8pt
                    {\zihao{-5}\bf\songti 毕\, 业\, 答\, 辩}
                \vskip 24pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette secondary}
                    \vskip 0pt
                    \zihao{2}\ahu@title
                    \vskip 16pt
                \end{beamercolorbox}
                \vskip 12pt
                \begin{tabular}{r@{\hskip 1.5ex}l}
                    答辩人：  & \ahu@author  \\
                    指导教师： & \ahu@teacher \\
                \end{tabular}
                \vskip 12pt
                \color{gray}\zihao{-5}\ahu@pubdate
            \end{center}
        \end{frame}
    }{
        % 深色主题封面
        \setbeamercolor{background canvas}{bg=ahublue}
        \begin{frame}[plain]
            \begin{center}
                \vskip 12pt
                \includegraphics[height=25pt]{ahu-logo-white.png}
                \vskip -8pt
                    {\color{white}\zihao{-5}\bf\songti 毕\, 业\, 答\, 辩}
                \vskip 24pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette secondary}
                    \vskip 0pt
                    \zihao{2}\ahu@title
                    \vskip 16pt
                \end{beamercolorbox}
                \vskip 12pt
                \color{white}
                \begin{tabular}{r@{\hskip 1.5ex}l}
                    答辩人：  & \ahu@author  \\
                    指导教师： & \ahu@teacher \\
                \end{tabular}
                \vskip 12pt
                \zihao{6}\ahu@pubdate
            \end{center}
        \end{frame}
        \setbeamercolor{background canvas}{bg=white}
    }
}

%%%%%%%% 转场页 %%%%%%%%

\newcommand{\ahusection}[2]{
    \section{#1}
    \ifthenelse{\isundefined{\ahu@dark}}{
        % 浅色转场页
        \begin{frame}[plain]
            \vskip 64pt
            \color{gray}\zihao{-3}第\zhnumber{\thesection}部分\zihao{5}
            \vskip 20pt
            \begin{beamercolorbox}[wd=\paperwidth]{palette secondary}
                \vskip 0pt
                \hskip 28pt\color{ahublue}\zihao{2}#1
                \vskip 0.3ex
                \hskip 28pt\color{ahublue}\zihao{4}#2
                \vskip 20pt
            \end{beamercolorbox}
            \tikz[overlay,remember picture]
            \node[opacity=0.1, at=(current page.center)]
            {\hskip 388pt\includegraphics[height=0.95\paperheight]{ahu-logo-icon-hq.png}};
        \end{frame}
    }{
        % 深色转场页
        \setbeamercolor{background canvas}{bg=ahublue}
        \begin{frame}[plain]
            \vskip 64pt
            \color{white}\zihao{-3}第\zhnumber{\thesection}部分\zihao{5}
            \vskip 20pt
            \begin{beamercolorbox}[wd=\paperwidth]{palette secondary}
                \vskip 0pt
                \hskip 28pt\color{ahublue}\zihao{2}#1
                \vskip 0.3ex
                \hskip 28pt\color{ahublue}\zihao{4}#2
                \vskip 20pt
            \end{beamercolorbox}
            \tikz[overlay,remember picture]
            \node[opacity=0.1, at=(current page.center)]
            {\hskip 388pt\includegraphics[height=0.95\paperheight]{ahu-logo-icon-hq.png}};
        \end{frame}
        \setbeamercolor{background canvas}{bg=white}
    }
}
%%%%%%%% 结束页 %%%%%%%%

\newcommand{\thanksforlistening}[1]{
    \ifthenelse{\isundefined{\ahu@dark}}{
        % 浅色结束页
        \begin{frame}[plain]
            \begin{center}
                \vskip 24pt
                \color{gray}\zihao{2}THE END
                \vskip 24pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette secondary}
                    \vskip 4pt
                    \zihao{1}#1
                    \vskip 24pt
                \end{beamercolorbox}
                \vskip 8pt
                \includegraphics[height=24pt]{ahu-logo-icon-hq.png}
            \end{center}
        \end{frame}
    }{
        % 深色结束页
        \setbeamercolor{background canvas}{bg=ahublue}
        \begin{frame}[plain]
            \begin{center}
                \vskip 16pt
                \color{white}\zihao{2}THE END
                \vskip 24pt
                \begin{beamercolorbox}[wd=\paperwidth,center]{palette secondary}
                    \vskip 4pt
                    \zihao{1}#1
                    \vskip 24pt
                \end{beamercolorbox}
                \vskip 8pt
                \includegraphics[height=24pt]{ahu-logo-white.png}
            \end{center}
        \end{frame}
        \setbeamercolor{background canvas}{bg=white}
    }
}

%%%%%%%% 幻灯片页眉、页脚 %%%%%%%%

% 取消页眉
\setbeamertemplate{headline}{}
\setbeamertemplate{frametitle continuation}{}

% 帧标题
\setbeamertemplate{frametitle}{
    \nointerlineskip
    \begin{beamercolorbox}[sep=0.2cm,ht=4ex,wd=\paperwidth]{palette primary}
        \strut\hspace{2ex}\zihao{4}\insertframetitle\hspace{\fill}\raisebox{-0.15ex}{\includegraphics[height=1em]{ahu-logo-white.png}}\hspace{2ex}\strut
        \vskip -0.45ex
    \end{beamercolorbox}
}

% 页脚
\setbeamertemplate{footline}{
    \leavevmode
    \hbox{\begin{beamercolorbox}[wd=0.2\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}
            \usebeamerfont{author in head/foot}
            \ahu@author
        \end{beamercolorbox}\begin{beamercolorbox}[wd=0.6\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}
            \usebeamerfont{title in head/foot}
            \ahu@title
        \end{beamercolorbox}\begin{beamercolorbox}[wd=0.2\paperwidth,ht=2.25ex,dp=1ex,center]{section in head/foot}
            \usebeamerfont{page number in head/foot}
            \insertframenumber{} / \inserttotalframenumber\hspace*{1ex}
        \end{beamercolorbox}}
    \vskip 0pt
}

%%%%%%%% 图表 %%%%%%%%

\graphicspath{{figures/}}

\endinput
