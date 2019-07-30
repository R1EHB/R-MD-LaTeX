# Run the little R test scripts
# install.packages("rmarkdown", repos="https://cloud.r-project.org")

library(rmarkdown)
library("knitr")

# LaTeX test

knit ("KnitRCheck.Rnw")
# render ("KnitRCheck.Rnw",output_format = "pdf_document")
system ("pdflatex KnitRCheck.tex")

# Markdown Test

# Maps

# install.packages("maps",repos="https://cloud.r-project.org")
knit ("KnitRtest.Rmd")
# render ("KnitRtest.Rmd", output_format ="html_document")


# Chi-Squred

knit("KnitRtest2.Rmd")
# render ("KnitRtest2.Rmd", output_format ="pdf_document")

