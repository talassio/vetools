\name{plotArrow}
\alias{plotArrow}

\title{
Plots a neat North arrow
}
\description{
Simple and configurable alternative to draw a "North Arrow" on maps.
}
\usage{
plotArrow(shape="",
        pos = 1,
        offset.arrow = c(0, 0),
        north.lwd = par()$lwd+2,
        north.col = par()$col,
        ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{shape}{
The shape file used to estimate the x and y coordinates on where to plot the arrow's polygons
}
\item{pos}{
Where to position the arrow: 1 SW, 2 SE, 3 NE, 4 NW.
}
  \item{offset.arrow}{
Offset pair (x.offset, y.offset).
}
  \item{north.lwd}{
Line width for the North lines.
}
  \item{north.col}{
Color to apply to the North lines
}
  \item{\dots}{
With \dots, it is possible to specify the color and thickness of the arrow via the \code{col} and \code{lwd} parameters. Overall
magnification is controlled by \code{cex}.
}
}

% \value{ }
\author{
A.M. Sajo-Castelli
}
\note{ 
This implementation should support adding the scale bar.
}

\seealso{
\code{\link{plotLayers}}
}


\keyword{ arrow }
