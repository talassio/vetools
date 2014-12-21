# Verified 1.3.18
est.cut2 <-
function(collection, start = c(1960, 1), end = c(1990, 12), no.window.warning = TRUE) {
        col <- collection
        pr <- collection$data
        catalogo <- collection$catalog
        d <- list()
        cat.mod <- list()
        if ( no.window.warning ) { 
                w = options("warn")$warn
                options(warn = -1)
        }
        k = 0
        remove = c()
        for ( j in 1 : length(pr) ) {
                end = end
                if ( ym2time(end) < ym2time(start(pr[[j]])) ) {
                        remove = c(remove, j)
                        next
                }
                if ( ym2time(start) > ym2time(end(pr[[j]])) ) {
                        remove = c(remove, j)
                        next
                }
                k = k + 1
                d[[k]] = window(pr[[j]], start = start, end = end)
                # cat.mod[[k]] = catalogo[[j]]
        }
        col = est.rm(col, list = remove)
        col$data = d
        if ( no.window.warning ) { options(warn = w) }
        return(col)
}
