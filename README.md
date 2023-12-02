# latex-yearly-planner

PDF planner designed for e-ink devices.

Fork of [Latex Yearly Planner](https://github.com/kudrykv/latex-yearly-planner/)

### Install Dependencies

1. [Go Language](https://go.dev/dl/) en [Install](https://go.dev/doc/install)
2. [MixTek](https://miktex.org/download) & [PDFLaTeX](https://www.latex-project.org/get/)

## Generate the Planner

> cd latex-yearly-planner
> 
> set PLANNER_YEAR=2024

> go run cmd/plannergen/plannergen.go --config "cfg/base.yaml,cfg/rm2.base.yaml,cfg/template_months_on_side.yaml,cfg/rm2.mos.default.yaml,cfg/rm2.mos.default.dailycal.yaml"

This generates all .tex files

> cd out
> pdflatex rm2.mos.default.dailycal.tex
 

! If you want to use custom fonts, add the fontspec package to tpls/document.tpl and set a main font to use

    \usepackage{multido} #this is the current existing last package in the list
    \usepackage{fontspec}

    \setmainfont{Open Sans Medium} 

Then use xelatex to compile instead of pdflatex
> xelatex rm2.mos.default.dailycal.tex

This generates the PDF file in /out

## Official instructions

From the project directory, run the following command after updating
'PLANNER_YEAR' below. This should generate the PDF in the 'out' directory.

> PLANNER_YEAR=2022 \   PASSES=2 \   CFG="cfg/rm2.mos.default.yaml,cfg/rm2.mos.default.dailycal.yaml,cfg/rm2.mos.default.dailycal.yaml" \
  NAME="MyPlanner" \
  ./single.sh

[Source](https://github.com/kudrykv/latex-yearly-planner/discussions/34#discussioncomment-3128344)
