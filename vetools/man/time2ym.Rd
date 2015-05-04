\name{time2ym}
\alias{time2ym}
\alias{ym2time}

\title{
Time related conversion functions
}
\description{
These functions convert between class \code{"Date"} and \code{c(year, month)} dates.
}
\usage{
time2ym(d)
ym2time(e)
}
\arguments{
  \item{d}{ object of class \code{"Date"}  that can be converted to \code{c(year, month)}}
  \item{e}{ object of class \code{"ts"} }
}

\value{
\describe{
\item{\code{time2ym}}{returns a vector of length 2 specifying year and month corresponding to a date given, compatible with commands \command{\link{start}} and
\command{\link{end}} for objects of class \code{"ts"}}
\item{\code{ym2time}}{returns a class \code{"Date"} object determined by the specified year and month}
}
}

\author{
A.M. Sajo-Castelli
}

\seealso{
\pkg{\link{vetools}},
\code{\link{diffmonths}},
\code{\link{tssum}},
\code{\link{diasdelmes}},
\code{\link{xts2ts}}.
}

\keyword{ vetools }
\keyword{ time }
