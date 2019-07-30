# Simple tests to make sure your Rnw and Rmd compilers work

Follow these instructions to check that your computer has everything you need to compile LaTeX, Markdown, Rnw and Rmd files on your own.

## R-LaTeX test

This test will check for both the proper installation of both your TeX distribution (MikTeX if Windows OS, MacTeX if Mac OS X, TeX Live if Linux/UNIX) and the `knitr` R package. If you are comfortable using RStudio, follow the RStudio instructions.

1. Make sure you have already installed the package `knitr` in R.
1. Start up RStudio.
1. Go to Tools > Options > Sweave and change the default option for weaving Rnw documents from Sweave to `knitr`. If this does not work, you may not have installed `knitr` in R.
1. Go to File > New File > `R Sweave`.
1. Replace the contents of the new file with the code below.
1. Click "Compile PDF" and wait. A PDF document with "Hello.", a line plot, and "Goodbye." on it should appear within a minute or two.

Script:

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

If you are familiar with the R command line, you can create a plaintext file with the same code as above, save it with the extension `.Rnw`, and then use `knit()` from R to compile to PDF.

## R-Markdown test

This simple test will check that an R Markdown file will compile. It will also check for your TeX distribution (MikTeX if Windows OS, MacTeX if Mac OS X, TeX Live if Linux/UNIX) if you choose PDF as the output format.

1. Start up RStudio.
1. Go to File > New File > `R Markdown`.
1. Optional: To check for MikTeX too, choose `PDF` as the output format.
1. Click OK.
1. Click "Knit" and wait. An document should appear within a minute or two. 

## Windows OS only --- Check for MikTeX for `.tex` and `.Rnw` files

If you are using Windows OS, this is how you can check for MikTeX so that you can knit `.Rnw` files.

### Using the terminal

Open the terminal (`cmd` or `Powershell` on Windows OS) and use any of the following commands to check for MikTeX. They should all check for some version of `MikTeX`. 

- `pdflatex --version`
- `xetex --version`
- `lualatex --version`

If the terminal responds that the term is not recognized as the name of an operable program, then your system does not have, or cannot find MikTeX.

### Using TeXworks

Alternatively, if you are using a Windows OS, MikTeX probably was installed with TeXworks. You can look for `TeXworks` from your start menu, see if that opens, and compile a basic document.

    \documentclass{article}
    \begin{document}
    This here be text.
    \end{document}

Click the green circle in the task ribbon to typeset the document. If this successfully compiles a PDF, then MikTeX is working.