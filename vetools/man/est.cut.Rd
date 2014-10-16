\name{est.cut}
\alias{est.cut}
\title{
Crops a list of time-series
}
\description{
Given a time window, this function crops all the stations in a collection of data/catalog pair.
If a given station starts after the end date (\code{end}) or ends before the 
inital date (\code{start}), it is removed from the catalog.
}
\usage{
est.cut(collection, start = c(1960, 1), end = c(2020, 12))
}
\arguments{
  \item{collection}{
  A list of class \code{Catalog}.
}
  \item{start}{
  The start of the window to crop. A vector of two elements (year, month).
}
  \item{end}{
  The end of the windows to crop.
}
}
\value{
Returns a list with the updated (cropped) \code{collection}.
 Note that the 
information regarding the stations meta-data is NOT modified. (!)}

\author{
A.M. Sajo-Castelli.
}

\seealso{The other \code{est.*} family members:
\code{\link{est.rm}},
\code{\link{est.fill}},
\code{\link{est.sort}},
\code{\link{est.union}}.}
% \examples{ }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ est.cut }
\keyword{ est }
