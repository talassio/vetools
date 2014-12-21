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
est.sort(collection, sort.by.start = TRUE, by.year.only = FALSE)
}
\arguments{
  \item{collection}{
A list of class \code{Catalog} objects.
}
  \item{sort.by.start}{
Boolean value indicating wheather it is ordered by starting or ending data time span.
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
