library(vetools)
library(SQUAREM)
library(plyr)
library(Matrix)
rm(list=ls())


data(Vargas)
collection = est.sel(Vargas, 4 : 10)
# data(CuencaCaroni)
# collection = CuencaCaroni
debug = TRUE
source('inbox//initialguess.R')
source('inbox//missingdata.R')
# recordar de poner el caso si la colelccion es una sola estacion, ver summary

# sanity ver que tenga un año de datos
#  ver que no sean todo NA.... etc

# 
# 
# 
# # collection = est.rm(collection, c(10:33)) # 7, 30 are a subsets of: 8, 32
# 
# 
# KK = length(collection$data)
# fit = list()
# for (k in 1 : KK) {
#         L = length(collection$data[[k]])
#         meses = rep(seq(12), length.out = L)
#         ZZ = model.matrix(~as.factor(meses)) 
#         fit[[k]] = lm(collection$data[[k]] ~ ZZ - 1, singular.ok = TRUE, na.action = na.omit)
# }
# Dist = laply(fit, coef)
# colnames(Dist) <- month.name
# clusters = kmeans(Dist, centers = 7)
# (cluster = clusters$cluster)
cluster = rep(1, length(collection$data))



# Inputs:
# collection
completed = collection

M = 12 + ceiling(max(unlist(lapply(collection$data, function(x) { length(x) }))) / 12)

for ( i in 1 : length(unique(cluster)) ) {
        idx = (1 : length(collection$data))[cluster == i]
        if (debug) { cat('Cluster ', i, 'indexes: ', idx, '\n') }
        MONTH.DATA = matrix(NA, ncol = length(idx), nrow = M)
        max.local = 0
        for ( m in 1 : 12 ) { # Extract each months data
                # m = 3
                if (debug) { cat('  + Month', m, ' Start\n') }
                if (debug) { cat('    + Stage 1 of 3: Monthly data extraction...') }
                k = 0
                for ( e in idx ) {
                        k = k + 1
                        datos = collection$data[[e]]
                        month.start = start(datos)[2]
                        n = length(datos)
                        s = m # Supposing it starts in Jan
                        if ( m < month.start ) { s = 12 + m } # move one year up if it dosen't
                        month.idx = seq(s, n, 12)
                        if ( month.idx[length(month.idx)] > n ) { month.idx = month.idx[-length(month.idx)] }
                        month.data = datos[month.idx]
                        if ( max.local < length(month.data) ) { max.local = length(month.data) }
                        MONTH.DATA[seq_along(month.idx), k] = month.data
                }
                if (debug) { cat(' Completed\n') }
                if (debug) { cat('    + Stage 2 of 3: SQUAREM(monthly model residuals)...') }
                MONTH.DATA = as.matrix(MONTH.DATA[1 : max.local, ], ncol = length(idx)) # Resize to right size
                p0 = initialguess(MONTH.DATA) # Include monthly effects model
                p.sqem = squarem(p = p0$p0, y = p0$y, fixptfn = missingdata, control = list(trace = TRUE, tol = 5e-5))
                p = missingdata(p.sqem$par, p0$y, updated.y = TRUE)
                res = p$y
                means = p0$means
                if (debug) { cat(' Completed\n') }
                if (debug) { cat('    + Stage 3 of 3: Monthly data restoration...') }
                k = 0
                for ( e in idx ) {
                        k = k + 1
                        month.start = start(completed$data[[e]])[2]
                        n = length(completed$data[[e]])
                        s = m # Supposing it starts in Jan
                        if ( m < month.start ) { s = 12 + m } # move one year up if it dosen't
                        month.idx = seq(s, n, 12)
                        if ( month.idx[length(month.idx)] > n ) { month.idx = month.idx[-length(month.idx)] }
                        completed$data[[e]][month.idx] = res[1 : length(month.idx), k] + means[k]
                }
                if (debug) { cat(' Completed\n') }
                if (debug) { cat('  + Month', m, ' End\n') }
        }
}

for ( e in seq(length(collection$data)) ) {
        completed$data[[e]] = window(completed$data[[e]], start = start(collection$data[[e]]), end = end(collection$data[[e]]))
}

# Projection to non-negative plane
for ( e in seq(length(collection$data)) ) {
        completed$data[[e]][completed$data[[e]] < 0] = 0
}

# Validation: 
# pdf('squarem-validation-VA.pdf', width=8, height=5)
for ( e in seq(length(collection$data)) ) {
        plot(collection$data[[e]], lwd = 2, col = 'dodgerblue', ylab ='[mm/month]')
        title(main=collection$catalog[[e]]$Name)
        lines(completed$data[[e]])
        scan()
}
# dev.off()