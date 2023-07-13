# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ======================================== # 
# Various syntax for closeness and betweeness centrality lecture.
# ======================================== # 

rm(list = ls())
library(network)
library(RColorBrewer)
library(sna)


# ####################################
# Example: Undirected, Binary Network.

# Build the objects.
u.mat <- rbind(
  c(0,1,0,0,0),
  c(1,0,1,0,0),
  c(0,1,0,1,1),
  c(0,0,1,0,1),
  c(0,0,1,1,0))
rownames(u.mat) <- c("Jen","Tom","Bob","Leaf","Jim")
colnames(u.mat) <- c("Jen","Tom","Bob","Leaf","Jim")
u.net <- network(u.mat, matrix.type = "adjacency", directed = FALSE)
closeness(u.net,gmode="graph")/(dim(u.mat)[1]-1) # unstandardized.
closeness(u.net,gmode="graph") # standardized.
centralization(u.net,closeness,mode="graph") # centralization.
distances <- geodist(u.net)
distances$gdist

# Plot to show example of why standardization matters.
graph.a <- as.matrix(rbind(c(0,1,0),c(1,0,1),c(0,1,0)),byrow=TRUE,ncol=3)
graph.b <- as.matrix(rbind(c(0,1,1,1),c(1,0,1,1),c(1,1,0,1),c(1,1,1,0)),byrow=TRUE,ncol=4)
set.seed(605)
gplot(graph.a, usearrows=FALSE, vertex.cex=3.2, vertex.col = c("lightblue","white","white"), edge.col="grey50",label=c("0.33","",""), label.pos=5, label.cex = 2.2)
set.seed(605)
gplot(graph.b, usearrows=FALSE, vertex.cex=3.2, vertex.col = c("orange","white","white","white"), edge.col="grey50",label=c("0.33","","",""),label.pos=5, label.cex = 2.2)

set.seed(605)
gplot(graph.a, usearrows=FALSE, vertex.cex=3.2, vertex.col = c("lightblue","white","white"), edge.col="grey50",label=c("0.66","",""), label.pos=5, label.cex = 2.2)
set.seed(605)
gplot(graph.b, usearrows=FALSE, vertex.cex=3.2, vertex.col = c("orange","white","white","white"), edge.col="grey50",label=c("1.0","","",""),label.pos=5, label.cex = 2.2)

set.seed(605)
gplot(graph.a, usearrows=FALSE, vertex.cex=3.2, vertex.col = "lightblue", edge.col="grey50", label=c("0.66","1","0.66"), label.pos=5, label.cex = 2.2)
set.seed(605)
gplot(graph.b, usearrows=FALSE, vertex.cex=3.2, vertex.col = "orange", edge.col="grey50",label=round(closeness(graph.b,gmode="graph"),2),label.pos=5, label.cex = 2.2)


# plots for betweenness centrality.
set.seed(1)
gplot(u.mat, usearrows=FALSE, vertex.cex=3.2, vertex.col = "lightblue", edge.col="grey50", displaylabels = TRUE, label.pos=5, label.cex = 2.5)

