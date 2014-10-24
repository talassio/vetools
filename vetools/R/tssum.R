# Version 3.0
# 24 Oct 2014
tssum <- function(serie, intervals = 1, max.na.fraction = 0.3, safe.check = FALSE) {
        freq = frequency(serie)

        if ( (attributes(serie)$tsp[3] == 365.25) | (attributes(serie)$tsp[3] == 365) ) {
                if ( all(intervals <= 12) & all(intervals >= 1) ) {
                        ss = tssum.d2m(serie = serie, months = intervals,
                                      max.na.fraction = max.na.fraction,
                                      safe.check = safe.check)
                        return(ss)
                }
        }

        if ( round(freq) != freq ) {
                warning('frequency not integer, rouding to next integer.')
                freq = round(freq)
        }
        stopifnot(max(intervals) <= freq)
        stopifnot(intervals == sort(intervals))
        if ( length(intervals) > 1 ) {
                stopifnot(intervals[-1] - intervals[-length(intervals)] == intervals[2] - intervals[1])
                N = intervals[2] - intervals[1]
        } else {
                N = freq
        }
        start = start(serie)
        end = end(serie)
        if ( length(start) > 1 ) {
                start = start[1] + start[2] / freq
                end = end[1] + (end[2]-1) / freq
        }
        s.m = round(( start - floor(start) ) * freq)
        ts.start = floor(start) + intervals[1] / freq
        lend = length(serie)
        slabs = floor(end) - floor(start) + 1
        ss = rep(NA, (length(intervals)) * slabs)
        k = 0
        if ( ! ( s.m %in% intervals ) ) {
                n = (intervals[intervals - s.m > 0])[1]
                if ( ( n / N) >= (1 - max.na.fraction) ) {
                        mass = serie[s.m : (n - 1)]
                        if ( ( sum(is.na(mass)) / N ) > max.na.fraction ) {
                        } else {
                                k = k + 1
                                ss[k] = sum(mass, na.rm =  TRUE)
                                ts.start = ts.start - N / freq
                        }
                }
        }
        ex = FALSE
        for ( y in freq * (0 : (slabs - 1) ) ) {
                for ( e in intervals ) {
                        k = k + 1
                        if (y + e + N - 1 > lend) {
                                if ( ((y + e + N - 1 - lend) / N) < max.na.fraction ) {
                                        if ( (y + e) <= lend ) {
                                                mass = serie[(y + e) : lend]
                                                if ( ( sum(is.na(mass)) / N ) <= max.na.fraction ) {
                                                        ss[k] = sum(mass, na.rm =  TRUE)
                                                }
                                        }
                                }
                                ex = TRUE
                                break
                        }
                        mass = serie[(y + e) : (y + e + N - 1)]
                        if ( ( sum(is.na(mass)) / N ) > max.na.fraction ) {
                                ss[k] = NA
                        } else {
                                ss[k] = sum(mass, na.rm =  TRUE)
                        }
                }
                if ( ex ) { break }
        }
        ss = ts(ss, start = ts.start, frequency = length(intervals))
        if ( safe.check ) {
                cat('loss = ', 100 * (1 - sum(ss, na.rm = TRUE) / sum(serie, na.rm = T)), '%\n')
        }
        return(ss)
}
