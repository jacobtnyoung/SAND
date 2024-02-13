library( sna )
library( network )

n <- 250
target <- 0.9

mat <- rgraph( n, tprob = 0.01 )
net <- as.network( mat, directed = FALSE )

dcent <- centralization( net, degree, mode = "graph" )
dcent

while ( abs( dcent - target ) > 0.01 ){
  if( dcent < target ){
    add.edge( net, 1, sample( seq( 2:n ), 1 ) )
  } else{
    delete.edges( net, 1, sample( seq( 2:n ), 1 ) )
    break
  }
  dcent <- centralization( net, degree, mode = "graph" )
}


round( centralization( net, degree, mode = "graph" ), 1 )

deg <- degree( net, gmode = "graph", cmode = "degree")

par(mfrow = c(1,2))
gplot( net, vertex.cex = deg / max( deg ) , gmode = "graph" )
hist(deg)
