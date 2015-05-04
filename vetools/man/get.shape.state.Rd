\name{get.shape.state}
\alias{get.shape.state}
\alias{get.shape.venezuela}
\title{
 Retrive SHAPE files
}
\description{
These functions retreive the necesary SHAPE files to display the
Venezuelan political border or any combination of states.
}
\usage{
get.shape.state(abb, shape.file = "venezuelaestados.rda")
get.shape.venezuela(shape.file = "venezuela.rda")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{abb}{a vector of \code{characters} containing the two letter
  abbreviations of the states to load.
}
  \item{shape.file}{
  the base name of the SHAPE file to use.
  }
}
\details{
 If the parameter \code{abb} is \code{missing},
  then a data frame is shown and returned containing the states names, abbreviations and SHAPE file IDs.
}
\value{
        returns an object of class \code{"SpatialPolygonsDataFrame"}
        that can be plotted using the \command{\link{plot}} command.
}
\references{
Maps where constructed and exported from ArcGIS 2.x.
}
\author{
        R. \enc{Ramírez}{Ramirez}. Parque \enc{Tecnológico}{Tecnologico} Sartenejas, Universidad \enc{Simón}{Simon} \enc{Bolívar}{Bolivar}. Venezuela.
        
        Wrapped in \R by A. M. Sajo-Castelli
}
\note{
SHAPE files venezuela and "venezuela estados" have a slight size mismatch:
\preformatted{> VE <- get.shape.venezuela()
> VS <- get.shape.state(get.shape.state()$Abb)
> get.shape.range(VE)
      Long.start Long.end Lat.start  Lat.end
SHAPE   -73.3774 -59.7991 0.6498817 12.20108
> get.shape.range(VS)
       Long.start Long.end Lat.start  Lat.end
SHAPE   -73.37749 -59.7991 0.6492503 12.2012
}
}

\seealso{
\command{\link{get.shape.range}},
\command{\link{get.Grid.size}}.
}
\examples{
## Get national boundary:
VE <- get.shape.venezuela()
\dontrun{plot(VE, asp=1, axes=T)}

## Get list of all available sub-country maps
get.shape.state()[, c('Name', 'Abb')]

## Get national and statal boudaries
VS <- get.shape.state(get.shape.state()$Abb)
\dontrun{plot(VS, col="gray80", asp=1, axes=F)}

## Retrieve Zone III states
BOAMDA = get.shape.state(c("BO", "AM", "DA"))
\dontrun{plot(BOAMDA, add=T, border="darkred", lwd=2, col="pink")}
}

\keyword{ shapefile }
