\name{Catalog}
\alias{Catalog}
\alias{catalog}
\alias{as.Catalog}
\alias{is.Catalog}
\title{
        Collection of class \code{Catalog}
}
\description{
Constructs or tests for collections
}
\usage{
Catalog(catalog, data, ...)
is.Catalog(x, ignore.class = FALSE)
as.Catalog(x) 
}
\arguments{
  \item{catalog}{A list of exactly ten elements and zero or more optional elements. See details in \link[=CatalogConvention]{Catalog Convention}}
  \item{data}{A list of any kind of the same length as \code{catalog}}
  \item{x}{Possibly a collection of class \code{Catalog}}
  \item{ignore.class}{Test if \code{x} is a collection ignoring its class}
  \item{\dots}{zero or more \R objects to include in the construction of the collection}
}
%\details{}

\value{\code{Catalog} and \code{as.Catalog} return a collection of class \code{Catalog},
fully qualified and following the \link[=CatalogConvention]{Catalog Convention}. If
"\code{\dots}" is not missing then all its objects are included in the collection.

\code{is.Catalog} returns a logical value.}
%%\references{
%%
%%}
\author{
A.M. Sajo-Castelli
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\link[=CatalogConvention]{Catalog Convention},
\pkg{\link{vetools}}.
}
\keyword{ vetools }

