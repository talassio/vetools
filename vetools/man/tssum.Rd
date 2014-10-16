\name{tssum}
\alias{tssum}

\title{
The \command{sum} for time-series objects
}
\description{
This function is time related that helps manipulate time-series.
}
\usage{
tssum(series, months = 1:12, max.na.fraction = 0.3, safe.check = FALSE)
}
\arguments{
  \item{series}{ a class \code{"ts"} object }
  \item{months}{ a vector of length 1 to 12 specifying the months to sum}
  \item{max.na.fraction}{ fraction of NAs to admit before discarding accumulated sum over \code{meses} }
  \item{safe.check}{ boolean specifying if some debbuging checks should be performed}
}

\value{
returns a time-series object of class \code{"ts"} of frequency \code{length(meses)} with the accumulated sum over the months defined in \code{meses}.
}

\author{
A.M. Sajo-Castelli
}

\seealso{
\pkg{\link{vetools}},
\code{\link{diffmonths}},
\code{\link{diasdelmes}},
\code{\link{m12}},
\code{\link{time2ym}},
\code{\link{ym2time}},
\code{\link{xts2ts}}.
}

\keyword{ vetools }
\keyword{ time }
\keyword{ tssum }
