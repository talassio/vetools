% Version 1.3.19
\name{Vargas}
\alias{Vargas}
\alias{Vargas2}
\docType{data}
\title{Rainfall in Vargas, Venezuela}
\description{
  Daily, monthly and quarterly precipitation values for meteorological stations
  located in the Vargas state, Venezuela.
  
  There are two \code{collections} (data sets) of precipitation, 
  \var{Vargas} and \var{Vargas2}, both data sets
  have the same source of meteorological stations located in the Vargas state, Venezuela.
  Data sets follows \pkg{\link[=CatalogConvention]{vetools}} Catalog
  Convention. See \link[=CatalogConvention]{Catalog Convention}.
}
\usage{
        data(Vargas)
        data(Vargas2)
}
\format{
The first collection \var{Vargas} contains four lists of 33 elements:
  \describe{
    \item{Vargas$catalog}{list of each station's meta data. Follows \pkg{\link[=CatalogConvention]{vetools}} \link[=CatalogConvention]{Catalog Convention}.
      To see meta data \code{summary(Vargas)}.}
    \item{Vargas$daily}{list containing each station's daily time-series of class \code{"ts"} of frequency 365.25.}
    \item{Vargas$data}{list containing each station's monthly time-series of class \code{"ts"} of frequency 12.}
    \item{Vargas$quarterly}{list containing each station's quarterly time-series of class \code{"ts"} of frequency 4.
    The quarters are defined in base of Venezuela's rainy season: Feb-Apr, May-Jul, Aug-Oct, Nov-Jan.}
  }

  The "data" and "quarterly" member series where built upon \code{daily} using the command \command{tssum} with arguments
  \code{meses=1:12} and \code{meses=c(2, 5, 8, 11) respectively.}

  The second \code{collection} \var{Vargas2} contains three elements:
\describe{
    \item{Vargas2$catalog}{
        list of 32 station's meta data. 
        Follows \pkg{\link[=CatalogConvention]{vetools}} 
        \link[=CatalogConvention]{Catalog Convention}.
        To see meta data \code{summary(Vargas2)}.
    }
    \item{Vargas2$data}{
        list of length 32 containing each 
        station's time-series of class 
        \code{"ts"} on monthly basis. These 
        series where completed using the 
        Expectation-Maximization Algorithm.
    }
    \item{Vargas2$statewise}{representative time-serie 
        for the whole Vargas state. This series was build 
        upon \command{Vargas2$data}.
    }
}
}
\details{
  This data set provides day, monthly, quarterly and representative precipitation
  for 33 (32) meteorological stations located in the Vargas state of Venezuela.
  The region is delimited between -66.30917, -67.35 degrees  and
  10.46667 and 10.63 degrees (North), stations height vary between 0 and 1537
  metres above sea level. Time-series for statios vary between 1948 and 2006.

  The data set was imported into \R using \command{\link[=read.MARN]{read.MARN}} function.
%  Source file data set is located at \file{src/Vargas/Vargas.tgz}
%  inside the package directory (\code{system.file(package="vetools")}).
}
\source{
        Ministerio de Agricultura y Recursos Naturales.
        División de \enc{Hidrología}{Hidrologia}, \enc{Meteorología}{Metorologia} y \enc{Oceanología}{Oceanologia}
        (\url{http://www.minamb.gob.ve/}).
}

\examples{\dontrun{
data(Vargas, package='vetools')
summary(Vargas)
plot(Vargas$data[[2]])
start(Vargas$data[[1]])
end(Vargas$data[[1]])
frequency(Vargas$daily[[1]])
cat(Vargas$catalog[[1]]$Name)}}

\seealso{
\var{\link{CuencaCaroni}},
\pkg{\link[=CatalogConvention]{vetools}} \link[=CatalogConvention]{Catalog Convention},
\command{\link[=read.MARN]{read.MARN}},
\command{\link[=disaggregate.MARN]{disaggregate.MARN}},
\command{\link[=tssum]{tssum}}.
}

\keyword{datasets}
\keyword{venezuela}
\keyword{vargas}
