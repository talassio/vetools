\name{get.Grid.size}
\alias{get.Grid.size}

\title{
Build a grid around an object of class \code{"SpatialPolygonsDataFrame"}
}
\description{
Construct a grid that \emph{contains} the shape 
(object of class \code{"SpatialPolygonsDataFrame"}) 
and is spaced by a given distance.
}
\usage{
get.Grid.size(shape, origin.grid, x.res = 0.05, y.res = 0.05, plot = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{shape}{
Object of class \code{"SpatialPolygonsDataFrame"}
}
  \item{origin.grid}{
External grid constructed by this same function. See Details
}
  \item{x.res}{
Longitudinal separation in degrees, defaults to 0.05 degrees
}
  \item{y.res}{
Latitudinal separation in degrees, defaults to 0.05 degrees
}
  \item{plot}{
Boolean. Shows the constructed grid over the shape
}
}
\details{
About the \command{origin.grid} parametre. Say there is the
need to work on a nation-wide scale. For this you construct a
grid over the whole shapes constituting the country, naming is
\emph{extremal or external grid}. Now to study
in detail a given state it is recomemded to construct a \emph{smaller}
grid covering only state of interest and not the whole nation. Doing this
it is necesary to asure that the smaller grid \emph{intersects} the
external grid. Providing the parametre command{origin.grid} constructs
a small grid over the given shape but that overlaps exactly with the
external grid command{origin.grid}. An example that illustrates the above 
could be:
\preformatted{
# External grid
VE <- get.shape.state(get.shape.state()$Abb)
External.Grid <- get.Grid.size(VE, plot=F, x.res=1, y.res=1)
# Small grid over a state
NE <- get.shape.state(c("MI","NE"))
Small.Grid <- get.Grid.size(NE, External.Grid, plot=T, x.res=0.25, y.res=0.25)
}

\if{html}{\figure{grid.png}{Grid overlay example}}
\if{latex}{\figure{grid.pdf}{options: width=3in}}
}

\value{
  \item{ncol }{Number of columns of the grid}
  \item{nrow }{Number of rows of the grid}
  \item{longs }{Longitudinal position for each column of the grid}
  \item{lats }{Latitudinal position for each row of the grid}
  \item{x.res}{Longitudinal resolution used}
  \item{y.res}{Latitudinal resolution used}
}

\author{
A.M. Sajo-Castelli
}


\seealso{
\command{\code{\link{get.shape.venezuela}}},
\command{\code{\link{get.shape.state}}},
\command{\code{\link{get.shape.range}}}.
}
\examples{\dontrun{
## Construct extremal grid for whole country
VE <- get.shape.state(get.shape.state()$Abb)
External.Grid <- get.Grid.size(VE)

## Build grid over Amazona state synchronized with External.Grid
AM <- get.shape.state("AM")
AM.Grid <- get.Grid.size(AM, origin.grid=External.Grid)

## Build grid over Amazona state
AM <- get.shape.state("AM")
AM.Grid <- get.Grid.size(AM)

## Another example:
VE = get.shape.state(get.shape.state()$Abb)
ZUFACO = get.shape.state(c('ZU','FA','CO'))
Main.grid=get.Grid.size(VE,x.res=1,y.res=1,plot=T)
sub.grid = get.Grid.size(ZUFACO,origin.grid=Main.grid, x.res=0.5,y.res=0.5,plot=TRUE)
}
}

\keyword{ shapefile }
\keyword{ grid }
