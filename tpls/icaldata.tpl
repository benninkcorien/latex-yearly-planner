{%
{{ if not .Large -}} \renewcommand{\arraystretch}{\myNumArrayStretch}% {{- end}}
\setlength{\tabcolsep}{\myLenTabColSep}%
%
HELLO \\

{{- $today := $.Today -}}
 
{{- $hasItems := false -}}  % Initialize a flag to track if there are matching items

{{- range $date, $summary := .EventMap }}
    {{- if eq $date $today }}
        {{- $hasItems = true -}}  % Set the flag to true if a matching item is found
    {{- end }}
{{- end }}

{{- if $hasItems }}  % Only create the itemize environment if there are items
    \begin{itemize}
        {{- range $date, $summary := .EventMap }}
            {{- if eq $date $today }}
                \item \textbf{{$today}}: {{$summary}}
            {{- end }}
        {{- end }}
    \end{itemize}
{{- end }}

{{- $specificDate := "2024-04-24 00:00:00 +0200 CEST" -}}
{{- range $date, $summary := .EventMap }}
    {{- if eq $date $specificDate }}
        \item \textbf{{$date}}: {{$summary}}
    {{- end }}
{{- end }}

 
}