set.seed(1)
gplot(u.net, usearrows=FALSE, vertex.cex=3.2, vertex.col = "lightblue", displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","green","grey50","green","grey50"))
set.seed(1)
gplot(u.net, usearrows=FALSE, vertex.cex=3.2, vertex.col = "lightblue", displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","green","green","grey50","green"))
set.seed(1)
gplot(u.net, usearrows=FALSE, vertex.cex=3.2, vertex.col = "lightblue", displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","grey50","grey50","grey50","grey50"))
set.seed(1)
gplot(u.net, usearrows=FALSE, vertex.cex=3.2, vertex.col = "lightblue", displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","green","grey50","green","grey50"))

betweenness(u.mat,gmode="graph")
betweenness(u.mat,gmode="graph") / (((5-1)*(5-2))/2)
centralization(u.mat,betweenness,mode="graph") # centralization.

centralization(u.mat,degree,mode="graph") 
centralization(u.mat,closeness,mode="graph") 
centralization(u.mat,betweenness,mode="graph") 


# ##################################
# Example: Directed, Binary Network.

# Build the objects.
d.mat <- rbind(
  c(0,1,0,0,0),
  c(0,0,1,0,0),
  c(0,0,0,1,1),
  c(0,0,1,0,1),
  c(0,0,1,1,0))
rownames(d.mat) <- c("Jen","Tom","Bob","Leaf","Jim")
colnames(d.mat) <- c("Jen","Tom","Bob","Leaf","Jim")
d.net <- network(d.mat, matrix.type = "adjacency", directed = TRUE)
centralization(d.net,degree,mode="digraph",cmode="indegree")
centralization(d.net,degree,mode="digraph",cmode="outdegree")

distances <- geodist(d.mat)
geodesics <- distances$gdist
geodesics[geodesics == Inf] <- 0 # code Inf values as zero.
1/rowSums(geodesics) #unstandardized closeness.
(1/rowSums(geodesics))*4 #standardized closeness.

closeness(d.mat, gmode="digraph")


set.seed(1)
gplot(d.net, arrowhead.cex = 0.5, vertex.cex=3.2, vertex.col = "orange", usecurve=TRUE, displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = "grey50")
set.seed(1)
gplot(d.net, arrowhead.cex = 0.5, vertex.cex=3.2, vertex.col = "orange", usecurve=TRUE, displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","green","grey50","grey50","grey50","grey50","green","grey50"))
set.seed(1)
gplot(d.net, arrowhead.cex = 0.5, vertex.cex=3.2, vertex.col = "orange", usecurve=TRUE, displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","green","grey50","grey50","green","grey50","grey50","grey50"))
set.seed(1)
gplot(d.net, arrowhead.cex = 0.5, vertex.cex=3.2, vertex.col = "orange", usecurve=TRUE, displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("green","grey50","grey50","grey50","grey50","grey50","grey50","grey50"))
set.seed(1)
gplot(d.net, arrowhead.cex = 0.5, vertex.cex=3.2, vertex.col = "orange", usecurve=TRUE, displaylabels = TRUE, label.pos=5, label.cex = 2.5, edge.col = c("grey50","red","grey50","grey50","grey50","grey50","grey50","grey50"))

betweenness(d.mat,gmode="digraph")

betweenness(d.mat,gmode="digraph") / (((5-1)*(5-2))/2)

centralization(d.mat,degree,mode="digraph") 
centralization(d.mat,closeness,mode="digraph") 
centralization(d.mat,betweenness,mode="digraph") 


# Plots for comparisons.
hd.lc <- network.initialize(16,directed = FALSE)
  hd.lc[2,c(1,3,4,5)] <- 1 
  hd.lc[6,c(5,7)] <- 1 
  hd.lc[7,c(8,9)] <- 1 
  hd.lc[10,c(11,12)] <- 1 
  hd.lc[13,c(14,15)] <- 1 
  hd.lc[8,10] <- 1 
  hd.lc[9,11] <- 1
  hd.lc[9,14] <- 1
  hd.lc[12,15] <- 1 
  hd.lc[2,16] <- 1
set.seed(1)
gplot(hd.lc,usearrows = FALSE,label=round(closeness(hd.lc, gmode="graph"),2),vertex.cex = degree(hd.lc,gmode="graph"),vertex.col=c("lightblue","green",rep("lightblue",14)))

hd.lb <- network.initialize(6,directed = FALSE)
  hd.lb[1,c(2,3,4,5)] <- 1
  hd.lb[2,3] <- 1
  hd.lb[3,c(4,5)] <- 1
  hd.lb[4,5] <- 1
  hd.lb[2,6] <- 1
set.seed(1)
gplot(hd.lb,usearrows = FALSE,label=round(betweenness(hd.lb, gmode="graph"),2),vertex.cex = degree(hd.lb,gmode="graph"),vertex.col=c("green","lightblue","lightblue","lightblue","lightblue","lightblue"))

ld.hc <- network.initialize(7,directed = FALSE)
  ld.hc[1,c(2,4,6,3)] <- 1
  ld.hc[2,c(4,5,6,7)] <- 1
  ld.hc[3,c(4,5,6,7)] <- 1
  ld.hc[4,5] <- 1
  ld.hc[5,6] <- 1
set.seed(1)
coords <- cbind(c(-2.387308, -3.987319, -4.335843, -4.378618, -2.607400, -2.284616, -3.347783),c(-4.317463, -2.048258, -2.941477, -4.014921, -2.316547, -3.293795, -3.332693))
gplot(ld.hc,usearrows = FALSE,label=round(closeness(ld.hc, gmode="graph"),2),vertex.cex = degree(ld.hc,gmode="graph"),coord=coords,vertex.col=c("lightblue","lightblue","lightblue","lightblue","lightblue","lightblue","green"))

ld.hb <- network.initialize(11,directed = FALSE)
  ld.hb[1,c(2,3,4,5)] <- 1
  ld.hb[2,c(3,4)] <- 1
  ld.hb[5,c(3,4)] <- 1
  ld.hb[6,c(7,8,9,10)] <- 1
  ld.hb[10,c(8,9)] <- 1
  ld.hb[7,c(8,9)] <- 1
  ld.hb[11,c(5,7)] <- 1
set.seed(1)
gplot(ld.hb,usearrows = FALSE,label=round(betweenness(ld.hb, gmode="graph"),2),vertex.cex = degree(ld.hb,gmode="graph"),vertex.col=c(rep("lightblue",10),"green"),label.pos = 5)

hc.lb <- network.initialize(5,directed = FALSE)
  hc.lb[1,c(4,5)] <- 1
  hc.lb[2,c(3,4)] <- 1
  hc.lb[3,c(2,5)] <- 1
  hc.lb[4,c(1,2,5)] <- 1
  hc.lb[5,c(1,3,4)] <- 1
set.seed(1)
gplot(hc.lb,usearrows = FALSE,label=round(betweenness(hc.lb, gmode="graph"),1),vertex.cex = 5^closeness(hc.lb, gmode="graph"),vertex.col=c("green",rep("lightblue",4)),label.pos = 5)
  
lc.hb <- network.initialize(15,directed = FALSE)
 lc.hb[1,c(2,3,4,5)] <- 1
 lc.hb[2,c(3,4)] <- 1
 lc.hb[5,c(3,4)] <- 1
 lc.hb[6,c(7,8,9,10)] <- 1
 lc.hb[10,c(8,9)] <- 1
 lc.hb[7,c(8,9)] <- 1
 lc.hb[11,c(5,7)] <- 1
 lc.hb[10,c(12,13,14,15)] <- 1
 lc.hb[12,c(13,14,15)] <- 1
 lc.hb[13,c(14,15)] <- 1
 lc.hb[14,15] <- 1
 lc.hb[11,9] <- 1
 lc.hb[12,9] <- 1
set.seed(2)
gplot(lc.hb,usearrows = FALSE,label=round(betweenness(lc.hb, gmode="graph"),2),vertex.cex = 5^closeness(lc.hb, gmode="graph"),vertex.col=c(rep("lightblue",10),"green",rep("lightblue",4)),label.pos = 5)

    
# ============ # 
# End of syntax.
# ============ # 