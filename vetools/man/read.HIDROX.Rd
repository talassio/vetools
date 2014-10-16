\name{read.HIDROX}
\alias{read.HIDROX}
\alias{read.MINAMB}
\alias{read.MARN}
\title{
Load environmental data from governmental sources
}
\description{
This sheet describes the functions to load environmental 
data from the formats used by
\bold{MARN} The Ministerio del Ambiente y Recursos 
Naturales.\cr
\bold{MINAMB} The Ministerio del Ambiente.\cr
\bold{HIDROX} The Argus data repository, see the references.

Each Ministry used a different data format to store the 
measured variables. For each 
available data, a \code{read} function is taylored.
}
\usage{
read.HIDROX(file, state = NA, altitudes = NA, serial = NA, unit = NA)
read.MARN(file)
read.MINAMB(file, state = NA, YSPLIT = 20)
}
\arguments{
  \item{file}{
        String containing the path to the file to load.
  }
  \item{state}{
        A two letter character string identifying the state, 
        see \code{\link[=get.shape.state]{get.shape.state(NA)}} 
        for a complete list.
  }
  \item{altitudes}{
        A list containing information relative to the elevation of each station in the file.
  }
  \item{serial}{
        A list containing information relative to the serial of each station in the file.
  }
  \item{unit}{
        A character string identifying the unit of the measured data, e.g. mm/month.
  }
  \item{YSPLIT}{
        This variable indicates from which 
        decade (1900+\code{YSPLIT}) to consider between the 20th and
        21st centuries.
  }
}
\details{
To explore the each data format, the package ships three 
test files.\cr
See the folder
\code{system.file("tests",package="vetools")}.
}
\value{
Returns a list of class \code{Catalog} with exactly two members, 
see \link[=CatalogConvention]{Catalog Convention}.
\item{catalog }{The catalog, a list of each stations meta data.}
\item{data }{The data related to the catalog, a list of 
objects \code{ts}.}
}
\references{
L. Bravo, S. Abad, I. Llatas, A. Salcedo, L. Delgado, 
S. Ramos, K. Cordova.
Hidrox: Repositorio de Datos Hidroclimáticos para la 
Gestión de Riesgos Epidemiológicos y Ambientales.
2012. ISBN:987-9-8012596-2-6.
}
\author{
A.M. Sajo-Castelli
}

\seealso{
\link[=CatalogConvention]{Catalog Convention}.
}
\examples{\dontrun{
collection.ZU = read.HIDROX('repo_est_ZU.csv', state="ZU", unit="Prec [mm/month]"))
summary(collection.ZU)
collection.ZU
}}

\keyword{ read }
\keyword{ load }
