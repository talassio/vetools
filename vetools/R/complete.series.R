# Version 2.0
#' @export
complete.series <- function( collection, cluster = rep(1, length(collection$data)), control = list(maxiter = 1500, trace = FALSE, tol = 5e-5) ) {

        if ( ! 'trace' %in% names(control) ) { control$trace = FALSE }
        if ( ! 'tol' %in% names(control) ) { control$tol = 5e-5 }
        if ( ! 'maxiter' %in% names(control) ) { control$maxiter = 1500 }
        
        completed = collection
        M = 12 + ceiling(max(unlist(lapply(collection$data, function(x) { length(x) }))) / 12)
        
        for ( i in 1 : length(unique(cluster)) ) {
                idx = (1 : length(collection$data))[cluster == i]
                if (control$trace) { cat('Cluster ', i, 'indexes: ', idx, '\n') }
                MONTH.DATA = matrix(NA, ncol = length(idx), nrow = M)
                max.local = 0
                for ( m in 1 : 12 ) { # Extract each months data
                        # m = 3
                        if (control$trace) { cat('Completing ts for month', m, '\n') }
                        k = 0
                        for ( e in idx ) {
                                k = k + 1
                                datos = collection$data[[e]]
                                month.start = start(datos)[2]
                                n = length(datos)
                                s = m # Supposing it starts in Jan
                                if ( m < month.start ) { s = 12 + m } # move one year up if it dosen't
                                month.idx = seq(s, n, 12)
                                if ( month.idx[length(month.idx)] > n ) { month.idx = month.idx[-length(month.idx)] }
                                month.data = datos[month.idx]
                                if ( max.local < length(month.data) ) { max.local = length(month.data) }
                                MONTH.DATA[seq_along(month.idx), k] = month.data
                        }
                        MONTH.DATA = as.matrix(MONTH.DATA[1 : max.local, ], ncol = length(idx)) # Resize to right size
                        p0 = initialguess(MONTH.DATA) # Include monthly effects model
                        p.sqem = SQUAREM::squarem(p = p0$p0, y = p0$y, fixptfn = missingdata, control = control)
                        p = missingdata(p.sqem$par, p0$y, updated.y = TRUE)
                        res = p$y
                        means = p0$means
                        k = 0
                        for ( e in idx ) {
                                k = k + 1
                                month.start = start(completed$data[[e]])[2]
                                n = length(completed$data[[e]])
                                s = m # Supposing it starts in Jan
                                if ( m < month.start ) { s = 12 + m } # move one year up if it dosen't
                                month.idx = seq(s, n, 12)
                                if ( month.idx[length(month.idx)] > n ) { month.idx = month.idx[-length(month.idx)] }
                                completed$data[[e]][month.idx] = res[1 : length(month.idx), k] + means[k]
                        }
                }
        }
        
        # Window of original ts and projection to non-negative plane ####
        for ( e in seq(length(collection$data)) ) {
                completed$data[[e]] = window(completed$data[[e]], start = start(collection$data[[e]]), end = end(collection$data[[e]]))
                completed$data[[e]][completed$data[[e]] < 0] = 0
        }
        
        return(completed)
}