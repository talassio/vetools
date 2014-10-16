\name{complete.series}
\alias{complete.series}
\title{
Complete relatively large holes in data-sets 
}
\description{
This functions completes relatively large holes in monthly time-series objects.
}
\usage{
complete.series(collection, model, k.ubic = NA, centers = 3, nstart = 3, 
weps = 0.05, MAX.ITER = 100, AEM.debug = T)
}
\arguments{
  \item{collection}{
A list of class \code{Catalog} that contains the objects to complete.
}
  \item{model}{
A list of fixed-effects models related to \code{collection$data}.
}
  \item{k.ubic}{
A data.frame of exactly one member \code{k.ubic$cluster} which is a scalar 
vector of length equal to \code{collection$data}
and specifying to which cluster belongs to each element of the list \code{collection$data}.
}
  \item{centers}{
If \code{k.ubic} is unavailable, this sets the quantity of clusters to build.
}
  \item{nstart}{
If \code{k.ubic} is unavailable, then this parametre sets the initial 
quantity of center with which to
start the k-means algorithm.
}
  \item{weps}{
Tolerance for the E-M Algorithm.
}
  \item{MAX.ITER}{
Maximum number of iterations for the E-M Algorithm.
}
  \item{AEM.debug}{
Logical flag indicating if verbosity is required.
}
}
\details{
The main idea behind this functions is to complete the 
time-series of the list by first clustering
similar stations and then applying to each cluster the 
E-M Algorithm in order to complete the series.
The E-M Algorithms is an iterative method that in each 
iteration performs two tasks: fist estimates the
expected values and then maximizes their likelyhood. 
This goes on util some stopping criteria is meat.
}
\value{
Returns a completed version of \code{collection} (\code{collection$data}). 
}
\author{
A. Jhan, fixed-up by A.M. Sajo-Castelli.
}

\note{The current implementation is known to have problems. 
The iterative proccess not always converges. It is also
known that the E-M has been surpassed by other methods and 
it would be desireble to replace it.}

\seealso{\code{\link{fill.small.missing}}}
\examples{\dontrun{
for (k in 1:15) {
        fit[[k]] = lm(collection$data[[k]] ~ ZZ - 1, singular.ok=T, na.action=na.omit)
}
collection.completed = complete.series(collection, fit)}}
\keyword{ EM }
\keyword{ completion }
