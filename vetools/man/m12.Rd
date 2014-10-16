\name{m12}
\alias{m12}

\title{
Smart modulo 12 for time aritmetics
}
\description{
Calculates which month corresponds to the number \var{x}, \emph{smart} modulo 12-wise.
}
\usage{
m12(x)
}
\arguments{
  \item{x}{ integer }
}

\value{
Returns an integer 1 through 12 for the corresponding month of a positeve integer \var{x}, starting with \var{x}=1 being january. Note that \var{x}=13 is also january\ldots
}

\author{
A.M. Sajo-Castelli
}

\seealso{
\pkg{\link{vetools}},
\code{\link{diffmonths}},
\code{\link{tssum}},
\code{\link{diasdelmes}},
\code{\link{time2ym}},
\code{\link{ym2time}},
\code{\link{xts2ts}}.
}

\keyword{ vetools }
\keyword{ time }
\keyword{ tssum }
