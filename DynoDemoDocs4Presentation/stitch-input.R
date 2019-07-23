library(knitr)
# A subset of the `mtcars` dataset: the first 6 rows and 6 columns.
kable(head(mtcars[,1:6]))
setwd("~/EYL/R LaTeX workshop/Git/R-MD-LaTeX/Dynamic documents demos for presentation")
stitch_rmd("stitch-input.R")
stitch("stitch-input.R")
