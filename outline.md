# "Using LaTeX and Markdown for Reproducible Research" #
* Class in 2018 at RTP
* Emily Li
* Erik Beck

# Objectives #

* Discussion of LaTeX in a standalone Environment
* Discussion of Markdown in a standalone Environment
* How Markdown and LaTeX can work together (still in isolation)

* R and reproducible research tools (knitr, sweave, etc, but strong
  emphasis on knitr)

* How Markdown and LaTeX can work with R (especially knitr) for
  reproducible research

# Key Elements #

* Hands-on
* More Hands-on

# Prerequisites #

* R and RStudio
* MikTeX required for knitr
* R packages:
* knitr
* ggplot2 (or all of tidyverse)
* Pandoc?
* Editor?
* USGS dataRetrieval, etc?


# Data Examples and Datasets #
* dslabs
* Mystic River (MA) WQ Data
* USGS Data
* Sunspot and solar flux data
* Other EPA data (AIRS)


# LaTeX #

## What is LaTeX? ##
LaTeX is a tool for high-quality typesetting based on the idea that it is better to leave document design to document designers, and to let authors get on with writing documents.

Here is a minimal example of a full document written in LaTeX.

```
\documentclass{article}
\title{A Minimal LaTeX Example}
\author{Emily Li}

\begin{document}
\maketitle

Hello world!

\end{document}
```

To compile this into a PDF document, your computer needs one of these TeX distributions installed:
* **MiKTeX** for Windows
* **TeX Live** for Linux and other UNIX-like systems
* **MacTeX** redistribution of TeX Live for Mac OS X

You can also use an on-line ready-to-use option like [ShareLaTeX](https://www.sharelatex.com/).

# Markdown #

## What is Markdown? ##
* Daring Fireball
* Dialects

## Using Markdown ##

# Markdown and LaTeX #

# Reproducible Research #
> An article ... in a scientific publication is not the scholarship itself, it is merely advertising of the scholarship. The actual scholarship is the complete software development environment and the complete set of instructions which generated the figures. --- *D. Donoho, professor of statistics at Stanford University*

## Reproducible Research; What is it? ##
Results from scientific research have to be reproducible to be trustworthy.

Though Donoho was referring to computational science, journals in other data-driven fields such as biostatistics have been moving in the direction of reproducible research as well.

This chunk of R code produces a figure that illustrates a simulation of Brownian motion for 100 steps.

```
set.seed(1213) # for reproducibility of random numbers
x <- cumsum(rnorm(100))
plot(x, type = "l", ylab = "$x_{i+1}=x_i+\\epsilon_{i+1}$",
     xlab = "step")
```

To put this in a document by hand, we would have to open RStudio, paste the code into the R console to draw the plot, save it as a PDF or image file, and insert it into a LaTeX document with `\includegraphics{}`. This is both tedious and difficult for the author to maintain. If we want to change the figure, we have to update both the source code and the typesetting file.

Advantages to dynamic documents: Only maintain the source code, and whenever you want a report, you just knit the source code, and everything will be generated automatically (tables, plots and numbers in lines). There is no need to manually copy and paste anything. Next time if you data source is changed, you simply run the process again, and all results can be updated. Let computers do the tedious job, because this is what they are good at. Humans should focus on other jobs like analysis and organization of the report.

## General Info/Chat ##

### Tools for Reproducible Research ###
* sweave (very briefly)
* knitr
* web and weave, Knuth, literate programming?
* cweb etc ?

## Let's knit(r) ##
