\name{diffmonths}
\alias{diffmonths}

\title{
Difference between two time-series
}
\description{
Calculates the difference in months of two time-series objects.
}
\usage{
diffmonths(date1, date2)
}
\arguments{
  \item{date1}{ objects of class \code{"ts"}}
  \item{date2}{ objects of class \code{"ts"}}
}

\value{
Returns the number of months between the start of two class \code{"ts"} objects
}

\author{
A.M. Sajo-Castelli
}

\seealso{
\pkg{\link{vetools}},
\code{\link{diasdelmes}},
\code{\link{tssum}},
\code{\link{m12}},
\code{\link{time2ym}},
\code{\link{ym2time}},
\code{\link{xts2ts}}.
}

\keyword{ vetools }
\keyword{ time }
