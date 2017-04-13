est.fivenum <- function(collection) {
        stopifnot(class(collection) == 'Catalog')
        
        ta <- plyr::ldply(collection$data, function(x) {
                na = ! is.na(x)
                data.frame(data = sum(na), n = length(na))
        })
        # browser()
        ta$avail = ta$data / ta$n
        names = laply(collection$catalog, function(x){ x$Name })
        serial = laply(collection$catalog, function(x){ x$Serial })
        rownames(ta) <- paste0(names, " (", serial, ")")
        ta$name = names
        ta$serial = serial
        return(ta)
}