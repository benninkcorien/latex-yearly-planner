{{- .Body.HeadingMOS -}}
{}\hfill%
{\renewcommand{\arraystretch}{\myNumArrayStretch} {{ .Body.Extra2.Table false }} }%
\medskip%
\myLineThick%
\marginnote{%
  \rotatebox[origin=tl]{90}{%
    \renewcommand{\arraystretch}{2}%
    \begin{tabularx}{\myLenHeaderSideMonthsWidth}{|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|Y|}
      \hline
      {{range $i, $month := .Body.SideMonths -}}
      {{$month.Display}} {{if ne $i 11}}
      & {{else}} \\{{- $.Cfg.Layout.Lengths.HeaderSideCellHeight -}} \hline {{end}}
    {{end}}
    \end{tabularx}% 
    \begin{tabularx}{\myLenHeaderSideQuartersWidth}{|Y|Y|Y|Y|}
      \hline
      {{range $i, $quarter := .Body.SideQuarters -}}
      {{$quarter.Display}} {{if ne $i 3}}
      & {{else}} \\{{- $.Cfg.Layout.Lengths.HeaderSideCellHeight -}} \hline {{end}}
    {{end}}
    \end{tabularx}%
  }%
}%
\medskip%