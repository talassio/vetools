# update old catalogs:
data(CuencaCaroni)
for (f in seq(length(CuencaCaroni$catalog)) ) {
        CuencaCaroni$catalog[[f]]$Serial = NA
}
summary(CuencaCaroni)
CuencaCaroni
save(file='CuencaCaroni.rda', list=c('CuencaCaroni'), compress = TRUE)

data(Vargas)
for (f in seq(length(Vargas$catalog)) ) {
        Vargas$catalog[[f]]$Serial = NA
}
summary(Vargas)
Vargas
save(file='Vargas.rda', list=c('Vargas'), compress = TRUE)

data(Vargas2)
for (f in seq(length(Vargas2$catalog)) ) {
        Vargas2$catalog[[f]]$Serial = NA
}
summary(Vargas2)
Vargas2
save(file='Vargas2.rda', list=c('Vargas2'), compress = TRUE)

plot(Vargas2)
