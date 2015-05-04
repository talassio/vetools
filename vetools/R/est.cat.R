#' @export
est.cat <- function (collection1, collection2, check.elements = TRUE) {
        if ( all( names(collection1) != names(collection2) ) & check.elements ) {
                stop('cannot concatenate two different collections.')
        }
        ret = collection1
        for ( element in names(collection1) ) {
          cmd = paste0('ret$', element, ' = c(ret$', element, ', collection2$', element,')')
          eval(parse(text=cmd))
        }
        return(ret)
}
