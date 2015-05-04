% Examples:
% Monthly
% months = 1 : 12
% bi-monthly
% months = seq(1, 12, 2)
% # Quarterly
% months = seq(1, 12, 3)
% # Trimestral
% months = seq(1, 12, 4)
% Trimestral starting on Feb.
% months = c(2, 5, 8, 11)
% Semestral
% months = c(1, 7)
% Semestral starting on Apr.
% months = c(4, 10)
\name{tssum}
\alias{tssum}
\alias{tssum.d2m}

\title{
\command{sum} for time-series objects
}
\description{
Function to sum time-series and convert to different frequency
}
\usage{
tssum(serie, intervals = 1, max.na.fraction = 0.3, safe.check = FALSE)
tssum.d2m(serie, months = 1 : 12, max.na.fraction = 0.3, safe.check = FALSE)
}
\arguments{
  \item{serie}{ a class \code{"ts"} object }
  \item{intervals}{ a vector of length of at least 1 with elements between 1
  and \code{frequency(series)} specifying the intervals to sum}
  \item{months}{ a vector of length 1 to 12 specifying the months to sum}
  \item{max.na.fraction}{ fraction of NAs to admit before discarding
  accumulated sum over \code{intervals} or \code{months} replacing it by a
  single NA}
  \item{safe.check}{ logical flag specifying if mass loss should be reported}
}

\details{
The function \command{tssum} handles all sorts of frequencies except
daily which is specially handled by \command{tssum.d2m}.
}

\value{
Returns a time-series object of class \code{"ts"} of frequency \code{length(intervals)}
or \code{length(months)} with the accumulated sum over the defined periods.
}

\examples{
library(vetools)
data(Vargas)
# Convert monthly series to yearly ####
yearly <- tssum(Vargas$data[[1]])

# Convert monthly series to quarterly ####
quarterly <- tssum(Vargas$data[[1]], intervals = c(1, 4, 7, 10))

# Convert monthly series to quarterly, starting on FEB ####
quarterly <- tssum(Vargas$data[[1]], intervals = 1 + c(1, 4, 7, 10))
# Volume relation:
format(100 * sum(quarterly, na.rm = TRUE) / sum(Vargas$quarterly[[1]],
na.rm = TRUE), digits=3)

# Convert daily series to yearly ####
yearly <- tssum(Vargas$data[[1]], intervals = 1:12)

# Convert daily series to bi-semestrely ####
sem <- tssum(Vargas$data[[1]], intervals = seq(1, 12, 6))
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
