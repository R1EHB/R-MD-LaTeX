# System Checks for EPA R-Md-LaTeX Workshop

This can be a handout or projection at the start of the workshop so attendees can check for themselves that everything they need is installed.

## R packages (`knitr`)

Open your preferred R console (*e.g.*, RStudio, Rgui, *etc.*) and enter: `find.package("knitr")`

The console should return the filepath to the package.

Let Erik or Emily know if the console responds with `Error in find.package("knitr") : there is no package called ‘knitr’`, or some other error message.

## MikTeX for `.tex` and `.Rnw` files

Check for MikTeX so that you can knit `.Rnw` files as part of this workshop.

### Using the terminal
Open the terminal (`cmd` or `Powershell` on Windows OS) and use any of the following commands to check for MikTeX. They should all check for some version of `MikTeX`. 
- `pdflatex --version`
- `xetex --version`
- `lualatex --version`

Let Erik or Emily know if the terminal responds that the term is not recognized as the name of an operable program.

### Using TeXworks
Alternatively, if you are using a Windows OS, MikTeX probably was installed with TeXworks. You can look for `TeXworks` from your start menu, see if that opens, and compile a basic document.

    \documentclass{article}
    \begin{document}
    This here be text.
    \end{document}

Click the green circle in the task ribbon to typeset the document. If this successfully compiles a PDF, then MikTeX is working.

