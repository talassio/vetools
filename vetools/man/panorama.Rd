\name{panorama}
\alias{panorama}
\alias{panomapa}
\title{
Overview of a \code{collection} of stations
}
\description{
These functions present an overview of the data quality for a 
\code{collection} of meteorological stations in a temporal or 
spatial perspective.
}
\usage{
panorama(collection, main, cut, ylab.push.factor = 10, cut.col = "darkred", 
    cut.lty = 1, cut.lwd = 2, col = "RoyalBlue", col.ramp = c("red", 
        "pink", "blue"), col.line = "gray30", mar = c(5, 4 + 
        ylab.push.factor, 3, 2), cex.axis = 0.8, cex.yaxis = 0.7, 
    xlab = "Year", color.by.data = FALSE, ...) 

panomapa(collection, main, axis = TRUE, xlab = "Long", 
    ylab = "Lat", lab.col = "black", bg = NA, map.bg = NA, 
    map.col = "black", col.ramp = c("Green3", "darkorange1", 
    "red"), arrow.cex = 4.5, arrow.plot = TRUE, 
    pt.col = rgb(0, 0, 0, 0.75), pt.cex = 4.5, pt.pch = 21, 
    leg.pt.bg = pt.bg, leg.bg = NA, leg.title = "Lengevity\n(years)", 
    leg.offset = c(0, 0), leg.y.intersp = 1.75)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{arrow.cex}{Magnification passed to \code{arrow.plot}, defaults to 4.5}
\item{arrow.plot}{Logical flag to indicate if to call \code{arrow.plot}, defaults to TRUE.}
\item{axis}{Logical flag to indicate if to plot the axes, defaults to TRUE}
\item{bg}{Backgrund color for the map, defaults to NA}
\item{cex.axis}{Magnification for axis, defaults to 0.8}
\item{cex.yaxis}{Magnification for y-axis, defaults to 0.8 = 0.7}
\item{col}{\code{col} from \code{par}, defaults to "RoyalBlue"}
\item{col.line}{Color for lines, defaults to "gray30"}
\item{col.ramp}{Color for the color ramp, defaults to \code{c("red", "pink", "blue")} for \code{panorama} and to \code{c("Green3", "darkorange1", "red")} for \code{panomapa}}
\item{color.by.data}{Logical flag to use \code{collection$data} to color
the plotted boxes. This implies that all elements of \code{data} are between zero and one.
Defaults to FALSE.}
\item{collection}{An collection of stations. Object of class \code{Catalog}}
\item{cut}{A concatenation of dates for which to trace a vertical line}
\item{cut.col}{Color to the \code{cut} line(s), defaults to "darkred".  Can be a list}
\item{cut.lty}{Line type for the \code{cut} line(s), defaults to 1. Can be a list}
\item{cut.lwd}{Line width for the \code{cut} line(s), defaults to 2. Can be a list}
\item{lab.col}{Color for the labels, defaults to "black"}
\item{leg.bg}{Legend box Backgrund color, defaults to NA}
\item{leg.offset}{Legend offset, defaults to \code{c(0, 0)}}
\item{leg.pt.bg}{Legend  points background color, defaults to \code{pt.bg}}
\item{leg.title}{Legend title, defaults to "Lengevity\\n(years)"}
\item{leg.y.intersp}{Legend y interspace, is passed to \code{legend} and defaults to 1.75}
\item{main}{Main title}
\item{map.bg}{Map background color, defaults to NA}
\item{map.col}{map lines color, defaults to "black"}
\item{mar}{\code{par()$mar}, defaults to \code{c(5, 4 + ylab.push.factor, 3, 2)}}
\item{pt.cex}{Points magnification in map, defaults to 4.5}
\item{pt.col}{Points color in map, defaults to \code{rgb(0, 0, 0, 0.75)}}
\item{pt.pch}{Points \code{pch} in map, defaults to 21}
\item{xlab}{for \code{panorama} defaults to "Year" and for \code{panomapa} to "Long".}
\item{ylab}{y-axes label, defaults to "Lat"}
\item{ylab.push.factor}{Factor in which to push the labels in \code{panorama}, defaults to 10}
\item{...}{Any valid parametres for \code{par()}}
}
\value{
These functions do not return anything.
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
        A.M. Sajo-Castelli
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
        \pkg{\link{vetools}},
        \link[=CatalogConvention]{Catalog Convention},
        \link[=summary.Catalog]{summary}.
}
\examples{\dontrun{
panorama(collection)
collection
panomapa(collection)
plot(collection)}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ panorama }
\keyword{ panomapa }
\keyword{ overview }
% __ONLY ONE__ keyword per line
