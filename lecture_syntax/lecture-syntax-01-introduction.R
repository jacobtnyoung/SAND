# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ==================================== # 
# Various syntax for Intro lecture.
# ==================================== # 

library(sna)

example.net <- matrix(c(
  0,1,1,0,0,0,0,0,0,0,
  1,0,1,0,0,0,0,0,0,0,
  1,1,0,0,0,0,0,0,0,0,
  0,0,0,0,1,1,0,0,0,0,
  0,0,0,1,0,1,0,0,0,0,
  0,0,0,1,1,0,0,0,0,0,
  0,0,0,0,0,0,0,1,1,0,
  0,0,0,0,0,0,1,0,1,0,
  0,0,0,0,0,0,1,1,0,0,
  0,1,0,0,1,0,0,1,0,0),
  nrow=10,ncol=10,byrow=TRUE)

coords <- gplot(example.net, usearrows = FALSE, usecurve = FALSE, main="")
gplot(example.net, usearrows = FALSE, usecurve = FALSE, main="",coord=coords,vertex.col="lightblue")
# then add the text in the slide.

gplot(example.net, usearrows = FALSE, usecurve = FALSE, main="",coord=coords,vertex.col="lightblue")
gplot(example.net, usearrows = TRUE, usecurve = FALSE, main="",coord=coords,vertex.col="lightblue")


gplot(example.net, usearrows = TRUE, usecurve = FALSE, main="",coord=coords,vertex.col="lightblue")
gplot(example.net, usearrows = TRUE, usecurve = TRUE, main="",coord=coords,vertex.col="lightblue",edge.lwd = sample(c(0.1,3),21,replace=TRUE),arrowhead.cex=0.25)
gplot(example.net, usearrows = TRUE, usecurve = TRUE, main="",coord=coords,vertex.col="lightblue",edge.lwd = sample(c(0.1,3),21,replace=TRUE),edge.col = rep(c("darkgreen","red"),21),arrowhead.cex=0.25)

!!!need a bipartite plot here

gplot(example.net, usearrows = TRUE, usecurve = TRUE, main="",coord=coords,vertex.col="lightblue",edge.col = rep(c("white","white","white"),21),arrowhead.cex=0.25)
gplot(example.net, usearrows = TRUE, usecurve = TRUE, main="",coord=coords,vertex.col="lightblue",edge.col = rep(c("orange","white","white"),21),arrowhead.cex=0.25)
gplot(example.net, usearrows = TRUE, usecurve = TRUE, main="",coord=coords,vertex.col="lightblue",edge.col = rep(c("orange","green","white"),21),arrowhead.cex=0.25)
gplot(example.net, usearrows = TRUE, usecurve = TRUE, main="",coord=coords,vertex.col="lightblue",edge.col = rep(c("orange","green","red"),21),arrowhead.cex=0.25)



# to create image for intro lecture

library( sna )

actors  <- 21
ModNet <- matrix( 0, nrow = actors, ncol = actors )
rownames( ModNet ) <- 1:actors
colnames( ModNet ) <- 1:actors

ModNet[ c( 1,2,3 ), c( 1,2,3 ) ] <- 1
ModNet[ c( 4,5,6 ), c( 4,5,6 ) ] <- 1
ModNet[ c( 7,8,9 ), c( 7,8,9 ) ] <- 1
ModNet[ c( 10,11,12 ), c( 10,11,12 ) ] <- 1
ModNet[ c( 13,14,15 ), c( 13,14,15 ) ] <- 1
ModNet[ c( 16,17,18 ), c( 16,17,18 ) ] <- 1
ModNet[ c( 19,20,21 ), c( 19,20,21 ) ] <- 1

gplot( ModNet, gmode = "graph", vertex.col = "#1ac461" )


# make some connections

ConNet <- ModNet

ConNet[ 3, 7 ] <- 1
ConNet[ 8, 15 ] <- 1

gplot( ConNet, gmode = "graph", vertex.col = "#1ac461" )

# make more connections
ConNet[ 12, 10 ] <- 1
ConNet[ 3, 6 ] <- 1
ConNet[ 13, 21 ] <- 1
ConNet[ 9, 18 ] <- 1
ConNet[ 21, 16 ] <- 1
ConNet[ 12, 4 ] <- 1

gplot( ConNet, gmode = "graph", vertex.col = "#1ac461" )








# ============ # 
# End of syntax.
# ============ # 