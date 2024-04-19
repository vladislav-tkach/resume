\ProvidesClass{resume}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage{graphicx}
\pagestyle{empty}
\usepackage{geometry}
\geometry{
	top=0.4in,
	bottom=0.4in,
	left=0.4in,
	right=0.4in,
}
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

\newcommand{\name}[1]{
    \renewcommand{\name}{#1}
}

\newcommand{\printname}{
	\begingroup
		\hspace*{\fill}
        {\huge\bfseries\name}
        \hspace*{\fill}
		\medskip\break
	\endgroup
}

\newcommand{\specialty}[1]{
    \renewcommand{\specialty}{#1}
}

\newcommand{\printspecialty}{
	\begingroup
		\hspace*{\fill}
        {\Large\underline\specialty}
        \hspace*{\fill}
		\medskip\break
	\endgroup
}

\let\ori@document=\document
\renewcommand{\document}{
	\ori@document
	\printname
    \printspecialty
}

\newenvironment{rSection}[1]{
	\medskip
	\MakeUppercase{\textbf{#1}}
	\medskip
	\hrule
	\begin{list}{}{
		\setlength{\leftmargin}{0.5em}
	}
	\item[]
}{
	\end{list}
}

\newenvironment{rSubsection}[4]{
	\textbf{#1}\hspace*{\fill}{#2}
	\ifthenelse{\equal{#3}{}}{}{
		\\
		\textit{#3}\hspace*{\fill}\textit{#4}
	}
	\smallskip
	\begin{list}{$\cdot$}{\leftmargin=1.0em \rightmargin=0.5em}
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em}
}{
	\end{list}
	\vspace{0.5em}
}
