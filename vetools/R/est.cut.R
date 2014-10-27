# Verified 1.3.18
est.cut <-
function(collection, start = c(1960, 1), end = c(1990, 12)) {
        col <- collection
        pr <- collection$data
        catalogo <- collection$catalog
        d <- list()
        cat.mod <- list()
        k = 0
        for (j in 1 : length(pr)) {
                end = end
                if ( ym2time(end) < ym2time(start(pr[[j]])) ) {
                        next
                }
                
                if ( ym2time(start) > ym2time(end(pr[[j]])) ) {
                        next
                }
                k = k + 1
                d[[k]] = window(pr[[j]], start = start, end = end)
                cat.mod[[k]] = catalogo[[j]]
        }
        col$data = d
        col$catalog = cat.mod
        return( col )
}
