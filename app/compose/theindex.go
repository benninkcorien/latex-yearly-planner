package compose

import (
	"fmt"

	"github.com/kudrykv/latex-yearly-planner/app/components/hyper"
	"github.com/kudrykv/latex-yearly-planner/app/components/page"
	"github.com/kudrykv/latex-yearly-planner/app/config"
)

func TheIndex(cfg config.Config, tpls []string) (page.Modules, error) {
	if len(tpls) != 1 {
		return nil, fmt.Errorf("exppected one tpl, got %d %v", len(tpls), tpls)
	}

	return page.Modules{{Cfg: cfg, Tpl: tpls[0]}}, nil
}

func CreateLink(ref, text string) string {
	return `\begin{tabular}{@{}l}
  \resizebox{!}{\myLenHeaderResizeBox}{` + hyper.Target(ref, text) + `\myDummyQ}
\end{tabular}`
}
