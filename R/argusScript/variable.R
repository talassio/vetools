#install.packages("RCurl")
library(RCurl)

funcion_variable  <- function(variable){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepvariable")){
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
                        'variable[id]' = variable
                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/variable',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}

