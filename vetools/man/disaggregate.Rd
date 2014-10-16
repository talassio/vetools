\name{disaggregate.ts}
\alias{disaggregate.ts}

\title{
Desagregates a time-series
}
\description{
This function disaggregates pilled-up data. Agregation points are denoted by the
scalar following one or more \emph{asterisks}. The job of this function is to distribute the
mass accumulated in the first non asterisk measurment between the previous points
marked with asterisks.
}
\usage{
disaggregate.ts(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
        An aggregated \code{ts} object.
  }
  \item{...}{
        defaults to \code{asterisk} = -9999 and \code{fun} = \code{median}.
  
        Where \code{asterisk} is a scalar that denotes values to 
        complete, defaults to -9999, and \code{fun} is the name of
        the function to use to build the sampled distributions. 
        Defaults to \code{median}.
  }
}
\details{
Say a time-series is of weekly frequency and is
\preformatted{
Week   Mon  Tue  Wen  Thu  Fri  Sat  Sun
...
k     14.5 19.0 25.5 25.2 19.8 12.3 13.7
k+1   NA   18.7    *    *    * 83.2 14.2
...
}
The task is to distribute 83.2 between Wen and Sat of week k+1 
using the sampled distribution of Wen, Thu, Fri and Sat of \emph{all} available
weeks. Sometime this is not possible and in this case all days get the equal mass
distribution.
}
\value{
Returns a disaggregated \code{ts} object.
}
\author{
A.M. Sajo-Castelli
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{disaggregate.MARN}}
}

\keyword{ disaggregation }
\keyword{ aggregation }
