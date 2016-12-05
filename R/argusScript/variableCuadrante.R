#install.packages("RCurl")
library(RCurl)

funcion_variableCuadrante  <- function(variable, latsuperior, longsuperior,
                                       longinferior){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepvariablecuadrante")){
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
                        'latsuperior' = latsuperior,
                        'latinferior' = latinferior,
                        'longsuperior' = longsuperior,
                        'longinferior' = longinferior

                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/variablecuadrante',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}
