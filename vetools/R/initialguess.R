initialguess <- function(data) {
        if ( class(data) != 'matrix' ) { data = matrix(data, ncol = 1) }
        means = apply(data, 2, mean, na.rm = TRUE)
        res = sweep(data, MARGIN = 2, means)
        n = nrow(res)
        k = ncol(res)
        sd.j = apply(res, 2, sd, na.rm = TRUE)
        res.aux = apply(rbind(sd.j, res), 2, function(x) { p = is.na(x); y = x; s = sum(p); y[p] <- rnorm(s, mean = 0, sd = x[1]); y[-1] } )

        try( any(is.na(res.aux)) )
        
        mu.ini = apply(res.aux, 2, mean) 
        V.ini = cov(res.aux)
        return(list(p0 = c(mu.ini, V.ini), y = res, means = means))
}