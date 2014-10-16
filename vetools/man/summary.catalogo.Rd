\name{summary.Catalog}
\alias{summary.Catalog}
\alias{print.Catalog}
\alias{plot.Catalog}

\title{
Shows a summary, a panoramic overview in temporal or spatial fashion 
for a given \code{collection} of data/catalog pairs
}
\description{
Given a list in the \link[=CatalogConvention]{Catalog Convention} format, these functions
print or plot a summary of the stations data and meta-data.
}

\usage{
\method{summary}{Catalog}(object, ...)
\method{plot}{Catalog}(x, ...)
\method{print}{Catalog}(x, ...)
}

\arguments{
  \item{object}{ An object of class \code{catalogo}.}
    \item{x}{ An object of class \code{catalogo}.}
  \item{...}{ See \code{\link{panorama}} and \code{\link{panomapa}}.}
}

\author{
A.M. Sajo-Castelli
}
\note{The method \code{print} calls the function \code{panorama} and the method \code{plot} calls \code{panomapa}.}

\seealso{
\link{CatalogConvention}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{\dontrun{
collection = read.HIDROX('test-HIDROX.csv')
summary(collection)
print(collection)
plot(collection)}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ catalogo }
\keyword{ catalog }
\keyword{ summary }
