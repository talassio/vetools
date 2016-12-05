#install.packages("RCurl")
library(RCurl)

funcion_variableEstado  <- function(variable,estado){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepvariableestado")){
                agent="Firefox/23.0"
                curl = getCurlHandle()
                params <- list(
                        'userAgent' = agent,
                        'screenWidth' = "",
                        'screenHeight' = "",
                        'flashMajor' = "",
                        'flashMinor' = "",
                        'flashBuild' = "",
                        'flashPatch' = "",
                        'redirect' = "",
                        'referrer' = "http://argus.cesma.usb.ve",
                        'variable[id]' = variable,
                        'estado[acronimo]' = estado
                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/variableestado',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}