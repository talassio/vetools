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
                        cond = kappa(V.22, norm = "1")
#                         if ( cond > max.cond ) { adjusted.n = adjusted.n - 1; next }
#                                 browser()
#                                 x0 = matrix(0, ncol = 1, nrow = nrow(V.22))
                                c = x.i[-falta] - mu.ini[-falta]
                                x.lm = lm (c ~ V.22 + 0)
                                b = matrix(coef(x.lm), ncol = 1)
#                                 browser()
#                                 opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "BFGS", gr = function(x) { V.22 %*% x - c } )
#                                 if ( opt$convergence ) { browser(); stop('optim error 1') } 
#                                 opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "BFGS", gr = function(x) { V.22 %*% x - c } )
#                                 if ( opt$convergence ) { 
#                                         cat('optim 1 no convergence BFGS 2.1 ->')
#                                         opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "BFGS", gr = function(x) { (diag(10*diag(V.22)) + V.22) %*% x - c } )
#                                         if ( opt$convergence ) { 
#                                                 cat('optim 1 no convergence BFGS 2.1 PULL UP FAILED ->')
#                                                 opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "CG", control = list(maxit = 2000), gr = function(x) { (diag(10*diag(V.22)) + V.22) %*% x - c } )
#                                                 if ( opt$convergence ) { browser(); stop('optim 1 error') }
#                                         }
#                                 }
#                                 cat('optim 1 chained worked !\n')
#                                 b = opt$par
#                         } else {
#                                 b = solve(V.22, x.i[-falta] - mu.ini[-falta])
#                                 b = matrix(b, ncol = 1)
#                         }
                        x.i[falta] = mu.ini[falta] + V.12 %*% b
                        x.suma = x.suma + x.i
#                         if ( cond > max.cond ) {
#                                 c = t(V.12)
#                                 opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "BFGS", gr = function(x) { V.22 %*% x - c } )
#                                 if ( opt$convergence ) { 
#                                         cat('optim 2 no convergence BFGS 2.1 -> ')
#                                         opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "BFGS", gr = function(x) { (diag(10*diag(V.22)) + V.22) %*% x - c } )
#                                         if ( opt$convergence ) { 
#                                                 cat('optim 2 no convergence BFGS 2.1 PULL UP FAILED ->')
#                                                 opt = optim(x0, function(x) { 0.5 * t(x) %*% V.22 %*% x - t(x) %*% c}, method = "CG", control = list(maxit = 2000), gr = function(x) { (diag(10*diag(V.22)) + V.22) %*% x - c } )
#                                                 if ( opt$convergence ) { browser(); stop('optim 2 error') }
#                                         }
#                                 }
#                                 cat('optim 2 chained worked !\n')
#                                 b = opt$par
#                         } else {
#                                 b = solve(V.22, t(V.12))
#                         }
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