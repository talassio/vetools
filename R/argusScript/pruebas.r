source("/home-local/andres/argusScript/variableAlturaFecha.R")
source("/home-local/andres/argusScript/variableCuadranteFecha.R")
source("/home-local/andres/argusScript/variableEstadoFecha.R")
source("/home-local/andres/argusScript/variableAltura.R")
source("/home-local/andres/argusScript/variableCuadrante.R")
source("/home-local/andres/argusScript/variableEstado.R")
source("/home-local/andres/argusScript/variableCuadranteAlturaFecha.R")
source("/home-local/andres/argusScript/variableEstacionFecha.R")
source("/home-local/andres/argusScript/variable.R")
source("/home-local/andres/argusScript/variableCuadranteAltura.R")
source("/home-local/andres/argusScript/variableEstacion.R")

variable        = 83
estacion        = 10199
dia_inicial     = 1
mes_inicial     = 1
anho_inicial    = 1960
dia_final       = 1
mes_final       = 12
anho_final      = 1985
cotasuperior    = 5000
cotainferior    = 0
latsuperior     = 15.7
latinferior     = 0
longsuperior    = 0
longinferior    = -73
estado          = 'YA'

prueba_variable =  funcion_variable(variable)

prueba_variableEstacion =  funcion_variableEstacion(variable,estacion)

prueba_variableEstacionFecha = funcion_variableEstacionFecha(variable,estacion,
                                        dia_inicial,mes_inicial,anho_inicial,
                                        dia_final,mes_final,anho_final)
prueba_variableAltura =  funcion_variableAltura(variable, cotainferior,
                                        cotasuperior)

prueba_variableAlturaFecha = funcion_variableAlturaFecha(variable,cotainferior,
                                        cotasuperior, dia_inicial,mes_inicial,
                                        anho_inicial,dia_final,mes_final,
                                        anho_final)

prueba_variableCuadrante = funcion_variableCuadrante(variable, latsuperior,
                                        longsuperior, longinferior)

prueba_variableCuadranteFecha = funcion_variableCuadranteFecha(variable,
                                        latsuperior, longsuperior, longinferior,
                                        dia_inicial,mes_inicial,anho_inicial,
                                        dia_final,mes_final,anho_final)

prueba_variableCuadranteAltura = funcion_variableCuadranteAltura(variable,
                                        latsuperior, longsuperior, longinferior,
                                        cotainferior, cotasuperior)

prueba_variableCuadranteAlturaFecha =  funcion_variableCuadranteAlturaFecha(
                                        variable, latsuperior, longsuperior,
                                        longinferior, cotainferior,cotasuperior,
                                        dia_inicial,mes_inicial,anho_inicial,
                                        dia_final,mes_final,anho_final)

prueba_variableEstado = funcion_variableEstado(variable, estado)

prueba_variableEstadoFecha = funcion_variableEstadoFecha(variable, estado,
                                        dia_inicial,mes_inicial,anho_inicial,
                                        dia_final,mes_final,anho_final)