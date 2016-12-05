#install.packages("RCurl")
library(RCurl)

funcion_variableCuadranteAltura  <- function(variable, latsuperior, longsuperior,
                                             longinferior, cotainferior,
                                             cotasuperior){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepvariableparalelepipedo")){
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
                        'cotainferior' = cotainferior,
                        'latsuperior' = latsuperior,
                        'latinferior' = latinferior,
                        'longsuperior' = longsuperior,
                        'longinferior' = longinferior
                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/variableparalelepipedo',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}