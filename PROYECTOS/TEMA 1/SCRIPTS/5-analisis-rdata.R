clientes <- c("Juan Gabriel", "Ricardo", "Pedro")
fechas <- as.Date(c("2017-12-27","2017-11-1", "2018-1-1"))
pago <- c(315,192.55,40.15)
pedidos <-data.frame(clientes,fechas,pago)

save(pedidos, file="DATA/pedidos.Rdata")
saveRDS(pedidos,file="DATA/pedidos.rds" )

remove(pedidos)

load("DATA/pedidos.Rdata")

orders <-readRDS("DATA/pedidos.rds")

#save.image() guarda todos los objetos creados

primes <- c(2,3,5,7,11,13)
pow2 <- c(2,4,8,16,32,64,128)
save(list=c("primes","pow2"),file ="primes_and_pow2.Rdata")

attach("DATA/primes_and_pow2.Rdata")
