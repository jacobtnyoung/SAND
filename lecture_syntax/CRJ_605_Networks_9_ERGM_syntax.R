# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ======================================== # 
# Various syntax for ERGM lecture.
# ======================================== # 

rm(list = ls())

library(sna)
library(UserNetR)

# use Moreno data from UserNetR package.
set.seed(1)
gplot(Moreno,mode="fruchtermanreingold",main="",vertex.col="white",usearrows = FALSE)

set.seed(1)
gplot(Moreno,mode="fruchtermanreingold",main="Moreno's Friendship Network",vertex.col=Moreno %v% "gender",usearrows = FALSE)
legend("bottomleft",legend=c("Male","Female"),col=c("red","black"),title="legend",pt.cex=0.75,bty="n",pch=19)

# Use Power/influence from pins.
PI.edgelist <- read.csv(url("https://justicecenter.la.psu.edu/research/projects/files/pins-data"),header=FALSE,as.is=TRUE)
PI.net <- as.network(PI.edgelist, directed=TRUE, matrix.type="edgelist")

set.seed(1)
gplot(PI.net, edge.col="grey40", vertex.col="white", main="",displayisolates = FALSE, usearrows = FALSE)

set.seed(1)
gplot(PI.net, edge.col="grey40", vertex.col="lightblue", main="PINS Power/Influence Network",displayisolates = FALSE, usearrows = FALSE)


# Logic of models.
set.seed(1)
data1 <- rnorm(100,0,1)
hist(data1,col="lightblue",xlab="",main="")
abline(v=mean(data1),lwd=5)
mean(data1)

set.seed(5)
data2 <- rnorm(100,0,1)
hist(data2,col="lightgreen",xlab="",main="")
abline(v=mean(data2),lwd=5)
mean(data2)

set.seed(9)
data3 <- rnorm(100,0,1)
hist(data3,col="yellow",xlab="",main="")
abline(v=mean(data3),lwd=5)
mean(data3)



# ============ # 
# End of syntax.
# ============ # 