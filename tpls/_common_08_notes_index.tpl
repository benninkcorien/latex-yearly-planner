\begin{minipage}[t][1cm]{\linewidth}  
  \medskip
  \begin{tabularx}{\linewidth}{l|X}
    \arrayrulecolor{\myColorGray}
    {{ range $note := .Body.Notes }}
      {{ $note.HyperLink }} & \myLineHeightButLine{} \\ \hline
    {{ end }}
  \end{tabularx}
\end{minipage}