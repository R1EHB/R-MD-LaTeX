# "Using LaTeX and Markdown for Reproducible Research" #
* Class in 2019 at RTP
* Emily Li
* Erik Beck

# Mini-Abstract #

**Using LaTeX and Markdown for Reproducible Research**

Taking a modular approach and a stepwise fashion, Erik and Emily will
teach participants the basics of LaTeX, Markdown, and the R package
knitr. These modules will then lead to using these tools to facilitate
reproducible reports and research with R. Participants will then get
to use these modules synchronously to facilitate reproducible reports
and research with R.


# Objectives #

* Discussion of LaTeX in a standalone Environment
* Discussion of Markdown in a standalone Environment
* How Markdown and LaTeX can work together (still in isolation)

* R and reproducible research tools (knitr, sweave, etc, but strong
  emphasis on knitr)

* How Markdown and LaTeX can work with R (especially knitr) for
  reproducible research

# Key Elements #

* Lecture, with examples.
* Limited hands-on during session, but with ample examples to try at home.

# Prerequisites #

It is expected that you have some familiarity with R and RStudio, can install packages from CRAN, and understand basic R syntax.

We will be using R and RStudio for this workshop. This must be installed prior to XXX. Simply email ??? and request that R and RStudio be installed on your machine. They will push that out usually in a day or so.

* R and RStudio
* MikTeX (required for knitr)
* R packages:
  + knitr
  + ggplot2 (or all of tidyverse)
  + Pandoc (stand alone or in knitr?)


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
An R Markdown file (.Rmd) is a record of your research. It contains the code that a scientist needs to reproduce your work along with the narration that a reader needs to understand your work.

You can rereun the code in a Markdown file with one click, and reproduce your work and export the results as a finished report in a variety of formats, including HTML, PDF, MS Word, RTF documents, slides, Notebooks, and more.

* Daring Fireball/ John Gruber/daringfireball.net
* Dialects(original, R, github, etc)

## Using Markdown ##

Workflow in Markdown:
1. Open a new .Rmd file in RStudio (pre-populates with a template)
1. Write document 
1. Knit document to create report
1. Preview output
1. (Optional) Publish to web server
1. Use output file that saves alongside the .Rmd

* Brainless plinking

* Conversions (html, pdf, LaTeX, Word, others.)
* Conversions with Pandoc
* Note standalone mode



# Markdown and LaTeX #

A side-by-side comparison of Markdown and LaTeX using the exact same analysis.

LaTeX:
```
\documentclass{article}
\begin{document}
\title{Speed and Stopping Distance}
\author{Yihui Xie, creator of knitr}

\maketitle

We examine the relationship between speed and stopping distance using a linear regression model:
$Y = \beta_0 + \beta_1 x + \epsilon$.

<<model, fig.width=4, fig.height=3, fig.align='center'>>=
par(mar = c(4, 4, 1, 1), mgp = c(2, 1, 0), cex = 0.8)
plot(cars, pch = 20, col = 'darkgray')
fit <- lm(dist ~ speed, data = cars)
abline(fit, lwd = 2)
@

The slope of a simple linear regression is \Sexpr{coef(fit)[2]}.

\end{document}
```
When embedding R code in LaTeX, start a code chunk with `<<>>=` and terminate it with `@`.

Markdown:
```
---
title: Speed and Stopping Distance
---

We examine the relationship between speed and stopping distance using a linear regression model:
$Y = \beta_0 + \beta_1 x + \epsilon$.

```{r fig.width=4, fig.height=3, fig.align='center'}
par(mar = c(4, 4, 1, 1), mgp = c(2, 1, 0), cex = 0.8)
plot(cars, pch = 20, col = 'darkgray')
fit <- lm(dist ~ speed, data = cars)
abline(fit, lwd = 2)

The slope of a simple linear regression is `r coef(fit)[2]`.
```
Quickly insert chunks with the keyboard shortcut Ctrl + Alt + I (OS X: Cmd + Option + I).

By comparison, Markdown has simpler commands.


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
