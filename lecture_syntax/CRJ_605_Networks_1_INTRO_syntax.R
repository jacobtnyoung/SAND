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


# ============ # 
# End of syntax.
# ============ # 