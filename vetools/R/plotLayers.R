# Version 5.0
# 13-10-2014
#' @export
#' @importClassesFrom sp SpatialPolygons
plotLayers <- function(...){
                for ( l in list(...) ) {
                        FUN = l$FUN
                        if (is.null(FUN)) { stop('Each layer must have a FUN= member.') }
                        l$FUN <- NULL
                        do.call(FUN, l)
                }
        }
