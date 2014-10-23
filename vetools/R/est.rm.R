# Verified 1.3.18
# Version 23 Oct 2014
est.rm <-
function(collection, list){
        ret = collection
        for ( element in names(collection) ) {
                for(j in sort(list, decreasing = TRUE)) {
                        cmd = paste0('ret$', element, '[[', j, ']] <- NULL')
                        eval(parse(text = cmd))
                }
        }
        class(ret) <- "Catalog"
        return(ret)
}
