\name{disaggregate.MARN}
\alias{disaggregate.MARN}

\title{
Disaggregates a time-series using a reference (surrogate) serie
}
\description{
For a brief introduction on disaggregation see 
\code{\link{disaggregate.ts}}. 
In order to disaggregate, a distribution of the 
asterisks is required. In this
implementation, the distribution is estimated 
using a surrogate serie. In
general terms the surrogate serie is very 
carefully drafted.
}
\usage{
disaggregate.MARN(stream = NULL, reference = NULL, 
na.action = "error", asterisk = -9999, date.eps = 0.004, 
float.eps = 1e-04, return.incomplete = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{stream}{
An aggregated \code{ts} object. 
}
  \item{reference}{
A reference or surrogate \code{ts} object.
}
  \item{na.action}{
Action to take if the sample distribution has NAs present. 
Can be \code{"mean"} 
(\code{"average"}, \code{"warning"}, \code{"continue"}) or 
\code{"error"}. In the first case the sampled
distribution is the average. On the second, the process is 
stoped, if \var{return.incomplete} is true then
the progress of disaggregation is returned.
}
  \item{asterisk}{
Scalar denoting values to complete.
}
  \item{date.eps}{
Tolerance in date/time matching.
}
  \item{float.eps}{
Smallest mass to distribute along the aggregated elements.
}
  \item{return.incomplete}{
Boolean value to interrupt the process and return the 
incompletely disaggregated series. See details.
}
}
\details{
The parametre \var{return.incomplete} is very usefull to 
build surrogate series, as follows. Say there is
a list of 15 aggregated series, then in order to build a 
reference series for all of them, the following
hueristic can help. Suppose these series are ordered by 
least NAs and asterisks present. 
\preformatted{
reference <- pr[[1]]
k = 1
restart:
for ( station in 1:k ) {
        reference <- desagregate.MARN(pr[[k]], 
        reference, return.incomplete=TRUE)
}
if ( reference is not yet fully desagregated ) { k <- k + 1 }
goto restart
}
The main feature of this procedure is that it always tries to 
use the best serie first then the second best, etc.
It may not complete the task if the sample distribution contains 
NAs for \emph{all} 15 stations. Under this precarious
condition, artificial or external information can be used.
}
\value{
Returns a disaggregated series. If the switch 
\var{return.incomplete} is true, then it returns a
series that was disaggregated until NAs where found 
on the sample distribution.
}

\author{
A.M. Sajo-Castelli
}

\seealso{
\code{\link{disaggregate.ts}}
}

\keyword{ agregation }
\keyword{ disaggregation }
