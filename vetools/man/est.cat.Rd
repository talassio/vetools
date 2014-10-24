\name{est.cat}
\alias{est.cat}
\title{
Concatenate two collections
}
\description{
Given two \code{Catalog} class collections, this function returns they concatenation
}
\usage{
est.cat(collection1, collection2, check.elements = TRUE)
}
\arguments{
  \item{collection1}{
  a list of class \code{Catalog}.
}
  \item{collection2}{
  a list of class \code{Catalog}.
}
  \item{check.elements}{
  Logical flag to check if both catalogs have the exact members. If false, then
  only the members common to \var{collection1} will be concatenated. Defaults to true.
}

}
\value{
Returns a list with the updated (concatenated) \code{collection}s.
}

\author{
A.M. Sajo-Castelli.
}

\seealso{The other \code{est.*} family members:
\code{\link{est.rm}},
\code{\link{est.sel}},
\code{\link{est.fill}},
\code{\link{est.sort}},
\code{\link{est.union}}.}
% \examples{ }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ est.cat }
\keyword{ est }
