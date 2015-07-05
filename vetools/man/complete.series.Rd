\name{complete.series}
\alias{complete.series}
\title{
Complete missing data using the EM Algorithm accelerated via SQUAREM 
}
\description{
This functions completes relatively large holes in monthly time-series objects.
}
\usage{
complete.series(collection, cluster = rep(1, length(collection$data)), 
       control = list(maxiter = 1500, trace = FALSE, tol = 5e-5) ) 
}
\arguments{
  \item{collection}{
A list of class \code{Catalog} that contains the objects to complete. 
The collection should be taylored to contain only the stations to complete.
}
  \item{cluster}{
A vector specifying with elemente of the collection belongs wo with cluster. 
This function deploys the EM Algorithm and completes missing data for each cluster. 
Defaults to one single cluster. 
}
  \item{control}{
List controling the behaviour of this function. It contains at most three elements: 
\code{maxiter}, \code{tol}, passed along to the \code{squarem} fixed point iteration accelerator, and
\code{trace} logical flag indicating wether to print progress while executing. The defaults are 1500, 5e-5 and FALSE.
}
}
\details{
The main idea behind this functions is to complete the 
time-series of given clusters (may be only one) containing
similar stations and then applying to each cluster the 
E-M Algorithm in order to complete the series.

The E-M Algorithm is an iterative method that in each 
iteration performs two tasks: fist estimates the
expected values for the missing data and then maximizes their likelyhood. 
This goes on util some stopping criteria is met.
It is well known that EM fixed point iterations are very slow
to converge, this implementation uses SQUAREM acceleration schemes.
For more information consult the \pkg{\link[SQUAREM:squarem]{SQUAREM}} package.
}
\value{
Returns a completed version of \code{collection}. 
}
\author{
A.M. Sajo-Castelli, uses code from A. Jhan.
}

\note{For some combination of data vectors, it is known that the 
iterative proccess not always converges. These circumstances
reflect a poor choice of selected stations time-series (clustering).

It is also known that within the E-M algorithm, specifically in the E step
sometimes the covariance matrix for the missing values can be singular. The
current implementations does not invert the covariance matrix but solves
two linear systems in the least-square sense. When the condition of the involved
matrices are quite deteriored, divergence is possible and even break-down.}

\seealso{\code{\link{fill.small.missing}}, \pkg{\link[SQUAREM:squarem]{SQUAREM}} package.}
\examples{\dontrun{
library(vetools)
library(plyr)

data(Vargas)
collection = est.sel(Vargas, 4 : 10)
panorama(collection)
completed = complete.series(collection, control = list(trace = TRUE))
panorama(collection.completed)


# Build two clusters from monthly effects groupings
KK = length(collection$data)
fit = list()
for (k in 1 : KK) {
        L = length(collection$data[[k]])
        months = rep(seq(12), length.out = L)
        ZZ = model.matrix( ~ as.factor(months)) 
        fit[[k]] = lm(collection$data[[k]] ~ ZZ - 1, singular.ok = TRUE, na.action = na.omit)
}
Dist = laply(fit, coef)
colnames(Dist) <- month.name
(cluster = kmeans(Dist, centers = 2))
completed = complete.series(collection, cluster = cluster$cluster, control = list(trace = TRUE))}}
\keyword{ EM }
\keyword{ completion }
