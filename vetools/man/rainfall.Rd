% This example requires vetools at least version 1.3.29
\name{rainfall}
\alias{rainfall}
\title{Trend estimation for rainfall data of Cuenca del \enc{Caroní}{Caroni}, \enc{Bolívar}{Bolivar} state, Venezuela}
\description{
        Examples show the spatial trend distribution of rainfall data registered in
the south state \enc{Bolívar}{Bolivar} in Venezuela. The trend is estimated using yearly totals and
monthly anomaly annual maxima. These examples can be run by typing \code{example(rainfall)}.
}
\author{
	A.M. Sajo-Castelli
}
\examples{
library(vetools)
library(plyr)

# Input data ####
data(CuencaCaroni)

# Annual totals ####
CuencaCaroni$annual <- llply(CuencaCaroni$data, tssum)
k = 3
plot(CuencaCaroni$annual[[k]], ylab = "[mm]",
     ylim = c(0, max(CuencaCaroni$annual[[k]], na.rm = TRUE)))
lines(CuencaCaroni$data[[k]], col='blue')
title(paste('Monthly and annual series\nfor station',CuencaCaroni$catalog[[k]]$Name))

# Remove stations with less than 15 data points ####
list <- unlist(lapply(CuencaCaroni$annual, function(x) {sum(!is.na(x))}))
(list   <- (1 : length(list))[list < 15])
CuencaCaroni <- est.rm(CuencaCaroni, list)

# Show stations spatially ####
plot(CuencaCaroni)

# Trend models ####
tvalues <- function(x) {
        lm = lm(x ~ time(x))
        return(summary(lm)$coefficients[2, 3])
}
t.beta1 = ldply(CuencaCaroni$annual, tvalues)

# Map of trends ####
# Classify the trends by the t-values of the $\beta_1$ trend.
# Groups are classified by color:
# col = brewer.pal(5, 'Spectral')
# cla[t.beta1 <= -2]                = col[1]
# cla[-2 < t.beta1 & t.beta1 <= -1] = col[2]
# cla[-1 < t.beta1 & t.beta1 <= -0] = col[3]
# cla[-0 < t.beta1 & t.beta1 <=  1] = col[4]
# cla[ 1 < t.beta1 ]                = col[5]

col = c("red2", "magenta", "darkgray", "limegreen", "dodgerblue")
cla = rep(NA, length( CuencaCaroni$data))
cla[t.beta1 <= -2] = col[1]
cla[-2 < t.beta1 & t.beta1 <= -1] = col[2]
cla[-1 < t.beta1 & t.beta1 <= -0] = col[3]
cla[-0 < t.beta1 & t.beta1 <=  1] = col[4]
cla[ 1 < t.beta1 ] = col[5]
LL <- ldply(CuencaCaroni$catalog, function(x) {c(x$Longitude, x$Latitude)})
names(LL) <- c('Longitude', 'Latitude')
ES <- get.shape.state("BO")
layout(matrix(c(1,2), ncol = 1), widths = c(1,1), heights = c(2,1))
plot(ES, asp = 1)
points(LL$Longitude, LL$Latitude, pch = 20, col = cla, asp = 1, cex=1.6)
plotArrow(ES)
title('Spatial distribution of trend estimates [Annual totals]')
plot(1 : 5, rep(1, 5), axes = FALSE,
     pch = 20, col = col, cex = 4, ylab = NA,
     xlab = NA, xlim = c(-4, 10))
text(1 : 5, rep(1, 5), labels = c('-2', '-1', '0', '1', '2'), cex = 0.6)


# Example graphs of trends ####
lmsf <- function(x) {
        lm = lm(x ~ time(x))
        return(lm$coefficients)
}
lms = ldply(CuencaCaroni$annual, lmsf)
layout(1)
p = 12
plot(CuencaCaroni$data[[p]], ylim = c(0, max(CuencaCaroni$annual[[p]],
                                             na.rm = TRUE)), ylab="[mm]")
abline(v = start(CuencaCaroni$annual[[p]])[1] : end(CuencaCaroni$annual[[p]])[1],
       lty = 2, col = 'gray')
points(0.5 + start(CuencaCaroni$annual[[p]])[1] : end(CuencaCaroni$annual[[p]])[1],
       0 + CuencaCaroni$annual[[p]], typ = 'p', lwd = 3)
abline(a = lms[p, 1], b = lms[p, 2], col = cla[p], lwd = 7)
title(paste('Monthly and annual series\nfor station',CuencaCaroni$catalog[[p]]$Name))
text(sum(start(CuencaCaroni$data[[p]])+end(CuencaCaroni$data[[p]]))/2,
     max(CuencaCaroni$annual[[p]], na.rm = TRUE)/2,
     labels = format(t.beta1[p,], digits=4), col=cla[p], cex=2)


# Monthly anomaly annual maxima ####
ann <- function(serie) {
        start = start(serie)
        end = end(serie)
        pads = rep(NA, start[2] - 1)
        pade = rep(NA, 12 - end[2])
        Serie <- c(pads, serie, pade)
        means = rep(NA, 12)
        for ( m in 1 : 12) {
                idx = seq(m, length(Serie), 12)
                means[m] = mean(Serie[idx], na.rm = TRUE)
                Serie[idx] = Serie[idx] - means[m]
        }
        Serie = ts(Serie, start = start(serie), frequency = frequency(serie))
        return(list(Annomalies = Serie, Means = means))
}

getmaxannual <- function(series) {
# Assumes series starts on JAN and end on DIC
        G = matrix(series, ncol = 12, byrow = TRUE)
        # Ignore max warnings
        m = apply(G, 1, max, na.rm = TRUE)
        m[m == -Inf] <- NA
        m <- ts(m, start=start(series), frequency = 1)
}

Colors <- c(paste0("magenta", 1 : 3),
            paste0("goldenrod", 1 : 3),
            paste0("turquoise", 1 : 3),
            paste0("slateblue", 1 : 3))[c(3 : 12, 1, 2)]

Annomalies <- lapply(CuencaCaroni$data, ann)
monthlymeans <- ldply(Annomalies, function(x) {x$Means})
colnames(monthlymeans) <- month.abb

# Show monthly averages ####
boxplot(monthlymeans, col = Colors)
title("Boxplots of monthly averages for all stations")
CuencaCaroni$Annomalies <- lapply(Annomalies, function(x) { x$Annomalies })
w = options("warn")$warn
options(warn = -1)
CuencaCaroni$Annual.ann <- lapply(CuencaCaroni$Annomalies, getmaxannual)
options(warn = w)

# Show an annomaly (annual) series ####
p = 12
plot(CuencaCaroni$data[[p]], ylim = c(min(CuencaCaroni$Annomalies[[p]],
        na.rm = TRUE), max(CuencaCaroni$data[[p]],
        na.rm = TRUE)), ylab="[mm]")
lines(CuencaCaroni$Annomalies[[p]], col = 'red2')
lines(CuencaCaroni$Annual.ann[[p]], col = 'purple', lwd = 5)
points(CuencaCaroni$Annual.ann[[p]], col = 'purple', lwd = 5)
title(paste('Monthly measure and annomalies\nfor station', CuencaCaroni$catalog[[p]]$Name))

# Trend models ####
t.beta1 = ldply(CuencaCaroni$Annual.ann, tvalues)

# Map of trends ####
cla = rep(NA, length( CuencaCaroni$Annual.ann))
cla[t.beta1 <= -2] = col[1]
cla[-2 < t.beta1 & t.beta1 <= -1] = col[2]
cla[-1 < t.beta1 & t.beta1 <= -0] = col[3]
cla[-0 < t.beta1 & t.beta1 <=  1] = col[4]
cla[ 1 < t.beta1 ] = col[5]
layout(matrix(c(1,2), ncol = 1), widths = c(1,1), heights = c(2,1))
plot(ES, asp = 1)
points(LL$Longitude, LL$Latitude, pch = 20, col = cla, asp = 1, cex=1.6)
plotArrow(ES)
title('Spatial distribution of trend estimates [max ann]')
plot(1 : 5, rep(1, 5), axes = FALSE,
     pch = 20, col = col, cex = 4, ylab = NA,
     xlab = NA, xlim = c(-4, 10))
text(1 : 5, rep(1, 5), labels = c('-2', '-1', '0', '1', '2'), cex = 0.6)

# Example graphs of trends ####
lms = ldply(CuencaCaroni$Annual.ann, lmsf)
layout(1)
p = 1
plot(CuencaCaroni$Annomalies[[p]], col = "red2", ylab="[mm]")
#ylim = c(min(CuencaCaroni$Annual.ann[[p]],
        #na.rm = TRUE), max(CuencaCaroni$data[[p]],
#        na.rm = TRUE)),
# lines(CuencaCaroni$Annomalies[[p]], col='red2')
lines(CuencaCaroni$Annual.ann[[p]], col = 'purple', lwd = 5)
points(CuencaCaroni$Annual.ann[[p]], col = 'purple', lwd = 5)
abline(a = lms[p, 1], b = lms[p, 2], col = cla[p], lwd = 7)
title(paste('Monthly annomalies & annual maxima \nfor station', CuencaCaroni$catalog[[p]]$Name))
text(sum(start(CuencaCaroni$data[[p]])+end(CuencaCaroni$data[[p]]))/2,
     min(CuencaCaroni$Annomalies[[p]], na.rm = TRUE)/2,
     labels = format(t.beta1[p,], digits=4), col=cla[p], cex=2)
}
\keyword{ rainfall }
\keyword{ trend }
\keyword{ CuencaCaroni }
