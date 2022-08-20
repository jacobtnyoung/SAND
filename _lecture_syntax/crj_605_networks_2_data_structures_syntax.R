# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ======================================== # 
# Various syntax for Data Structures lecture.
# ======================================== # 

rm(list = ls())
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
u.c.mat <- u.mat
u.c.mat[u.mat == 0] <- 1
diag(u.c.mat) <- 0


#set up the coordinates.
coords <- gplot(u.net, usearrows = FALSE, usecurve = FALSE, main="")

#plot the networks.
gplot(u.mat, gmode = "graph", displaylabels = TRUE, label.pos = 5, label.cex = 2.2, vertex.col = "lightblue", coord=coords, vertex.cex=3.2)
gplot(u.c.mat, gmode = "graph", displaylabels = TRUE, label.pos = 5, label.cex = 2.2, vertex.col = "lightgreen", coord=coords, vertex.cex=3.2)


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
d.c.mat <- d.mat
d.c.mat[d.mat == 0] <- 1
diag(d.c.mat) <- 0

#plot the networks.
gplot(d.mat, gmode = "digraph", displaylabels = TRUE, label.pos = 5, label.cex = 2.2, vertex.col = "orange", coord=coords, vertex.cex=3.2)
gplot(d.c.mat, gmode = "digraph", displaylabels = TRUE, label.pos = 5, label.cex = 2.2, vertex.col = "yellow", coord=coords, vertex.cex=3.2)


# ============ # 
# End of syntax.
# ============ # 