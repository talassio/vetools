\name{CatalogConvention}
\alias{CatalogConvention}
\alias{Catalog Convention}
\alias{vetools Catalog Convention}
\title{\pkg{vetools} Catalog Convention White Sheet (Revision 3)}

\description{This white sheet describes the Catalog Convention of \pkg{vetools} package.

\bold{Catalog Convention White Sheet (Revision 3) \cr}
The purpose of this convention is to standarize the data structure used to
store the environmental data and associated meta-data. All data-sets provided and
processed by the \pkg{vetools} package that follow this convention are of class \code{"Catalog"}
and are referred as \code{"Collection"}s. Each collection provides the following 
structure of class \code{list}:
\itemize{
        \item{ A list of class \code{"list"} with name \code{"catalog"} where each element is composed of  
        exactly ten standard elements and zero or more optional/extra elements. 
        The required standard elements are:
        \describe{
                \item{\code{Name}}{Station's name, class \code{"character"}}
                \item{\code{Altitude}}{Stations's altitude in metres. Some data sources 
                lack this information an is taken to be NA}
                \item{\code{Latitude}}{Latitude in degrees}
                \item{\code{Longitude}}{Longitude in degrees, some data sources use West direction}
                \item{\code{Measure.code}}{Measured variable code, sometimes indicates MKS unit}
                \item{\code{Measure.unit}}{Measured data variable description}
                \item{\code{Install}}{Date of station's installation}
                \item{\code{Start}}{Date of start of operation of the station. Some data sources lack
                this information and is taken to be the same as \code{Instalacion}}
                \item{\code{State}}{The state of the country to which the station belongs, some sources
                lack this information and can be taken to be NA}
                \item{\code{Avble.yrs}}{A vector containing the years on which the station 
                allegedly operated. Some source lack this information and is extracted from the measured
                variable and reflects those years that have at least one measurement.}
        }
        }

        \item{One or more lists of measurement data variables, generally of class \code{"ts"}. It is required
        that at least one be present under the name of \code{"data"}.}
}

This pair of lists (\code{"catalog"} and \code{"data"}) form the \code{collection}. The two (or more) 
items are always of class \code{"list"} and are in direct correspondence, \emph{i.e.} item \var{n} of
the \code{"catalog"} corresponds to the measured variable item \var{n} in \code{"data"}.

For example, suppose \var{collection} is a collection of 30 stations,
then \code{collection$catalog[[4]]} element describes the measurement of \code{collection$data[[4]]}.
\cr

\bold{Functions\cr}
Functions provided to read data sources are
\describe{
\item{\code{\link{read.HIDROX}}}{imports Argus 1.0 data source files}  

\item{\code{\link{read.MARN}}}{imports M.A.R.N. files}  

\item{\code{\link{read.MINAMB}}}{imports EDELCA source files}  
}
These functions all return a list class  \code{"Catalog"}. Generally are
parsed as follows:\cr
\preformatted{file = system.file('tests/test-HIDROX.csv',package='vetools')
collection <- read.HIDROX(file)
names(collection$catalog[[1]])
summary(collection)
print(collection)
plot(collection)
}
}


\examples{\dontrun{# This collection has only one station
Collection <- read.MARN(system.file("tests/test-MARN.dat", package="vetools"))
summary(Collection)
plot(Collection$data)
# This collection has many stations
Collection.H <- read.HIDROX(system.file("tests/test-HIDROX.csv", package="vetools"))
summary(Collection.H)
plot(Collection.H$data[[4]])}}



\author{A.M. Sajo Castelli}

\seealso{
\pkg{\link{vetools}},
\command{\link{summary.Catalog}},
\command{\link{read.HIDROX}},
\command{\link{read.MARN}},
\command{\link{read.MINAMB}}.
}

\keyword{ catalog }
