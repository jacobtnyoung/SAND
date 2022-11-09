# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ======================================== # 
# Various syntax for identifying subgroups lecture.
# ======================================== # 

rm(list = ls())

# ======== #
# Example 1.
# Create the undirected graph for the clique analysis.
# this comes from Knoke and Yang.

library(sna)
library(network)

# Initialize the network object.
clique.example1.net <- network.initialize(6, directed=FALSE)

# Add the edges.
clique.example1.net[1,c(2,5,6)] <- 1
clique.example1.net[2,c(5,3,4)] <- 1
clique.example1.net[3,c(4,5,6)] <- 1
clique.example1.net[4,5] <- 1

network.vertex.names <- LETTERS[1:6] # use the LETTERS function to get 6 upper-case letters.

set.seed(1)
coords <- gplot(clique.example1.net,gmode="graph",label=network.vertex.names, vertex.col="lightgreen")

# adjust coordinates to get them where you want them.
coords[1,] <- c(0.2, 4.0) #A 
coords[2,] <- c(1.2, 3.0) #B
coords[3,] <- c(1.2, 1.5) #C
coords[4,] <- c(-0.5, 1.5) #D
coords[5,] <- c(-0.5, 3.0) #E
coords[6,] <- c(2.2, 2.8) #F

gplot(clique.example1.net,gmode="graph",label=network.vertex.names, vertex.col="white",coord = coords)

#show ABE clique.
e.col <- c("lightgreen", "lightgreen", "grey40", "lightgreen", "grey40", "grey40", "grey40", "grey40", "grey40", "grey40")
v.col <- c("lightgreen","lightgreen","white","white","lightgreen","white")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)

#show BCDE clique.
e.col <- c("grey40", "grey40", "grey40", "lightgreen", "lightgreen", "lightgreen", "lightgreen", "lightgreen", "grey40", "lightgreen")
v.col <- c("white","lightgreen","lightgreen","lightgreen","lightgreen","white")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)

#show EBC is not a clique.
e.col <- c("grey40", "grey40", "grey40", "lightgreen", "lightgreen", "grey40", "grey40", "lightgreen", "grey40", "grey40")
v.col <- c("white","lightgreen","lightgreen","white","lightgreen","white")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)
e.col <- c("grey40", "grey40", "grey40", "lightgreen", "lightgreen", "red", "red", "lightgreen", "grey40", "red")
v.col <- c("white","lightgreen","lightgreen","red","lightgreen","white")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)

#show EBD is not a clique.
e.col <- c("grey40", "grey40", "grey40", "lightgreen", "grey40", "lightgreen", "grey40", "grey40", "grey40", "lightgreen")
v.col <- c("white","lightgreen","white","lightgreen","lightgreen","white")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)
e.col <- c("grey40", "grey40", "grey40", "lightgreen", "red", "lightgreen", "red", "red", "grey40", "lightgreen")
v.col <- c("white","lightgreen","red","lightgreen","lightgreen","white")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)

#show 2-clique ABCDEF.
e.col <- c("violet", "violet", "violet", "violet", "violet", "violet", "violet", "violet", "violet", "violet")
v.col <- c("violet","violet","violet","violet","violet","violet")
gplot(clique.example1.net, gmode = "graph", label = network.vertex.names, vertex.col = v.col,coord = coords, edge.col = e.col)


# Take a look in igraph.
library(intergraph)
library(igraph)
i.clique.example1.net <- asIgraph(clique.example1.net)
cliques(i.clique.example1.net,min=3) # note that this function relaxes the constraint of no externally tied nodes.
plot(i.clique.example1.net) 


# ======== #
# Example 2.
# Create the undirected graph for the clique analysis.
# this comes from Wasserman & Faust.

library(sna)
library(network)

# Initialize the network object.
clique.example2.net <- network.initialize(7, directed=FALSE)

# Add the edges.
clique.example2.net[1,c(2,3,5)] <- 1
clique.example2.net[2,c(3,7)] <- 1
clique.example2.net[3,c(4,5,6)] <- 1
clique.example2.net[4,c(5,6,7)] <- 1
clique.example2.net[5,6] <- 1

network.vertex.names <- LETTERS[1:7] # use the LETTERS function to get 6 upper-case letters.

set.seed(1)
coords <- gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col="lightgreen")

# adjust coordinates to get them where you want them.
coords[1,] <- c(-2.0, 3.5) #A 
coords[2,] <- c(-1.0, 5.0) #B 
coords[3,] <- c(-1.0, 3.5) #C 
coords[4,] <- c(1.0, 3.5) #D 
coords[5,] <- c(-1.0, 2.0) #E 
coords[6,] <- c(1.0, 2.0) #F 
coords[7,] <- c(1.0, 5.0) #G 

gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col="white",coord = coords)

