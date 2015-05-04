\name{diasdelmes}
\alias{diasdelmes}

\title{
Sum of days
}
\description{
This function returns the number of days in a sequence of months.
Takes into account leap years.
}
\usage{
diasdelmes(y, meses)
}
\arguments{
  \item{y}{ integer, year from which to reference the months specified by \code{meses}}
  \item{meses}{ a vector of length greater or equal to 1 specifying the months to sum}
}

\value{
returns the number of days specified in the months \code{meses} of the year \code{y}.
}

\author{
A.M. Sajo-Castelli
}

\seealso{
\pkg{\link{vetools}},
\code{\link{diffmonths}},
\code{\link{tssum}},
\code{\link{m12}},
\code{\link{time2ym}},
\code{\link{ym2time}},
\code{\link{xts2ts}}.
}

\keyword{ vetools }
\keyword{ time }

