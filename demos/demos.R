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
i = 6
map = openmap(c(lat = 0.3 + range[4],   lon = -0.1 + range[1]),
              c(lat = -0.3 + range[3],   lon = 0.1 + range[2]), type=nm[i])
mapLL = openproj(map)
plot(mapLL)
plot(VA, add = T, border = 'red', lwd = 2, lty = 2)
title(paste0('vetools+OpenStreetMap(', nm[i],')'), col.main = 'white')
points(LL$Longs, LL$Lats, pch = 16, col = 'dodgerblue')
points(LL$Longs, LL$Lats, pch = 1, col = 'yellow', cex=1.5)

