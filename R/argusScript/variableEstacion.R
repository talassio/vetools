#install.packages("RCurl")
library(RCurl)

funcion_variableEstacion  <- function(variable,estacion){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepestacionvariable")){
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
                        'estacion[id]' = estacion
                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/estacionvariable',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}