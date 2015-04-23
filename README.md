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
![panorama](https://github.com/talassio/vetools/raw/master/demos/panorama.png)
```R
plot(Vargas)
```
![panomapa](https://github.com/talassio/vetools/raw/master/demos/panomapa.png)
```R
plot(Vargas$data[[1]], ylab='mm')
title(main=paste('Monthly precipitaion [mm]/month', Vargas$catalog[[1]]$Name)
```
![tsprec](https://github.com/talassio/vetools/raw/master/demos/tsprec.png)

vetools catalog format is can be easily used with other maping packages.

## Interactive maps using leaflet package
```R
library(vetools)
library(plyr)
library(leaflet)
data(CuencaCaroni)
LL = CuencaCaroni$catalog %>% ldply(function(x) { c(x$Longitud, x$Latitud, x$Name) } )
colnames(LL) <- c('Longs', 'Lats', 'Names')
BO <- get.shape.state('BO')
range <- get.shape.range(BO)

m = leaflet() %>% addTiles() %>% fitBounds(range[1], range[3], range[2], range[4])
m = m %>% addMarkers(LL$Longs, LL$Lats, popup = LL$Names)
m
```
![leaflet](https://github.com/talassio/vetools/raw/master/demos/leaflet.png)

## Maps using the OpenstreetMap library
```R
library(vetools)
library(plyr)
library(OpenStreetMap)
data(Vargas)
LL = Vargas$catalog %>% ldply(function(x) { c(x$Longitud, x$Latitud, x$Name) } )
colnames(LL) <- c('Longs', 'Lats', 'Names')
VA <- get.shape.state('VA')
range <- get.shape.range(VA)

nm = c("osm", "maptoolkit-topo",
       "waze", "mapquest", "mapquest-aerial",
       "bing", "stamen-toner", "stamen-terrain",
       "stamen-watercolor", "osm-german", "osm-wanderreitkarte",
       "mapbox", "esri", "esri-topo",
       "nps", "apple-iphoto", "skobbler",
       "opencyclemap", "osm-transport",
       "osm-public-transport", "osm-bbike", "osm-bbike-german")
i = 1
map = openmap(c(lat = 0.3 + range[4],   lon = -0.1 + range[1]),
              c(lat = -0.3 + range[3],   lon = 0.1 + range[2]), type=nm[i])
mapLL = openproj(map)
plot(mapLL)
title(paste0('vetools+OpenStreetMap(', nm[i],')'))
points(LL$Longs, LL$Lats, pch=16, col='dodgerblue')
points(LL$Longs, LL$Lats, pch=1, col='red2', cex=1.5)
```
![leaflet](https://github.com/talassio/vetools/raw/master/demos/osm-osm.png)
```R
i = 6
map = openmap(c(lat = 0.3 + range[4],   lon = -0.1 + range[1]),
              c(lat = -0.3 + range[3],   lon = 0.1 + range[2]), type=nm[i])
mapLL = openproj(map)
plot(mapLL)
plot(VA, add = T, border = 'red', lwd = 2, lty = 2)
title(paste0('vetools+OpenStreetMap(', nm[i],')'), col.main = 'white')
points(LL$Longs, LL$Lats, pch = 16, col = 'dodgerblue')
points(LL$Longs, LL$Lats, pch = 1, col = 'yellow', cex=1.5)
```
![leaflet](https://github.com/talassio/vetools/raw/master/demos/osm-bin.png)
