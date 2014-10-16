\name{est.rm}
\alias{est.rm}
\title{
Removes stations from a collection of class \code{Catalog}
}
\description{
Given a list of indexes (\code{list}), this function removes stations from a 
collection of data/catalog pair.
}
\usage{
est.rm(collection, list)
}
\arguments{
  \item{collection}{ A list of class \code{Catalog}.
}
  \item{list}{
A vector of scalars indicating the stations to remove. The elements of this
vector must be between 1 and \code{length(collection$data)}.
}
}
\value{
Returns a list of class \code{Catalog} with the updated collection.
}
\note{By specifying a negative list of elements, it is possible to select only those stations:
\preformatted{
# Remove first 3 stations:
col <- est.rm(collection, list=1:3)
# Select only the first 3 stations:
col <- est.rm(collection, list=-(1:3))
}
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