#show ABC clique.
e.col <- c("lightgreen", "lightgreen", "grey40", "lightgreen", "grey40", "grey40", "grey40", "grey40", "grey40", "grey40", "grey40", "grey40")
v.col <- c("lightgreen","lightgreen","lightgreen","white","white","white","white")
gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)

#show ACE clique.
e.col <- c("grey40", "lightgreen", "lightgreen", "grey40", "grey40", "grey40", "lightgreen", "grey40", "grey40", "grey40", "grey40", "grey40")
v.col <- c("lightgreen","white","lightgreen","white","lightgreen","white","white")
gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)

#show CDEF clique.
e.col <- c("grey40", "grey40", "grey40", "grey40", "grey40", "lightgreen", "lightgreen", "lightgreen", "lightgreen", "lightgreen", "grey40", "lightgreen")
v.col <- c("white","white","lightgreen","lightgreen","lightgreen","lightgreen","white")
gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)

# not CDE.
e.col <- c("grey40", "grey40", "grey40", "grey40", "grey40", "lightgreen", "lightgreen", "grey40", "lightgreen", "grey40", "grey40", "grey40")
v.col <- c("white","white","lightgreen","lightgreen","lightgreen","white","white")
gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)
e.col <- c("grey40", "grey40", "grey40", "grey40", "grey40", "lightgreen", "lightgreen", "red", "lightgreen", "red", "grey40", "red")
v.col <- c("white","white","lightgreen","lightgreen","lightgreen","red","white")
gplot(clique.example2.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)

# Take a look in igraph.
library(intergraph)
library(igraph)
i.clique.example2.net <- asIgraph(clique.example2.net)
cliques(i.clique.example2.net,min=3) # note that this function relaxes the constraint of no externally tied nodes.
plot(i.clique.example2.net) 


# ======== #
# Example 3.
# Create the undirected graph for the n-clique analysis.
# this comes from Wasserman & Faust.

library(sna)
library(network)

# Initialize the network object.
clique.example3.net <- network.initialize(6, directed=FALSE)

# Add the edges.
clique.example3.net[1,c(2,3)] <- 1
clique.example3.net[2,c(3,4)] <- 1
clique.example3.net[3,5] <- 1
clique.example3.net[4,6] <- 1
clique.example3.net[5,6] <- 1

network.vertex.names <- LETTERS[1:6] # use the LETTERS function to get 6 upper-case letters.

set.seed(1)
coords <- gplot(clique.example3.net,gmode="graph",label=network.vertex.names, vertex.col="white")

# adjust coordinates to get them where you want them.
coords[1,] <- c(0.0, 5.0)  #A 
coords[2,] <- c(-1.0, 3.2) #B
coords[3,] <- c(1.0, 3.1)  #C
coords[4,] <- c(-1.0, 2.0) #D
coords[5,] <- c(1.0, 2.0)  #E
coords[6,] <- c(0.0, 0.0)  #F

gplot(clique.example3.net,gmode="graph",label=network.vertex.names, vertex.col="white",coord = coords)

#show the 1-clique, ABC.
e.col <- c("violet", "violet", "violet", "grey40", "grey40", "grey40", "grey40")
v.col <- c("violet","violet","violet","white","white","white")
gplot(clique.example3.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)

#show the 2-clique, ABCDE.
e.col <- c("violet", "violet", "violet", "violet", "violet", "grey40", "grey40")
v.col <- c("violet","violet","violet","violet","violet","white")
gplot(clique.example3.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)
e.col <- c("violet", "violet", "violet", "violet", "violet", "violet", "violet")
v.col <- c("violet","violet","violet","violet","violet","white")
gplot(clique.example3.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)

#show the 2-clique, BCDEF.
e.col <- c("grey40", "grey40", "violet", "violet", "violet", "violet", "violet")
v.col <- c("white","violet","violet","violet","violet","violet")
gplot(clique.example3.net,gmode="graph",label=network.vertex.names, vertex.col=v.col, edge.col=e.col, coord = coords)


# ======== #
# Example 3.
# Create the undirected graph for the k-core analysis.

library(sna)
library(network)
detach(package:igraph)

# Create the network object.
set.seed(605)
random.net <- as.network(rgraph(15,mode="graph",tp = 0.35),directed=FALSE)

set.seed(605)
coords <- gplot(random.net,gmode="graph",label=LETTERS[1:15], vertex.col="white", edge.col="grey40")
gplot(random.net,gmode="graph",label=LETTERS[1:15], vertex.col="white", edge.col="grey40", coord = coords)

# find the k-cores.
?kcores
random.net.kcores <- kcores(random.net,mode="graph")
random.net.kcores

# create the colors and the labels.
v.cols <- rainbow(max(random.net.kcores))
v.cols <- v.cols[random.net.kcores]
set.vertex.attribute(random.net,"v.cols",v.cols)
set.vertex.attribute(random.net,"v.labs",LETTERS[1:15])
set.vertex.attribute(random.net,"x.coords",coords[,1])
set.vertex.attribute(random.net,"y.coords",coords[,2])

