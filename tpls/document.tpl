\documentclass[9pt]{extarticle}

\usepackage{geometry}
\usepackage[table]{xcolor}
{{if $.Cfg.Debug.ShowFrame}}\usepackage{showframe}{{end}}
\usepackage{adjustbox}
\usepackage{amssymb}
\usepackage{array}
\usepackage{blindtext}
\usepackage{calc}
\usepackage{colortbl}
\usepackage{dashrule}
\usepackage{expl3}
\usepackage{fontspec}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{leading}
\usepackage{makecell}
\usepackage{marginnote}
\usepackage{multido}
\usepackage{multirow}
\usepackage{pgffor}
\usepackage{setspace}
\usepackage[table]{xcolor}
\usepackage{tabularx}
\usepackage{tikz}
\usepackage{varwidth}
\usepackage{wrapfig}

\setmainfont{Open Sans Medium} 
\definecolor{mediumGray}{gray}{0.6}
\definecolor{whiteColor}{rgb}{1,1,1}

\hypersetup{
    {{- if not .Cfg.Debug.ShowLinks}}hidelinks=true{{end -}}
}


\geometry{paperwidth={{.Cfg.Layout.Paper.Width}}, paperheight={{.Cfg.Layout.Paper.Height}}}
\geometry{
  top={{.Cfg.Layout.Paper.Margin.Top}},
  bottom={{.Cfg.Layout.Paper.Margin.Bottom}},
  left={{.Cfg.Layout.Paper.Margin.Left}},
  right={{.Cfg.Layout.Paper.Margin.Right}},
  marginparwidth={{.Cfg.Layout.Paper.MarginParWidth}},
  marginparsep={{.Cfg.Layout.Paper.MarginParSep}}
}

\pagestyle{empty}
{{if $.Cfg.Layout.Paper.ReverseMargins}}\reversemarginpar{{end}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\parindent=0pt
\fboxsep0pt

\begin{document}

{{template "macro.tpl" .}}

  {{range .Pages -}}
    \include{ {{- .Name -}} }
  {{end}}
\end{document}
