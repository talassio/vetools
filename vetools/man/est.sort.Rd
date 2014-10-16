\name{est.sort}
\alias{est.sort}
\title{
Sort a data/catalog pair
}
\description{
Given a collection of data/catalog pairs, this function orders them by the start time.\cr
Sorts by \code{start(collection$data[[k]])}, 
provided that the member \code{data} is of class \code{ts}.
}
\usage{
est.sort(collection, ascending = T, by.year.only = F)
}
\arguments{
  \item{collection}{
A list of class \code{Catalog} objects.
}
  \item{ascending}{
Boolean value indicating wheather it is ordered by earliest or latest starting station.
}
  \item{by.year.only}{
Use only the year to sort instead of year/month. Defaults to FALSE. 
}
}
% \details{ }
\value{
Returns a sorted list of class \code{Catalog}, sorted by \code{start} date of the objects in \code{collection$data}.
}

\author{
A.M. Sajo-Castelli
}

\seealso{The other \code{est.*} family members:
\code{\link{est.rm}},
\code{\link{est.fill}},
\code{\link{est.cut}},
\code{\link{est.union}}.}
%\examples{}

\keyword{ est }
\keyword{ est.sort }% __ONLY ONE__ keyword per line
