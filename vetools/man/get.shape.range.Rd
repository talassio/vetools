\name{get.shape.range}
\alias{get.shape.range}
\alias{range}
\title{
Get spatial range of an object
% of class \code{SpatialPolygonsDataFrame}
}
\description{
Extracts the  longitudes and  latitudes of 
an object of class \code{SpatialPolygonsDataFrame}.
}
\usage{
get.shape.range(shape)
}

\arguments{
  \item{shape}{
 object of class \code{SpatialPolygonsDataFrame}. Object usually
 comes from
 \code{\link{get.shape.venezuela}} or \code{\link{get.shape.state}}.
}
}
\value{
Matrix of one row and four columns, containing the Longitudinal and Latitudinal
ranges. Of the form
\preformatted{
     Long.start Long.end Lat.start Lat.end
[1,]  -73.37749 -59.7991 0.6492503 12.2012
}
}

\author{
A.M. Sajo-Castelli
}


\seealso{
\command{\link{get.shape.venezuela}},
\command{\link{get.shape.state}},
\command{\link{get.Grid.size}}.
}
\examples{
VE <- get.shape.venezuela()
get.shape.range(VE)
}

\keyword{ shapefile }
