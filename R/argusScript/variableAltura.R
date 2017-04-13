#install.packages("RCurl")
library(RCurl)

funcion_variableAltura  <- function(variable, cotainferior, cotasuperior){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepalturavariable")){
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
                        'cotasuperior' = cotasuperior,
                        'cotainferior' = cotainferior
                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/alturavariable',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}
