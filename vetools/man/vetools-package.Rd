\name{vetools-package}
\alias{vetools-package}
\alias{vetools}
%%%
\docType{package}
\title{
Some tools for Venezuelan environmental data
}
\description{
This toolset provides a bundle of functions to handle and unify the diverse
data formats of distinct government agencies and military bodies: 
Ministerio del Ambiente, Marina Venezolana, etc. It also provides all
necessary tools to load these data sets.
In order to standarize the structure of the data provided and/or
processed, a \pkg{\link[=CatalogConvention]{vetools}} 
\link[=CatalogConvention]{Catalog Convention} is presented.}
\details{
\tabular{ll}{
Package: \tab vetools\cr
Type: \tab Package\cr
Version: \tab 1.x series\cr
Initial Release Date: \tab 2013-08-01\cr
License: GPL\cr
}

Input functions:\cr
\code{\link{read.HIDROX}}\cr
\code{\link{read.MINAMB}}\cr
\code{\link{read.MARN}}\cr

Preprocessing functions:\cr
\code{\link{disaggregate.ts}}\cr
\code{\link{disaggregate.MARN}}\cr
\code{\link{complete.series}}\cr
\code{\link{fill.small.missing}}

EST family functions:\cr
\code{\link{est.cut}}\cr
\code{\link{est.fill}}\cr
\code{\link{est.rm}}\cr
\code{\link{est.union}}\cr
\code{\link{est.sort}}

Descriptive functions:\cr
\code{\link{panorama}}\cr
\code{\link{panomapa}}\cr
\code{\link{summary.Catalog}}\cr
\code{\link[=summary.Catalog]{print.Catalog}}\cr
\code{\link[=summary.Catalog]{plot.Catalog}}

SHAPE family functions:\cr
\code{\link{get.shape.state}}\cr
\code{\link{get.shape.venezuela}}\cr
\code{\link{get.shape.range}}\cr
\code{\link{get.Grid.size}}

Class \code{Catalog}\cr
\code{\link{Catalog}}\cr
\code{\link{is.Catalog}}\cr
\code{\link{as.Catalog}}

For a complete list of functions, use \code{library(help = "vetools")}.

Convention Sheet:\cr
\link[=CatalogConvention]{Catalog Convention White Sheet}\cr

Datasets:\cr
\var{\link{CuencaCaroni}}\cr
\var{\link{Vargas}}\cr
\var{\link[=Vargas]{Vargas2}}\cr


}
\author{
A. M. Sajo-Castelli. Centro de Estadística y Matemática Aplicada (CEsMA).
Universidad Simón Bolívar. Venezuela.

Contributors: D. E. Villalta, L. Bravo. CEsMA, Universidad Simón Bolívar. Venezuela.
                                                                    
R. Ramírez. Parque Tecnológico Sartenejas, Universidad Simón Bolívar. Venezuela.

Maintainer: A. M. Sajo-Castelli <asajo@usb.ve>
}
\references{L. Bravo, S. Abad, I. Llatas, A. Salcedo, L. Delgado, S. Ramos, K. Cordova.
Hidrox: Repositorio de Datos Hidroclimáticos para la Gestión de Riesgos Epidemiológicos y Ambientales.
2012. ISBN:987-9-8012596-2-6.
}
\keyword{venezuela}
\keyword{environmental}