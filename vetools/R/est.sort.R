# Verified 1.3.18
est.sort <-
function(collection, ascending = T, by.year.only = F) {
        col <- collection
        pr <- collection$data
        catalogo <- collection$catalog
        t = plyr::ldply(pr, function(x) { c(start(x), end(x)) }  )
        if ( ascending == TRUE ) {
                if ( by.year.only == TRUE ) {
                        x <- sort(t$V1, index.return = TRUE)
                } else {
                        x <- sort(t$V1 + t$V2 / 12, index.return = TRUE)
                }
        } else {
                if ( by.year.only == TRUE ) {
                        x <- sort(t$V3, index.return = TRUE)
                } else {
                        x <- sort(t$V3 + t$V4 / 12, index.return = TRUE)
                }
        }
        t.o <- t
        t.o[, ] <- t[x$ix, ]
        p.o <- pr
        c.o <- catalogo
        for (i in 1 : length(catalogo)) { 
                c.o[[i]] <- catalogo[[x$ix[i]]]
                p.o[[i]] <- pr[[x$ix[i]]]
        }
        col$catalog <- c.o
        col$data <- p.o
        return(col)
}
