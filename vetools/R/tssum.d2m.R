# Verified 1.3.18
# Version 24 Oct 2014
#' @export
tssum.d2m <-
function(serie, months = 1 : 12, max.na.fraction = 0.3, safe.check = FALSE) {
        if ( (attributes(serie)$tsp[3] != 365.25) & (attributes(serie)$tsp[3] != 365) ) {
                stop(paste('There are currently no handlers for ts objects of frequency',
                           attributes(serie)$tsp[3]))
        }
        meses = months
        ts2time <- function(e) {
                if (length(e) == 1) {
                        return(tis::jul(e))
                } else {
                        return(tis::jul(e[1]+e[2]/(365+lubridate::leap_year(e[1]))))
                }
        }
        per = length(meses)
        e = serie
        if ( per == 1 ) {
                deltat = 12
        } else {
                deltat = meses[2] - meses[1]
        }

        M = floor(as.numeric(ceiling(difftime((ts2time(end(e))), (ts2time(start(e))),
                                              units="weeks"))/52))

        nd = rep(NA, M)
        est.men = ts(nd, start = c(tis::year(ts2time(start(e))),
                                 tis::month(ts2time(start(e)))),
                     end=c(tis::year(ts2time(end(e))), tis::month(ts2time(end(e)))),
                     frequency = per)
        AA = seq(tis::year(ts2time(start(e))), tis::year(ts2time(end(e))))
        loss = 0L
        for ( y in AA ) {
                co = 0
                for (p in meses){
                        p.jul = tis::jul(paste(y, p, "01", sep="-"))
                        if ( ts2time(end(serie)) <= p.jul ) { break }
                        co = co + 1
                        dOY.p.jul = tis::dayOfYear(p.jul)
                        f = dOY.p.jul + diasdelmes(y, p:(p + deltat - 1)) - 1
                        dy = tis::dayOfYear(tis::jul(paste(y, "12-31", sep="-")))
                        if (f > dy ) { yf = y + 1; f = f - dy + 1 } else { yf = y }
                        w = window(e, start = c(y, dOY.p.jul), end = c(yf, f))
                        if ( (sum(is.na(w)) / length(w)) > max.na.fraction ) {
                                w.sum = NA
                                loss = loss + sum(w, na.rm = TRUE) #  NA imputation
                        } else {
                                w.sum = sum(w, na.rm=TRUE)
                        }
                        window(est.men, start=c(y, co), end=c(y, co)) = w.sum
                        ta1 = sum(window(e, start=start(e), c(yf, f)), na.rm = TRUE)
                        ta2 = sum(window(est.men, start=start(est.men), end = c(y, co)), na.rm = TRUE)
                        if ( (abs(ta1 - ta2) > 1e-3 ) & !is.na(w.sum) ) {
                                window(est.men, start=c(y, co), end=c(y, co)) = w.sum + (ta1 - ta2) - loss
                        }
                }
        }
        if (safe.check) {
                if ( safe.check ) { cat('loss = ', 100 * (1 - sum(est.men, na.rm = TRUE) / sum(serie, na.rm = T)), '%\n') }
        }
        return(est.men)
}