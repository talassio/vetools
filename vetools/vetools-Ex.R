pkgname <- "vetools"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('vetools')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("CatalogConvention")
### * CatalogConvention

flush(stderr()); flush(stdout())

### Name: CatalogConvention
### Title: 'vetools' Catalog Convention White Sheet (Revision 3)
### Aliases: CatalogConvention 'Catalog Convention' 'vetools Catalog
###   Convention'
### Keywords: catalog

### ** Examples
## Not run: 
##D # This collection has only one station
##D Collection <- read.MARN(system.file("tests/test-MARN.dat", package="vetools"))
##D summary(Collection)
##D plot(Collection$data)
##D # This collection has many stations
##D Collection.H <- read.HIDROX(system.file("tests/test-HIDROX.csv", package="vetools"))
##D summary(Collection.H)
##D plot(Collection.H$data[[4]])
## End(Not run)


cleanEx()
nameEx("CuencaCaroni")
### * CuencaCaroni

flush(stderr()); flush(stdout())

### Name: CuencaCaroni
### Title: Rainfall data for the Cuenca del Caroní, Venezuela
### Aliases: CuencaCaroni
### Keywords: datasets venezuela caroni

### ** Examples
## Not run: 
##D data(CuencaCaroni)
##D summary(CuencaCaroni)
##D plot(CuencaCaroni$data[[2]])
##D start(CuencaCaroni$data[[80]])
##D end(CuencaCaroni$data[[80]])
##D frequency(CuencaCaroni$data[[80]])
##D cat(cc.cat[[1]]$Nombre)
## End(Not run)


cleanEx()
nameEx("Vargas")
### * Vargas

flush(stderr()); flush(stdout())

### Name: Vargas
### Title: Rainfall in Vargas, Venezuela
### Aliases: Vargas Vargas2
### Keywords: datasets venezuela vargas

### ** Examples
## Not run: 
##D data(Vargas, package='vetools')
##D summary(Vargas)
##D plot(Vargas$data[[2]])
##D start(Vargas$data[[1]])
##D end(Vargas$data[[1]])
##D frequency(Vargas$daily[[1]])
##D cat(Vargas$catalog[[1]]$Name)
## End(Not run)


cleanEx()
nameEx("complete.series")
### * complete.series

flush(stderr()); flush(stdout())

### Name: complete.series
### Title: Complete relatively large holes in data-sets
### Aliases: complete.series
### Keywords: EM completion

### ** Examples
## Not run: 
##D for (k in 1:15) {
##D         fit[[k]] = lm(collection$data[[k]] ~ ZZ - 1, singular.ok=T, na.action=na.omit)
##D }
##D collection.completed = complete.series(collection, fit)
## End(Not run)


cleanEx()
nameEx("est.union")
### * est.union

flush(stderr()); flush(stdout())

### Name: est.union
### Title: Unites data from a collection of data/catalog pair
### Aliases: est.union
### Keywords: est est.union

### ** Examples
## Not run: 
##D names(collection)
##D collection = est.union(collection)
##D names(collection)
##D plot(collection$union)
##D abline(h = 250, v = 1997:2000)
## End(Not run)


cleanEx()
nameEx("get.Grid.size")
### * get.Grid.size

flush(stderr()); flush(stdout())

### Name: get.Grid.size
### Title: Build a grid around an object of class
###   '"SpatialPolygonsDataFrame"'
### Aliases: get.Grid.size
### Keywords: shapefile grid

### ** Examples
## Not run: 
##D ## Construct extremal grid for whole country
##D VE <- get.shape.state(get.shape.state()$Abb)
##D External.Grid <- get.Grid.size(VE)
##D 
##D ## Build grid over Amazona state synchronized with External.Grid
##D AM <- get.shape.state("AM")
##D AM.Grid <- get.Grid.size(AM, origin.grid=External.Grid)
##D 
##D ## Build grid over Amazona state
##D AM <- get.shape.state("AM")
##D AM.Grid <- get.Grid.size(AM)
##D 
##D ## Another example:
##D VE = get.shape.state(get.shape.state()$Abb)
##D ZUFACO = get.shape.state(c('ZU','FA','CO'))
##D Main.grid=get.Grid.size(VE,x.res=1,y.res=1,plot=T)
##D sub.grid = get.Grid.size(ZUFACO,origin.grid=Main.grid, x.res=0.5,y.res=0.5,plot=TRUE)
## End(Not run)



cleanEx()
nameEx("get.shape.range")
### * get.shape.range

flush(stderr()); flush(stdout())

### Name: get.shape.range
### Title: Get spatial range of an object
### Aliases: get.shape.range range
### Keywords: shapefile

### ** Examples

VE <- get.shape.venezuela()
get.shape.range(VE)



cleanEx()
nameEx("get.shape.state")
### * get.shape.state

