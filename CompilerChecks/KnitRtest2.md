# Testing out Knitr on a Markdown document. #

Buenas dias!


```r
x <- cumsum(dchisq(1000,5))
plot (x, type = "l")
```

![plot of chunk Dork-Squared](figure/Dork-Squared-1.png)


```r
curve( dchisq(x, df=28), col='red', main = "Chi-Square Density Graph",
          from=0,to=60)
xvec <- seq(7.5,60,length=101)
pvec <- dchisq(xvec,df=28)
polygon(c(xvec,rev(xvec)),c(pvec,rep(0,length(pvec))),
        col=adjustcolor("black",alpha=0.3))
```

![plot of chunk Chi-squared](figure/Chi-squared-1.png)
Thanks Stack Overflow for the code.

Adios!


