missingdata <- function(p, y, updated.y = FALSE, max.cond = 1e12) {
        n = nrow(y)
        k = ncol(y)
        mu.ini = p[1 : k]
        V.ini = matrix(p[(k + 1) : length(p)], ncol = k)
        if ( updated.y ) { y.new = y }
        
        # Expectation
        x.suma = rep(0, k)
        V.suma = matrix(0, k, k)
        V.aux = matrix(NA, k, k)
        adjusted.n = n
        for (i in 1 : n) {
                x.i = y[i, ]
                nas = is.na(x.i)
                cuantos = sum(nas)
                if ( (cuantos > 0) & (cuantos < k) ) {
                        falta = (1 : k)[nas]
                        V.12 = V.ini[falta, -falta];
                        if ( cuantos == 1 ) { V.12 = matrix(c(V.12), nrow = 1, ncol = k - 1) }
                        V.22 = as.matrix(V.ini[-falta, -falta]);
                                c = x.i[-falta] - mu.ini[-falta]
                                x.lm = lm (c ~ V.22 + 0)
                                b = matrix(coef(x.lm), ncol = 1)
                        x.i[falta] = mu.ini[falta] + V.12 %*% b
                        x.suma = x.suma + x.i
                        x.lm = lm(t(V.12) ~ V.22 + 0)
                        b = coef(x.lm)
                        V.aux[falta, falta] = as.matrix( (V.ini[falta, falta] - V.12 %*% b ) + x.i[falta] %*% t(x.i[falta]) )
                        V.aux[-falta, -falta] = as.matrix( x.i[-falta] %*% t(x.i[-falta]) )
                        V.aux.21 = x.i[-falta] %*% t(x.i[falta])
                        if ( k - cuantos == 1 ) { V.aux.21 = matrix(c(V.aux.21), nrow = 1, ncol = cuantos) }
                        V.aux[-falta, falta] = V.aux.21
                        V.aux[falta, -falta] = t(V.aux.21)
                        V.suma = V.suma + V.aux
                } else if ( cuantos == k ) {
                        x.i = mu.ini
                        x.suma = x.suma + x.i
                        V.suma = V.suma + ( V.ini - mu.ini %*% t(mu.ini) )
                } else {
                        x.suma = x.suma + x.i
                        V.suma = V.suma + x.i %*% t(x.i)
                }
                if ( updated.y ) { y.new[i, ] = x.i }
        }
        
        # Maximize
        mu.ini = ( 1 / adjusted.n ) * x.suma
        V.ini = ( 1 / adjusted.n ) * V.suma - ( mu.ini %*% t(mu.ini) )
        if ( updated.y ) {
                return(list(mu = mu.ini, V = V.ini, y = y.new))
        }
        return(c(mu.ini, V.ini))
}