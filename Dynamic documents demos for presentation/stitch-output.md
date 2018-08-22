#



This report was automatically generated with the R package **knitr**
(version 1.20).


```r
library(knitr)
# A subset of the `mtcars` dataset: the first 6 rows and 6 columns.
kable(head(mtcars[,1:6]))
```



|                  |  mpg| cyl| disp|  hp| drat|    wt|
|:-----------------|----:|---:|----:|---:|----:|-----:|
|Mazda RX4         | 21.0|   6|  160| 110| 3.90| 2.620|
|Mazda RX4 Wag     | 21.0|   6|  160| 110| 3.90| 2.875|
|Datsun 710        | 22.8|   4|  108|  93| 3.85| 2.320|
|Hornet 4 Drive    | 21.4|   6|  258| 110| 3.08| 3.215|
|Hornet Sportabout | 18.7|   8|  360| 175| 3.15| 3.440|
|Valiant           | 18.1|   6|  225| 105| 2.76| 3.460|

The R session information (including the OS info, R version and all
packages used):


```r
sessionInfo()
```

```
## R version 3.4.0 (2017-04-21)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows >= 8 x64 (build 9200)
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] magrittr_1.5 dplyr_0.7.4  knitr_1.20  
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.15     rprojroot_1.3-2  digest_0.6.15    assertthat_0.2.0
##  [5] R6_2.2.2         backports_1.1.2  evaluate_0.10.1  pillar_1.1.0    
##  [9] highr_0.6        rlang_0.2.0      stringi_1.1.6    bindrcpp_0.2    
## [13] rmarkdown_1.8    tools_3.4.0      stringr_1.2.0    glue_1.2.0      
## [17] tinytex_0.5      yaml_2.1.16      compiler_3.4.0   pkgconfig_2.0.1 
## [21] htmltools_0.3.6  bindr_0.1        tibble_1.4.2
```

```r
Sys.time()
```

```
## [1] "2018-08-22 11:00:38 EDT"
```

