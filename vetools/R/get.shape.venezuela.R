# Verified 1.3.18
# Version 2
#' @export
get.shape.venezuela <- function(shape.file="venezuela.rda") {
        VE <- NA
        load(paste(system.file("maps", package="vetools"), shape.file, sep="/"))
        return(VE)
}