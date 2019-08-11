# Emily's First Example
set.seed (1213) # for reproducibility
x <- cumsum(rnorm(100))
plot (x,type = "l" ,
     ylab = expression (x[i + 1]==x[i]+epsilon[{i+ 1}] ),
     xlab = "step")
     