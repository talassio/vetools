# Verified 1.3.18
est.sort <-
function(collection, sort.by.start = TRUE, by.year.only = FALSE) {
        pr <- collection$data
        t = plyr::ldply(pr, function(x) { c(start(x), end(x)) }  )
        if ( sort.by.start == TRUE ) {
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
        ret = collection
        for ( element in names(collection) ) {
                for( i in 1 : length(collection$catalog) ) {
                        cmd = paste0('ret$', element, '[[', i, ']] <- collection$', element, '[[',x$ix[i],']]')
                        eval(parse(text = cmd))
                }
        }
        return(ret)
}