# Plot them.
op <- par(mar=c(0,0,4,0))
gplot(random.net,gmode="graph",label=random.net.kcores, label.pos = 5, vertex.col=v.cols, edge.col="grey40", coord = coords)
title(main="Plot of All k-cores",cex.main=3)
par(op)

# Now, create the subgraphs and plot them.
random.net.2core <- get.inducedSubgraph(random.net,v=which(random.net.kcores >= 2))
random.net.3core <- get.inducedSubgraph(random.net,v=which(random.net.kcores >= 3))
random.net.4core <- get.inducedSubgraph(random.net,v=which(random.net.kcores >= 4))

# Fix the coordinates.
cord2core <- cbind(random.net.2core %v% "x.coords",random.net.2core %v% "y.coords")
cord3core <- cbind(random.net.3core %v% "x.coords",random.net.3core %v% "y.coords")
cord4core <- cbind(random.net.4core %v% "x.coords",random.net.4core %v% "y.coords")

# Plot all of them.
op <- par(mfrow=c(2,2),mar=c(0,0,4,0))
gplot(random.net.2core,gmode="graph",label=random.net.2core %v% "v.labs", label.pos = 5, vertex.col=random.net.2core %v% "v.cols", edge.col="grey40", coord = cord2core)
title(main="All 2:4-cores",cex.main=2)
gplot(random.net.3core,gmode="graph",label=random.net.3core %v% "v.labs", label.pos = 5, vertex.col=random.net.3core %v% "v.cols", edge.col="grey40", coord = cord3core)
title(main="All 3:4-cores",cex.main=2)
gplot(random.net.4core,gmode="graph",label=random.net.4core %v% "v.labs", label.pos = 5, vertex.col=random.net.4core %v% "v.cols", edge.col="grey40", coord = cord4core)
title(main="All 4-cores",cex.main=2)
gplot(random.net,gmode="graph",label=LETTERS[1:15], vertex.col="white", edge.col="grey40", coord = coords)
par(op)


# ======== #
# Example 4.
# Create the undirected graph for the k-core analysis.

# Create the network object.
set.seed(605)
random.2.net <- as.network(rgraph(150,mode="graph",tp = runif(150)%o%runif(150)),directed=FALSE)
set.seed(605)
coords <- gplot(random.2.net,gmode="graph", vertex.col="white", edge.col="grey60")

op <- par(mar=c(0,0,4,0))
gplot(random.2.net,gmode="graph", vertex.col="white", edge.col="grey60", coord = coords)
title(main="Plot of 150 nodes\n with density= 0.24",cex.main=2)
par(op)

# find the k-cores.
?kcores
random.2.net.kcores <- kcores(random.2.net,mode="graph")
random.2.net.kcores
table(random.2.net.kcores)
hist(random.2.net.kcores,col="lightblue",breaks=20,xlim=c(0,30),ylim=c(0,80),main="Histograph of k-cores",xlab="k-core membership")

# create the colors and the labels.
library(RColorBrewer)
v.cols   <- colorRampPalette(brewer.pal(12, "Set3"))(length(random.2.net.kcores))
v.cols   <- v.cols[random.2.net.kcores]

# Other stuff for the plot.
set.vertex.attribute(random.2.net,"v.cols",v.cols)
set.vertex.attribute(random.2.net,"v.labs",random.2.net.kcores)
set.vertex.attribute(random.2.net,"x.coords",coords[,1])
set.vertex.attribute(random.2.net,"y.coords",coords[,2])

# Plot them.
op <- par(mar=c(0,0,4,0))
gplot(random.2.net,gmode="graph",vertex.col=v.cols, edge.col="grey60", coord = coords, label=random.2.net.kcores,label.pos = 5)
title(main="Plot of All k-cores",cex.main=2)
par(op)

# Now, create the subgraphs and plot them.
random.2.net.27core <- get.inducedSubgraph(random.2.net,v=which(random.2.net.kcores >= 27))
cord27core <- cbind(random.2.net.27core %v% "x.coords",random.2.net.27core %v% "y.coords")
op <- par(mar=c(0,0,4,0))
gplot(random.2.net.27core,gmode="graph",vertex.col=random.2.net.27core %v% "v.cols", edge.col="grey60", coord = cord27core, label=random.2.net.27core %v% "v.labs",label.pos = 5)
title(main="Plot of All k-cores",cex.main=2)
par(op)


# ======== #
# Example 5.
# Create the undirected graph for the k-core analysis.

set.seed(605)
library(sna)
library(network)
example5.net <- network.initialize(4, directed=FALSE)
example5.net[1,c(2,3,4)] <- 1
set.seed(1)
gplot(example5.net,label=LETTERS[1:4],vertex.col="lightblue",gmode="graph")

# ============ # 
# End of syntax.
# ============ # 