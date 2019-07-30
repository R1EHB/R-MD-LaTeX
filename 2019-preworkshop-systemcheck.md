# System Checks for EPA R-Md-LaTeX Workshop

This can be a handout or projection at the start of the workshop so attendees can troubleshoot for themselves if their packages are installed.

## R packages (`knitr`)

Run this R script to test for the installation of relevant packages.

    # R Script to Test R Install and load packages relevant for the instruction session.
    # Erik Beck, 7/30/2019
    
    Sys.getenv()
    update.packages()
    require("rmarkdown")
    require("tidyverse")
    require("knitr")
    require("lubridate")
    require("ggplot2")

Alternatively, open your preferred R console (*e.g.*, RStudio, Rgui, *etc.*) and enter: `find.package("[package-name-here]")`. The console should return the filepath to the package. Let Erik or Emily know if the console responds with `Error in find.package("knitr") : there is no package called ‘knitr’`, or some other error message.

# Troubleshooting

This section is for things that go wrong.

## Updating R
You can check your version of R by entering `R.version.string` into an R console. It should return `"R version 3.x.x (xxxx-xx-xx)"`. 

The latest version of R is 3.5.1. If you suspect your version of R is too old, you can run this script in Rgui (not RStudio):

    install.packages("installr") # `installr` package
    setInternet2(TRUE) # only for R versions older than 3.3.0
    installr::updateR() # updating R.
    # If you wish it to go faster, run: installr::updateR(T)

## `pandoc` outside of RStudio
RStudio includes `pandoc`, and when you use `knitr` from within RStudio, it calls the RStudio's internal `pandoc`. However, if you do not use RStudio, you might need to install `pandoc` separately.

You can check if you already have `pandoc` installed by using a terminal (`cmd` or `Powershell` on Windows OS) and entering `pandoc --version`. Wait a moment and the terminal should say something like `pandoc.exe 2.2.3.2`.

If you do not have `pandoc` installed and you do not have RStudio, [click here](https://pandoc.org/installing.html) and follow the instructions to install a standalone pandoc binary. You should not need administrative privileges. Ask Erik or Emily if you have any questions.
