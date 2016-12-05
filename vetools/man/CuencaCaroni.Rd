\name{CuencaCaroni}
\alias{CuencaCaroni}
\docType{data}
\title{Rainfall data for the Cuenca del \enc{Caroní}{Caroni}, Venezuela}
\description{
  Monthly precipitation values for meteorological stations
  located in the Cuenca del \enc{Caroní}{Caroni}, \enc{Bolívar}{Bolivar} state, Venezuela.
  
  Data set of precipitation for 91 meteorological stations located
  in the \enc{Bolívar}{Bolivar} state, Venezuela. Data set follows 
  \pkg{\link[=CatalogConvention]{vetools}} Catalog
  Convention. See \link[=CatalogConvention]{Catalog Convention}.
}
\usage{
data(CuencaCaroni)
}
\format{
This data set contains a \code{collection} of two members of class \code{list}, each of 91 elements:
  \describe{
    \item{CuencaCaroni$catalog}{list of each station's meta data. 
    Follows \pkg{\link[=CatalogConvention]{vetools}} 
    \link[=CatalogConvention]{Catalog Convention}.
      To see meta data \code{summary(CuencaCaroni)}.}
    \item{CuencaCaroni$data}{list containing each station's time-series of class \code{"ts"}.}
  }
}
\details{

  This data set provides monthly precipitation for 91 meteorological stations
  located in the Cuenca del \enc{Caroní}{Caroni} region of the \enc{Bolívar}{Bolivar} state of Venezuela.
  The region is delimited between -63.88083, -60.60722 degrees and
  3.895833 and 8.333333 degrees (North). Time-series for statios vary
  between 1949 and 2011.

  The data set was imported into \R using 
  \command{\link[=read.MINAMB]{read.MINAMB}} function.
}
%  Source file data set is located at \file{src/CuencaCaroni/lluviasmensuales.dat.gz}
%  inside the package directory (\code{system.file(package="vetools")}).
\source{
Ministerio de \enc{Industrías}{Industrias} \enc{básicas}{basicas} y \enc{Minería}{Mineria}.
CVG, EDELCA (\enc{Electrificación}{Electrificacion} del \enc{Caroní}{Caroni}) C. A.
Gerencia de \enc{Gestión}{Gestion} Ambiental.
(\url{http://www.cvg.gob.ve/}).
}
\examples{
data(CuencaCaroni, package = "vetools")
summary(CuencaCaroni)
plot(CuencaCaroni$data[[2]], main = CuencaCaroni$catalog[[2]]$Name, 
ylab = CuencaCaroni$catalog[[2]]$Measure.unit)
start(CuencaCaroni$data[[80]])
end(CuencaCaroni$data[[80]])
frequency(CuencaCaroni$data[[80]])
}

\seealso{\var{\link{Vargas}}, 
\link[=CatalogConvention]{Catalog Convention},
\command{\link[=read.MINAMB]{read.MINAMB}}.
}

\keyword{datasets}
\keyword{venezuela}
\keyword{caroni}

