\name{fill.small.missing}
\alias{fill.small.missing}

\title{
Complete daily-frequency time-series
}
\description{
This routine completes a series of frequency 365.25. Each NA is estimated
using the function \code{fun} (median) of the same day of all other years (where available).
}
\usage{
fill.small.missing(serie, max.len = 3 * 30, func = median)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{serie}{
A \code{ts} object.
}
  \item{max.len}{
Largest gap (in days) to complete using this method. Defaults to 3 months. 
}
  \item{func}{
Function to use in order to estimate an NA. Defaults to median.
}
}
\details{
This function completes \emph{small} gaps of NA, it is not intended to
complete long periods of NAs. If required to complete large sets of NAs, see
\code{\link{complete.series}}.
}
\value{
Returns a \code{ts} object with gaps of NA greater than \var{max.len} days (if present).
}

\author{
A.M. Sajo-Castelli, Desiree Villalta.
}
\note{
This function is verbose, some information of its running tasks is presented.}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{complete.series}}
}
% \examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ fill }
\keyword{ missing }
