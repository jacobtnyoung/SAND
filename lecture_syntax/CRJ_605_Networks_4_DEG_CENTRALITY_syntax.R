# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ======================================== # 
# Various syntax for degree centrality lecture.
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
centralization(u.net,degree,mode="graph")

# Plots to show differences in centralization.
dum1 <- rbind(c(1,2),c(1,3),c(1,4),c(1,5))
star_net <- network(dum1,directed=FALSE)
dum2 <- rbind(c(1,2),c(2,3),c(3,4),c(4,5),c(5,1))
circle_net <- network(dum2,directed=FALSE)
par(mar=c(4,4,0.1,0.1))
my_pal <- brewer.pal(5,"Set2")
gplot(star_net  , usearrows=FALSE, displayisolates=FALSE, vertex.cex=2, vertex.col=my_pal[1], edge.lwd=0, edge.col="grey50",label=c("A","B","C","D","E"),label.pos=5)
gplot(circle_net, usearrows=FALSE, displayisolates=FALSE, vertex.cex=2, vertex.col=my_pal[3], edge.lwd=0, edge.col="grey50",label=c("F","G","H","I","J"),label.pos=5)
centralization(star_net,degree,mode="graph")
centralization(circle_net,degree,mode="graph")


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


# ============ # 
# End of syntax.
# ============ # 