# Verified 1.3.18
# Revision 06/11/2015
# Version 2.1
# TODO: Add DF shape
# venezuela.estados moved to global constant
# shape.file = "venezuelaestados"
# EST <- maptools::readShapeSpatial(paste(system.file("shape",package="vetools"), shape.file, sep="/"))
# save(file = shape.file, list = c('EST'), compress = TRUE)
#' @export
get.shape.state <-
function(abb, shape.file="venezuelaestados.rda") {
        if ( missing(abb) ) { return(estados.venezuela) }
        if ( is.na(abb[1]) ) { print(estados.venezuela); return(invisible()) }
        abb <- toupper(abb)
        if ( "DF" %in% abb ) {
                warning("DF is not yet integrated. Ignoring this shape request.")
                abb = abb[abb != "DF"]
                if ( length(abb) == 0 ) { return(NA) }
        }
        if ( ! all( abb %in% estados.venezuela$Abb ) ) { stop("Unknown state name. Try get.shape.state(NA).") }
        EST <- NA
        # EST <- maptools::readShapeSpatial(paste(system.file("shape", package="vetools"), shape.file, sep="/"))
        load(paste(system.file("maps", package="vetools"), shape.file, sep="/"))
        Estados = estados.venezuela[abb, "shape.name"]
        ESS <- EST[EST$NOM_EDO %in% Estados, ]
        return(ESS)        
}
