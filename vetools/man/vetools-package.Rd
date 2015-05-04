\name{vetools-package}
\alias{vetools-package}
\alias{vetools}
%%%
\docType{package}
\title{
Some tools for Venezuelan environmental data
}
\description{
This toolset provides a bundle of functions to handle and unify the diverse
data formats of distinct government agencies and military bodies: 
Ministerio del Ambiente, Marina Venezolana, etc. It also provides all
necessary tools to load these data sets.
In order to standarize the structure of the data provided and/or
processed, a \pkg{\link[=CatalogConvention]{vetools}} 
\link[=CatalogConvention]{Catalog Convention} is presented.}
\details{
\tabular{ll}{
Package: \tab vetools\cr
Type: \tab Package\cr
Version: \tab 1.x series\cr
Initial Release Date: \tab 2013-08-01\cr
License: GPL\cr
}

Input functions:\cr
\code{\link{read.HIDROX}}\cr
\code{\link{read.MINAMB}}\cr
\code{\link{read.MARN}}\cr

Preprocessing functions:\cr
\code{\link{disaggregate.ts}}\cr
\code{\link{disaggregate.MARN}}\cr
\code{\link{complete.series}}\cr
\code{\link{fill.small.missing}}

EST family functions:\cr
\code{\link{est.cat}}\cr
\code{\link{est.cut}}\cr
\code{\link{est.fill}}\cr
\code{\link{est.rm}}\cr
\code{\link{est.sel}}\cr
\code{\link{est.union}}\cr
\code{\link{est.sort}}

Output functions:\cr
\code{\link{panorama}}\cr
\code{\link{panomapa}}\cr
\code{\link{summary.Catalog}}\cr
\code{\link[=summary.Catalog]{print.Catalog}}\cr
\code{\link[=summary.Catalog]{plot.Catalog}}\cr
\code{\link{plotLayers}}\cr
\code{\link{plotArrow}}

SHAPE family functions:\cr
\code{\link{get.shape.state}}\cr
\code{\link{get.shape.venezuela}}\cr
\code{\link{get.shape.range}}\cr
\code{\link{get.Grid.size}}

Class \code{Catalog}\cr
\code{\link{Catalog}}\cr
\code{\link{is.Catalog}}\cr
\code{\link{as.Catalog}}

Constants\cr
\code{\link{estados.venezuela}} is a data.frame containing the names and abbreaviatures of the states conforming Venezuela.

For a complete list of functions, use \code{library(help = "vetools")}.

Convention Sheet:\cr
\link[=CatalogConvention]{Catalog Convention White Sheet}\cr

Datasets:\cr
\var{\link{CuencaCaroni}}\cr
\var{\link{Vargas}}\cr
\var{\link[=Vargas]{Vargas2}}\cr

Maps:\cr
Maps describing the political border of the nation and each state is available in the
\code{system.file("maps", package="vetools")} folder.

}
\author{
A. M. Sajo-Castelli. Centro de \enc{Estadística}{Estadistica} y \enc{Matemática}{Matematica} Aplicada (CEsMA).
Universidad \enc{Simón}{Simon} \enc{Bolívar}{Bolivar}. Venezuela.

Contributors: D. E. Villalta, L. Bravo. CEsMA, Universidad \enc{Simón}{Simon} \enc{Bolívar}{Bolivar}. Venezuela.
                                                                    
R. \enc{Ramírez}{Ramirez}. Parque \enc{Tecnológico}{Tecnologico} Sartenejas, Universidad \enc{Simón}{Simon} \enc{Bolívar}{Bolivar}. Venezuela.

Maintainer: A. M. Sajo-Castelli <asajo@usb.ve>
}
\references{L. Bravo, S. Abad, I. Llatas, A. Salcedo, L. Delgado, S. Ramos, K. Cordova.
Hidrox: Repositorio de Datos \enc{Hidroclimáticos}{Hidroclimaticos} para la \enc{Gestión}{Gestion} de Riesgos 
\enc{Epidemiológicos}{Epidemiologicos} y Ambientales.
2012. ISBN:987-9-8012596-2-6.
}
\keyword{venezuela}
\keyword{environmental}

\examples{
# It is best to introduce the features of this package
# through some simple examples.
library(vetools)

# EXAMPLE 1 ####
# This example shows how to manipulate a 
# data-set called a "collection".

# Read a collection for the available datasets
data(package = "vetools")
data(Vargas)
collection <- Vargas
is.Catalog(collection)  ## TRUE

# Show the members of the collection, known as the "Catalog".
summary(collection)

# Show the health of this collection
collection ## or panorama(collection)

# Plot the data concerning the second station
plot(collection$data[[2]])

# Sort the stations and update the collection
collection <- est.sort(collection)
panorama(collection, cut = c(1965, 1985))

# For each station (member) of the collection,
# "extract" the measurements between the dates
# 1965,1 and 1985,1
collection1  <- est.cut(collection, start = c(1965, 1), end = c(1985, 1))
collection1
# Note collection1 is one element shorter than collection, station 10 
# "CARUAO" end before the cut point and thus is removed.

# Plot health information
plot(collection1)

collection <- collection1
rm("collection1")

# Build a representative series for the whole state using
# the mean
collection <- est.union(collection)
plot(collection$union)
rm("collection")

## EXAMPLE 2 ####
# This example shows how to use the plot functions
library(plyr)
data(CuencaCaroni)
collection <- CuencaCaroni

# Plot stations and classify by their altitude
LL <- ldply(CuencaCaroni$catalog, function(x) { c(x$Longitude, x$Latitude, x$Altitude) })
colnames(LL) <- c("Longitude", "Latitude", "Altitude")
( states = get.shape.state() )
BO <- get.shape.state("BO")
plot(BO)

k <- kmeans(LL$Altitude, centers = 2)
col = ifelse(k$cluster == 1, 'Red2', 'DodgerBlue')
points(LL$Longitude, LL$Latitude, pch = 21, bg = col, cex = 1.5)
text(LL$Longitude, LL$Latitude, labels = seq_along(LL$Longitude), cex=0.5)
plotArrow(BO)
title(states$Name.UTF8[states$Abb == "BO"], sub = "red: high, blue: low")

## EXAMPLE 3 ####
# Use of plotLayers, display stations' color using altitude information
border = list(FUN = plot, BO)
normaltitude = ( LL$Altitude - min(LL$Altitude) ) / ( max(LL$Altitude) - min(LL$Altitude) )
colRamp = colorRamp(c("LimeGreen", "Yellow","Magenta"))
stations = list(FUN = points, LL$Longitude, LL$Latitude, 
pch = 20, col = rgb(colRamp(normaltitude)/255), cex = 1.5)
labels = list(FUN = text, LL$Longitude, LL$Latitude, labels = seq_along(LL$Longitude), cex = 0.5)
Labs = list(FUN = title, main = states$Name.UTF8[states$Abb == "BO"], sub = "red: high, blue: low")
arrow = list(FUN = plotArrow, BO)
plotLayers(border, stations, labels, arrow, Labs)
}
