vetools
=======

Source files for the vetools R package

Description
===========
vetools is an integrated data management library for [R](http://www.r-project.org/). 
It offers a variety of 
tools concerning the loading and manipulation of environmental 
data available from different Venezuelan governmental sources. 
Facilities are provided to plot temporal and spatial data as 
well as understand the health of a collection of meteorological data.

Where to get
============
Since version 1.3.28 it is available directly form the 
[CRAN Repo](http://cran.r-project.org/web/packages/vetools/index.html)
and can be installed in R
```R
install.packages('vetools')
```

Latest builds can be downloaded directly from this site.
```R
library('devtools')
install_github('talassio/vetools')
```

# Some demos

```R
library(vetools)
data(Vargas)
Vargas
```

```R
plot(Vargas)
```
```R
plot(Vargas$data[[1]], ylab='mm')
title(main=paste('Monthly precipitaion [mm]/month', Vargas$catalog[[1]]$Name)
```
