\name{est.fill}
\alias{est.fill}
\title{
 For each member of a collection call the function \code{fill.small.missing}
}
\description{
Given a list of class \code{Catalog}, it completes each station's \code{data} in such a 
manner that \emph{all} stations either start or end at the same time. 
Missing values for each station are estimated by calling the 
function \code{\link{fill.small.missing}}.
}
\usage{
est.fill(collection, cut = c(1968, 3), at.start = T)
}
\arguments{
  \item{collection}{
A list of class \code{Catalog} with member \code{data}  of class \code{ts} with frequency 365.25.
}
  \item{cut}{
A vector designating the (year, month) that all stations will
start.
}
  \item{at.start}{
  Boolean value indicating whether the stations data should be completed
  from the start or the end.
}
}
\details{
The purpose of this function is to have a common start and/or end dates 
for a given collection of stations. Suppose there are three stations 
in a collection, with span
\preformatted{
range(col$data[[1]]) -> c(1981,4) to c(2013,3)
range(col$data[[2]]) -> c(1981,2) to c(2013,4)
range(col$data[[3]]) -> c(1981,3) to c(2013,5)
}
and would like to have them all start on (1981,2) and end on (2013,5). This funcion
can achieve this task.
}
\value{
Returns a list of class \code{Catalog} with member \code{data} completed.
}
\author{
A.M. Sajo-Castelli
}

\seealso{The other \code{est.*} family members:
\code{\link{est.rm}},
\code{\link{est.sort}},
\code{\link{est.cut}},
\code{\link{est.union}}.}
% \examples{ }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ est }
\keyword{ est.fill }
