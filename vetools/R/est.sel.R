est.sel <-
        function(collection, list){
                sel <- (1 : length(collection$catalog))[-list]
                ret <- est.rm(collection, sel)
                return(ret)
        }