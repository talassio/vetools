#install.packages("RCurl")
library(RCurl)

funcion_variableCuadranteFecha  <- function(variable, latsuperior, longsuperior,
                                            longinferior, dia_inicial,
                                            mes_inicial, anho_inicial, dia_final,
                                            mes_final, anho_final){
        datos = FALSE
        if(url.exists("http://argus.cesma.usb.ve/reportesar/prepvariablecuadrantefechas")){
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
                        'longinferior' = longinferior,
                        'date[dia_inicial]' = dia_inicial,
                        'date[mes_inicial]' = mes_inicial,
                        'date[anho_inicial]' = anho_inicial,
                        'date[dia_final]' = dia_final,
                        'date[mes_final]' = mes_final,
                        'date[anho_final]'= anho_final

                )
                form = postForm('http://argus.cesma.usb.ve/reportesar/variablecuadrantefechas',
                                .params = params, curl = curl)
                datos = read.table(text = form, sep=',', header=TRUE)
        }
        datos
}