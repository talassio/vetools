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
Centro Internacional de Ecología Tropical (CIET), Instituto Venezolano de Investigaciones Científicas (IVIC), Conservación Internacional Venezuela y UNESCO. 
\url{www.ecosig.org.ve}.
Editors: Rodríguez, J.P., Zambrano-Martínez, S., Lazo, R., Oliveira-Miranda, M.A., Solórzano, L.A. y Rojas-Suárez, F. Date: 2005/02/01. Edition: 1st.
}
\author{
Centro Internacional de Ecología Tropical (CIET), Instituto Venezolano de Investigaciones Científicas (IVIC), Conservación Internacional Venezuela y UNESCO. 

        Converted to shape-files by
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
library(vetools)
library(sp)
## Get national boundary:
VE <- get.shape.venezuela()
plot(VE, asp = 1, axes = TRUE)

## Get list of all available sub-country maps
get.shape.state()[, c('Name', 'Abb')]

## Get national and statal boudaries
VS <- get.shape.state(get.shape.state()$Abb)
plot(VS, col = "gray80", asp = 1, axes = FALSE)

## Retrieve Zone III states
BOAMDA = get.shape.state(c("BO", "AM", "DA"))
plot(BOAMDA, add = TRUE, border = "darkred", lwd = 2, col = "pink")
}

\keyword{ shapefile }