flush(stderr()); flush(stdout())

### Name: get.shape.state
### Title: Retrive SHAPE files
### Aliases: get.shape.state get.shape.venezuela
### Keywords: shapefile

### ** Examples

## Get national boudary SHAPE
VE <- get.shape.venezuela()
## Not run: plot(VE, asp=1, axes=T)

## Get list of all available shapes
get.shape.state()

## Get national and statal boudaries SHAPE
VS <- get.shape.state(get.shape.state()$Abb)
## Not run: plot(VS, col="gray80", asp=1, axes=F)

## Retrieve Zone III states
BOAMDA = get.shape.state(c("BO", "AM", "DA"))
## Not run: plot(BOAMDA, add=T, border="darkred", lwd=2, col="pink")



cleanEx()
nameEx("panorama")
### * panorama

flush(stderr()); flush(stdout())

### Name: panorama
### Title: Overview of a 'collection' of stations
### Aliases: panorama panomapa
### Keywords: panorama panomapa overview

### ** Examples
## Not run: 
##D panorama(collection)
##D collection
##D panomapa(collection)
##D plot(collection)
## End(Not run)


cleanEx()
nameEx("plotLayers")
### * plotLayers

flush(stderr()); flush(stdout())

### Name: plotLayers
### Title: Plot simultaneously one or more layers of information
### Aliases: plotLayers
### Keywords: vetools

### ** Examples

library(maptools)
library(vetools)

# Example 1 ####
ZU <- get.shape.state("ZU")
border <- list(FUN = plot, ZU, asp = 1, lwd = 2, 
               border = "blue", col = NA, add = TRUE)
r <- get.shape.range(ZU)
x <- seq(r[1], r[2], length.out = nrow(volcano))
y <- seq(r[3], r[4], length.out = ncol(volcano))
image(x, y, volcano, col = heat.colors(100), 
      axes = FALSE, xlab = NA, ylab = NA, asp = 1)
plotLayers(border)
plotArrow(ZU, cex = 0.666, offset.arrow = c(0.1, 0))
title(main = "Raster image combined with plotLayers")

# Example 2 ####
long=c(-72.5, -71.5, -71.0); lat=c(9.5, 8.75, 10.5); 
mm = 1.5 * c(2.5, 3.8, 4.2)
data <- list(FUN = points, x = long, y = lat, pch = 21, 
             bg = rgb(0, 1, 0, 0.666), col = "blue", 
             cex = mm)
filled.contour(x, y, volcano, xlab = "Longitude", 
               ylab = "Latitude", asp = 1,
               color.palette = heat.colors,
               plot.axis = { plotLayers(border, data) },
               main = "plotLayers & filled.contour example")

# Example 3 ####
pts <- cbind(r[1] + 2 * runif(10), r[3] + 3 * runif(10))
sts <- runif(10)
stations <- list(FUN = plot, x = pts[, 1], y = pts[, 2], 
                 asp = 1, pch = 21, col = rgb(sts, 0, 0), 
                 bg = 'white', cex = 2, lwd = 2, 
                 xlim = r[1:2], ylim = r[3:4], axes = FALSE, 
                 xlab = NA, ylab = NA)
labs <- list(FUN=text, x=pts[,1], y=pts[,2], labels=1:10, 
             cex=0.7)
type = 1 + round(2 * sts)
LABELS = c('optimal', 'normal', 'critical')
status <- list(FUN = text, x = pts[, 1], y = pts[, 2], 
               labels = LABELS[type], cex = 0.7, 
               pos = 4, col = rgb(sts, 0, 0))
arrow <- list(FUN = plotArrow, shape = ZU, cex = 0.7)
plotLayers(stations, border, labs, status, arrow)
title(main = "plotLayers example", sub = "Zulia state")



cleanEx()
nameEx("read.HIDROX")
### * read.HIDROX

flush(stderr()); flush(stdout())

### Name: read.HIDROX
### Title: Load environmental data from governmental sources
### Aliases: read.HIDROX read.MINAMB read.MARN
### Keywords: read load

### ** Examples
## Not run: 
##D collection.ZU = read.HIDROX('repo_est_ZU.csv', state="ZU", unit="Prec [mm/month]"))
##D summary(collection.ZU)
##D collection.ZU
## End(Not run)


cleanEx()
nameEx("summary.catalogo")
### * summary.catalogo

flush(stderr()); flush(stdout())

### Name: summary.Catalog
### Title: Shows a summary, a panoramic overview in temporal or spatial
###   fashion for a given 'collection' of data/catalog pairs
### Aliases: summary.Catalog print.Catalog plot.Catalog
### Keywords: catalogo catalog summary

### ** Examples
## Not run: 
##D collection = read.HIDROX('test-HIDROX.csv')
##D summary(collection)
##D print(collection)
##D plot(collection)
## End(Not run)


### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
