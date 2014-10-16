\name{est.union}
\alias{est.union}
\title{
Unites data from a collection of data/catalog pair
}
\description{
This function merges a list of \code{ts} objects into a single time-series. It does
it by taking the mean (meadian, \code{fun}) of the common elements for each time.
}
\usage{
est.union(collection, fun = mean, return.matrix=FALSE)
}

\arguments{
  \item{collection}{
A list of class \code{Catalog}.
}
  \item{fun}{
The function by which to unite the common elements. Defaults to mean.
}
  \item{return.matrix}{
Returns a matrix where each collumn is a time-series (of each station), synchronized in time.
}
}
\value{
Returns an enhanced \code{Catalog} object with an additional member called \code{union} of
class \code{ts} that contains the union of all stations described in \code{collection}. 
If \var{return.matrix} is true, then
it returns a matrix time stamped where each collumn is a station data.
}
\author{
A.M. Sajo-Castelli
}
\seealso{The other \code{est.*} family members:
\code{\link{est.rm}},
\code{\link{est.sort}},
\code{\link{est.cut}},
\code{\link{est.fill}}.}


\examples{\dontrun{
names(collection)
collection = est.union(collection)
names(collection)
plot(collection$union)
abline(h = 250, v = 1997:2000)}}

\keyword{ est }
\keyword{ est.union }
