\name{est.rm}
\alias{est.rm}
\alias{est.sel}
\title{
Select / remove stations from a collection of class \code{Catalog}
}
\description{
Given a list of indexes (\code{list}), this function selects or
removes stations from a
collection of data/catalog pair.
}
\usage{
est.rm(collection, list)
est.sel(collection, list)
}
\arguments{
  \item{collection}{ A list of class \code{Catalog}.
}
  \item{list}{
A vector of scalars indicating the stations to select or remove.
The elements of this
vector must be between 1 and \code{length(collection$data)}.
}
}
\value{
Returns a list of class \code{Catalog} with the updated collection.
}
\author{
A.M. Sajo-Castelli
}


\seealso{The other \code{est.*} family members:
\code{\link{est.cut}},
\code{\link{est.fill}},
\code{\link{est.sort}},
\code{\link{est.union}}.}
% \examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ est }
\keyword{ est.rm }
