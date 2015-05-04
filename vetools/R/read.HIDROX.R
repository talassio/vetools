# Verified 1.3.18
# Version 5.0
#' @export
read.HIDROX <-
function(file, verbose = FALSE) {
        a <- read.csv(file, header=TRUE)
        # Nombres <- levels(a[,6])
        # Nombres <- levels(a$Estacion)
        Nombres <- unique(a$Serial.Estacion)
        datos.m = list()
        catalogo = list()
        k = 0
        k.dis = 0
        m = length(Nombres)
        for ( n in Nombres ) {
                k = k + 1
                k.dis = k.dis + 1
                if (verbose) cat("Processing station: [",k.dis,"/",m,"] ", n, "\n")
                idx = a$Serial.Estacion == n        
                b = a[idx, ]
                mk = matrix(unique(cbind(as.numeric(b$Longitud), as.numeric(b$Latitud))), ncol = 2)
                colnames(mk)<-c("Longitud", "Latitud")
                # print(mk)
                if ( length(unique(b$Latitud)) > 1 ) {
                        warning("Station appears to have more than one Lat/Long. Could there be more than one station with same serial number?\n")
                }
                bb = b
                k = k - 1
                for ( i in 1 : nrow(mk) ) {
                        k = k + 1
                        b = bb[  ( (bb$Longitud == mk[i, "Longitud"]) & (bb$Latitud == mk[i, "Latitud"])  ) ,  ]
                        b$Fecha <- as.Date(b$Fecha)
                        b.xts = xts::xts(b$Valor, b$Fecha)
                        if (verbose)  cat("   + Processing station: [",k.dis,"/",m,"] ", n, ": sub estation ", i, "of", nrow(mk), "\n")
                        datos.m[[k]] = xts2ts(b.xts)
                        catalogo[[k]] = list(
                                # Name = gsub(" *$", "", n),
                                Name = as.character(b$Estacion[1]),
                                # Serial = ifelse(is.na(serial), NA, serial[k]),
                                Serial = n,
                                Ss = nrow(mk),
                                S = i,
                                # Altitude = ifelse(is.na(altitudes), NA, altitudes[k]),
                                Altitude = b$Altura[1],
                                Latitude = b$Latitud[1],
                                Longitude = b$Longitud[1],
                                Measure.code = as.character(b$Unidad.de.medida[1]),
                                Measure.unit = as.character(b$Unidad.de.medida[1]),
                                Install = time2ym(start(b.xts)),
                                Start = time2ym(start(b.xts)),
                                # State = ifelse(is.na(state), NA, state),
                                State = as.character(b$Estado[1]),
                                Avble.yrs = sort(unique(as.numeric(format(b$Fecha, "%Y"))))
                        )
                }
        }
        col = list(data = datos.m, catalog = catalogo)
        class(col) <- "Catalog"
        return(col)
}
