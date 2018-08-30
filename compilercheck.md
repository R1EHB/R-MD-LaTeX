# Create simple documents to make sure your Rnw and Rmd compilers work

Follow these instructions to check that your computer has everything you need to compile LaTeX, Markdown, Rnw and Rmd files for the workshop.

## R-LaTeX test

This test will check for both the proper installation of MikTeX and the `knitr` R package. If you are comfortable using RStudio, follow the RStudio instructions.
1. Make sure you have already installed the package `knitr` in R.
1. Start up RStudio.
1. Go to Tools > Options > Sweave and change the default option for weaving Rnw documents from Sweave to `knitr`. If this does not work, you may not have installed `knitr` in R.
1. Go to File > New File > `R Sweave`.
1. Replace the contents of the new file with the code below.
1. Click "Compile PDF" and wait. A PDF document with "Hello.", a line plot, and "Goodbye." on it should appear within a minute or two.

    \documentclass{article}
    
    \begin{document}
    
    Hello.
    
    <<>>=
    set.seed(1213)
    x <- cumsum(rnorm(100))
    plot(x, type = "l")
    @
    
    Goodbye.
    
    \end{document}

If you are familiar with the R command line, you can create a plaintext file with the same code as above and save it with the file extension `.Rnw`, and then use `knit()` from R to compile to PDF.

## R-Markdown test

