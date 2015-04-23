# Verified 1.3.18
# Revision 22/04/2015
# Version 2.0
# venezuela.estados moved to global constant
# shape.file = "venezuelaestados"
# EST <- maptools::readShapeSpatial(paste(system.file("shape",package="vetools"), shape.file, sep="/"))
# save(file = shape.file, list = c('EST'), compress = TRUE)
get.shape.state <-
function(abb, shape.file="venezuelaestados.rda") {
        if ( missing(abb) ) { return(estados.venezuela) }
        if ( is.na(abb[1]) ) { print(estados.venezuela); return(invisible()) }
        abb <- toupper(abb)
        if ( ! all( abb %in% estados.venezuela$Abb ) ) { stop("Unknown state name. Try get.shape.state(NA).") }
        EST <- NA
        # EST <- maptools::readShapeSpatial(paste(system.file("shape", package="vetools"), shape.file, sep="/"))
        load(paste(system.file("maps", package="vetools"), shape.file, sep="/"))
        Estados = estados.venezuela[abb, "shape.name"]
        ESS <- EST[EST$NOM_EDO %in% Estados, ]
        return(ESS)        
}
