# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ==================================== # 
# This syntax file cleans the first and second wave of the survey data collected in class.
# ==================================== # 

# Clear workspace.
rm(list=ls())

# Call the needed libraries.
library(foreign)
library(sna)
library(network)

# ================== #
# Read in the file for wave 1 and wave 2 from the website.
class.data.w1.w2 <- read.csv(url("https://www.jacobtnyoung.com/uploads/2/3/4/5/23459640/crj_605_networks_spring_2019_class_survey_data_w1_w2.csv"), as.is = TRUE, header = TRUE)

# Look at the data.
class.data.w1.w2
dim(class.data.w1.w2) # 15 rows (students) and 63 columns (variables).


# ================== #
# Examine the structure of the data for wave 1.

# Network data. 
class.data.w1.w2[,4:6]  # columns 4:6 are the "spend time with frequently.." responses.
class.data.w1.w2[,7:16]  # columns 7:16 are the "talked with about course.." responses.
class.data.w1.w2[,17:24]  # columns 8:24 are the "trust re damaging repuation.." responses.

# Non-network data.
class.data.w1.w2[,25:28]  # columns 25:28 are the network course knowledge, genre of music, preparation, and sleep questions, respectively.
class.data.w1.w2[,29:31]  # columns 29:31 are the 3 tv shows responses.
class.data.w1.w2[,32:33]  # columns 32:33 are the meals eaten out and generalized trust questions.


# ================== #
# Clean the data and build the adjacency matrices.

### First, go through the network data and clean up names that are mispelled.
unique(c(
  # spend time responses:
  class.data.w1.w2[,4],class.data.w1.w2[,5],class.data.w1.w2[,6],
  # talked about course responses:
  class.data.w1.w2[,7],class.data.w1.w2[,8],class.data.w1.w2[,9],class.data.w1.w2[,10],class.data.w1.w2[,11],
  class.data.w1.w2[,12],class.data.w1.w2[,13],class.data.w1.w2[,14],class.data.w1.w2[,15],class.data.w1.w2[,16],
  # trust responses:
  class.data.w1.w2[,17],class.data.w1.w2[,18],class.data.w1.w2[,19],class.data.w1.w2[,20],
  class.data.w1.w2[,21],class.data.w1.w2[,22],class.data.w1.w2[,23],class.data.w1.w2[,24]
))

# Correct the spelling.
class.data.w1.w2[class.data.w1.w2 == "Karizza Pelletier"] <- "Karissa Pelletier"
class.data.w1.w2[class.data.w1.w2 == "Cariena Orosco"]    <- "Carlena Orosco"
class.data.w1.w2[class.data.w1.w2 == "Carina Orosco"]     <- "Carlena Orosco"
class.data.w1.w2[class.data.w1.w2 == "Michalea Flippin"]  <- "Michaela Flippin" 
class.data.w1.w2[class.data.w1.w2 == "Cariena Matekel"]   <- "Carlena Orosco" #had to go back to the hard copy to fix this one!
class.data.w1.w2[class.data.w1.w2 == "Manuel Sanchez"]    <- "Justin Sanchez"  #change Justin's name from Manuel.

# Now, replace missing characters with NA.
class.data.w1.w2[class.data.w1.w2 ==""] <- NA 

# Now, we want to simply things by assiging a numeric id.
unique(c(
  class.data.w1.w2[,4],class.data.w1.w2[,5],class.data.w1.w2[,6],
  class.data.w1.w2[,7],class.data.w1.w2[,8],class.data.w1.w2[,9],class.data.w1.w2[,10],class.data.w1.w2[,11],
  class.data.w1.w2[,12],class.data.w1.w2[,13],class.data.w1.w2[,14],class.data.w1.w2[,15],class.data.w1.w2[,16],
  class.data.w1.w2[,17],class.data.w1.w2[,18],class.data.w1.w2[,19],class.data.w1.w2[,20],
  class.data.w1.w2[,21],class.data.w1.w2[,22],class.data.w1.w2[,23],class.data.w1.w2[,24]
))

cbind(class.data.w1.w2[,1],class.data.w1.w2[,3]) # to see what ids correspond to what names.
class.data.w1.w2[9,1] <- "Carlena" #correct misspelling in name entry.
class.data.w1.w2[12,1] <- "Justin" #change Manuel to Justin.

# Rewrite over the names with the unique ids.
class.data.w1.w2[class.data.w1.w2 == "Karissa Pelletier"  ] <- 20
class.data.w1.w2[class.data.w1.w2 == "Michaela Flippin"   ] <- 14
class.data.w1.w2[class.data.w1.w2 == "Katherine Brown"    ] <- 13  
class.data.w1.w2[class.data.w1.w2 == "Caitlin Matekel"    ] <- 18 
class.data.w1.w2[class.data.w1.w2 == "Danielle Haverkate" ] <- 15
class.data.w1.w2[class.data.w1.w2 == "Jon Bottema"        ] <- 12
class.data.w1.w2[class.data.w1.w2 == "Raven Simonds"      ] <- 23
class.data.w1.w2[class.data.w1.w2 == "Carlena Orosco"     ] <- 19
class.data.w1.w2[class.data.w1.w2 == "Megan Verhagen"     ] <- 24
class.data.w1.w2[class.data.w1.w2 == "Peter Best"         ] <- 11
class.data.w1.w2[class.data.w1.w2 == "Abigail Henderson"  ] <- 16
class.data.w1.w2[class.data.w1.w2 == "Jessica Rosenthal"  ] <- 21
class.data.w1.w2[class.data.w1.w2 == "Carlena Orosco"     ] <- 19
class.data.w1.w2[class.data.w1.w2 == "Justin Sanchez"     ] <- 22  


### Build the "Is this student someone whom you spend time with frequently outside of class?" adjancency matrix.
spend.time.mat <- cbind(class.data.w1.w2[,3],class.data.w1.w2[,4],class.data.w1.w2[,5],class.data.w1.w2[,6])

# reshape the roster structure to an adjancency matrix.
y   <- spend.time.mat
ids <- spend.time.mat[,1]
sid <- sort(unique(ids))
x   <- matrix(0, ncol=length(sid), nrow=length(sid))
id  <- match(ids,sid)
f1  <- match(spend.time.mat[,2] ,sid)
f2  <- match(spend.time.mat[,3] ,sid)
f3  <- match(spend.time.mat[,4] ,sid)
for (i in 1:nrow(spend.time.mat)){
  if(!is.na(f1[i])) {x[id[i], f1[i]]<-1 }
  if(!is.na(f2[i])) {x[id[i], f2[i]]<-1 }
  if(!is.na(f3[i])) {x[id[i], f3[i]]<-1 }
}
dimnames(x)<-list(class.data.w1.w2[,1],class.data.w1.w2[,1])
spend.time.adj.mat  <-as.matrix(x)
diag(spend.time.adj.mat) <- 0


# "Is this student someone whom you have talked with about this course or discussed this course?" adjancency matrix
talk.course.mat <-cbind(
class.data.w1.w2[,3],  
class.data.w1.w2[,7],class.data.w1.w2[,8],class.data.w1.w2[,9],class.data.w1.w2[,10],class.data.w1.w2[,11],
class.data.w1.w2[,12],class.data.w1.w2[,13],class.data.w1.w2[,14],class.data.w1.w2[,15],class.data.w1.w2[,16])

# reshape the roster structure to an adjancency matrix.
y    <- talk.course.mat
ids  <- talk.course.mat[,1]
sid  <- sort(unique(ids))
x    <- matrix(0, ncol=length(sid), nrow=length(sid))
id   <- match(ids,sid)
f1   <- match(talk.course.mat[,2]  ,sid)
f2   <- match(talk.course.mat[,3]  ,sid)
f3   <- match(talk.course.mat[,4]  ,sid)
f4   <- match(talk.course.mat[,5]  ,sid)
f5   <- match(talk.course.mat[,6]  ,sid)
f6   <- match(talk.course.mat[,7]  ,sid)
f7   <- match(talk.course.mat[,8]  ,sid)
f8   <- match(talk.course.mat[,9]  ,sid)
f9   <- match(talk.course.mat[,10] ,sid)
f10  <- match(talk.course.mat[,11] ,sid)
for (i in 1:nrow(talk.course.mat)){
  if(!is.na(f1[i])) {x[id[i] , f1[i]]<-1 }
  if(!is.na(f2[i])) {x[id[i] , f2[i]]<-1 }
  if(!is.na(f3[i])) {x[id[i] , f3[i]]<-1 }
  if(!is.na(f4[i])) {x[id[i] , f4[i]]<-1 }
  if(!is.na(f5[i])) {x[id[i] , f5[i]]<-1 }
  if(!is.na(f6[i])) {x[id[i] , f6[i]]<-1 }
  if(!is.na(f7[i])) {x[id[i] , f7[i]]<-1 }
  if(!is.na(f8[i])) {x[id[i] , f8[i]]<-1 }
  if(!is.na(f9[i])) {x[id[i] , f9[i]]<-1 }
  if(!is.na(f10[i])) {x[id[i], f10[i]]<-1 }
}
dimnames(x)<-list(class.data.w1.w2[,1],class.data.w1.w2[,1])
talk.course.adj.mat  <-as.matrix(x)
diag(talk.course.adj.mat) <- 0


# "Would you trust telling this student something that might be potentially damaging to your reputation or embarrassing if revealed to others?" network.
trust.mat <- cbind(
  class.data.w1.w2[,3],
  class.data.w1.w2[,17],class.data.w1.w2[,18],class.data.w1.w2[,19],class.data.w1.w2[,20],
  class.data.w1.w2[,21],class.data.w1.w2[,22],class.data.w1.w2[,23],class.data.w1.w2[,24])

# reshape the roster structure to an adjancency matrix.
y    <- trust.mat
ids  <- trust.mat[,1]
sid  <- sort(unique(ids))
x    <- matrix(0, ncol=length(sid), nrow=length(sid))
id   <- match(ids,sid)
f1   <- match(trust.mat[,2] ,sid)
f2   <- match(trust.mat[,3] ,sid)
f3   <- match(trust.mat[,4] ,sid)
f4   <- match(trust.mat[,5] ,sid)
f5   <- match(trust.mat[,6] ,sid)
f6   <- match(trust.mat[,7] ,sid)
f7   <- match(trust.mat[,8] ,sid)
f8   <- match(trust.mat[,9] ,sid)
for (i in 1:nrow(trust.mat)){
  if(!is.na(f1[i])) {x[id[i] , f1[i]]<-1 }
  if(!is.na(f2[i])) {x[id[i] , f2[i]]<-1 }
  if(!is.na(f3[i])) {x[id[i] , f3[i]]<-1 }
  if(!is.na(f4[i])) {x[id[i] , f4[i]]<-1 }
  if(!is.na(f5[i])) {x[id[i] , f5[i]]<-1 }
  if(!is.na(f6[i])) {x[id[i] , f6[i]]<-1 }
  if(!is.na(f7[i])) {x[id[i] , f7[i]]<-1 }
  if(!is.na(f8[i])) {x[id[i] , f8[i]]<-1 }
}
dimnames(x)<-list(class.data.w1.w2[,1],class.data.w1.w2[,1])
trust.adj.mat  <-as.matrix(x)
diag(trust.adj.mat) <- 0


# ================== #
# Create the network structures and attach the attributes.

# First, create the network objects.
spend.time.net  <- network(spend.time.adj.mat,directed=T,matrix.type="adjacency")
talk.course.net <- network(talk.course.adj.mat,directed=T,matrix.type="adjacency")
trust.net       <- network(trust.adj.mat,directed=T,matrix.type="adjacency")

# Then, assign the vertex attributes to each network.
set.vertex.attribute(spend.time.net,"KnowNett1"  ,class.data.w1.w2[,25])
set.vertex.attribute(spend.time.net,"Musict1"    ,class.data.w1.w2[,26])
set.vertex.attribute(spend.time.net,"Studyt1"    ,class.data.w1.w2[,27])
set.vertex.attribute(spend.time.net,"Sleept1"    ,class.data.w1.w2[,28])
set.vertex.attribute(spend.time.net,"TV1t1"      ,class.data.w1.w2[,29])
set.vertex.attribute(spend.time.net,"TV2t1"      ,class.data.w1.w2[,30])
set.vertex.attribute(spend.time.net,"TV3t1"      ,class.data.w1.w2[,31])
set.vertex.attribute(spend.time.net,"Mealst1"    ,class.data.w1.w2[,32])
set.vertex.attribute(spend.time.net,"GenTrustt1" ,class.data.w1.w2[,33])
set.vertex.attribute(talk.course.net,"KnowNett1" ,class.data.w1.w2[,25])
set.vertex.attribute(talk.course.net,"Musict1"   ,class.data.w1.w2[,26])
set.vertex.attribute(talk.course.net,"Studyt1"   ,class.data.w1.w2[,27])
set.vertex.attribute(talk.course.net,"Sleept1"   ,class.data.w1.w2[,28])
set.vertex.attribute(talk.course.net,"TV1t1"     ,class.data.w1.w2[,29])
set.vertex.attribute(talk.course.net,"TV2t1"     ,class.data.w1.w2[,30])
set.vertex.attribute(talk.course.net,"TV3t1"     ,class.data.w1.w2[,31])
set.vertex.attribute(talk.course.net,"Mealst1"   ,class.data.w1.w2[,32])
set.vertex.attribute(talk.course.net,"GenTrustt1",class.data.w1.w2[,33])
set.vertex.attribute(trust.net      ,"KnowNett1" ,class.data.w1.w2[,25])
set.vertex.attribute(trust.net      ,"Musict1"   ,class.data.w1.w2[,26])
set.vertex.attribute(trust.net      ,"Studyt1"   ,class.data.w1.w2[,27])
set.vertex.attribute(trust.net      ,"Sleept1"   ,class.data.w1.w2[,28])
set.vertex.attribute(trust.net      ,"TV1t1"     ,class.data.w1.w2[,29])
set.vertex.attribute(trust.net      ,"TV2t1"     ,class.data.w1.w2[,30])
set.vertex.attribute(trust.net      ,"TV3t1"     ,class.data.w1.w2[,31])
set.vertex.attribute(trust.net      ,"Mealst1"   ,class.data.w1.w2[,32])
set.vertex.attribute(trust.net      ,"GenTrustt1",class.data.w1.w2[,33])

# Now, assign the other networks as edge attributes.
set.edge.value(spend.time.net ,"talk.course.net",as.matrix(talk.course.net))
set.edge.value(spend.time.net ,"trust.net"      ,as.matrix(trust.net))
set.edge.value(talk.course.net,"spend.time.net" ,as.matrix(spend.time.net))
set.edge.value(talk.course.net,"trust.net"      ,as.matrix(trust.net))
set.edge.value(trust.net      ,"talk.course.net",as.matrix(spend.time.net))
set.edge.value(trust.net      ,"spend.time.net" ,as.matrix(trust.net))


# ================== #
# Examine some plots.

gplot(spend.time.net , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightblue" , arrowhead.cex = 0.25, main = "Spend Time w/ Network")
gplot(talk.course.net, displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightgreen", arrowhead.cex = 0.25, main = "Talk w/ About Course Network")
gplot(trust.net      , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "orange"    , arrowhead.cex = 0.25, main = "Trust Network")

# partition the plotting window and plot all the networks.
par(mfrow=c(2,2))
gplot(spend.time.net , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightblue" , arrowhead.cex = 0.25, main = "Spend Time w/ Network")
gplot(talk.course.net, displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightgreen", arrowhead.cex = 0.25, main = "Talk w/ About Course Network")
gplot(trust.net      , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "orange"    , arrowhead.cex = 0.25, main = "Trust Network")


# ================== #
# Build the bipartite plot from the TV data.

# Create an edgelist format object.
tv.data.edges <- rbind(
    cbind(network.vertex.names(spend.time.net),class.data.w1.w2$"TV1t1"),
    cbind(network.vertex.names(spend.time.net),class.data.w1.w2$"TV2t1"),
    cbind(network.vertex.names(spend.time.net),class.data.w1.w2$"TV3t1")
    )

# Check for duplicate names on the tv variables.
sort(unique(tv.data.edges[,2]))

# Correct typos.
tv.data.edges[tv.data.edges == "Plantet Earth"] <- "Planet Earth"
tv.data.edges[tv.data.edges == "Great British Baking Show "] <- "Great British Baking Show"

# Create the adjacency matrix.
uR <-unique(tv.data.edges[,1])
uC <- unique(tv.data.edges[,2])
mat <- matrix(0, length(uR), length(uC))
rownames(mat) <- uR
colnames(mat) <- uC
mat[tv.data.edges] <- 1

# Take a look at the matrix.
sum(mat) # 45 edges.
dim(mat) # 15 students by 37 shows.

# Now, create the bipartite network. 
tv.net <- network(mat,bipartite=dim(mat)[1],matrix.type="adjacency")

# Attach the names.
network.vertex.names(tv.net)

# Take a look at the plot.
par(mfrow=c(1,1))
gplot(tv.net,gmode="twomode",usearrows = FALSE,
      label = network.vertex.names(tv.net), label.cex = 0.8, label.pos = 5, 
      label.col = c(rep("black",dim(as.matrix(tv.net))[1]),rep("purple",dim(as.matrix(tv.net))[2])),
      vertex.col = c(rep(rgb(245,5,5,alpha=100,maxColorValue = 255),dim(as.matrix(tv.net))[1]),rep(rgb(5,5,139,alpha=100,maxColorValue = 255),dim(as.matrix(tv.net))[2]))
)


# ================== #
# Examine the structure of the data for the second wave.

# Network data. 
class.data.w1.w2[,34:37]  # columns 34:37 are the "spend time with frequently.." responses.
class.data.w1.w2[,38:50]  # columns 38:50 are the "talked with about course.." responses.
class.data.w1.w2[,51:59]  # columns 51:59 are the "trust re damaging repuation.." responses.

# ================== #
# Clean the data and build the adjacency matrices.

### First, go through the network data and check for names that are mispelled.
unique(c(
  # spend time responses:
  class.data.w1.w2[,34],class.data.w1.w2[,35],class.data.w1.w2[,36], class.data.w1.w2[,37],
  # talked about course responses:
  class.data.w1.w2[,38],class.data.w1.w2[,39],class.data.w1.w2[,40],class.data.w1.w2[,41],class.data.w1.w2[,42],
  class.data.w1.w2[,43],class.data.w1.w2[,44],class.data.w1.w2[,45],class.data.w1.w2[,46],
  class.data.w1.w2[,47],class.data.w1.w2[,49],class.data.w1.w2[,49],class.data.w1.w2[,50],
  # trust responses:
  class.data.w1.w2[,51],class.data.w1.w2[,52],class.data.w1.w2[,53],class.data.w1.w2[,54],
  class.data.w1.w2[,55],class.data.w1.w2[,56],class.data.w1.w2[,57],class.data.w1.w2[,58],class.data.w1.w2[,59]
))

# Correct the spelling.
class.data.w1.w2[class.data.w1.w2 == " Carlena Orosco"]     <- "Carlena Orosco"
class.data.w1.w2[class.data.w1.w2 == " Danielle Haverkate"] <- "Danielle Haverkate"
class.data.w1.w2[class.data.w1.w2 == " Abigail Henderson"]  <- "Abigail Henderson" 
class.data.w1.w2[class.data.w1.w2 == " Katie Brown"]        <- "Katherine Brown"
class.data.w1.w2[class.data.w1.w2 == "Katie Brown"]         <- "Katherine Brown"
class.data.w1.w2[class.data.w1.w2 == " Karissa Pelletier"]  <- "Karissa Pelletier"
class.data.w1.w2[class.data.w1.w2 == " Caitlin Matekel"]    <- "Caitlin Matekel"
class.data.w1.w2[class.data.w1.w2 == " Natasha Khade"]      <- "Natasha Khade"
class.data.w1.w2[class.data.w1.w2 == " Jessica Rosenthal"]  <- "Jessica Rosenthal"
class.data.w1.w2[class.data.w1.w2 == "Carlena Orosco "]     <- "Carlena Orosco" 
class.data.w1.w2[class.data.w1.w2 == " Raven Simonds"]      <- "Raven Simonds" 
class.data.w1.w2[class.data.w1.w2 == " Justin Sanchez"]     <- "Justin Sanchez" 
class.data.w1.w2[class.data.w1.w2 == " Megan Verhagen"]     <- "Megan Verhagen" 


# Now, replace missing characters with NA.
class.data.w1.w2[class.data.w1.w2 ==""] <- NA 


# Rewrite over the names with the unique ids.
class.data.w1.w2[class.data.w1.w2 == "Karissa Pelletier"  ] <- 20
class.data.w1.w2[class.data.w1.w2 == "Michaela Flippin"   ] <- 14
class.data.w1.w2[class.data.w1.w2 == "Katherine Brown"    ] <- 13  
class.data.w1.w2[class.data.w1.w2 == "Caitlin Matekel"    ] <- 18 
class.data.w1.w2[class.data.w1.w2 == "Danielle Haverkate" ] <- 15
class.data.w1.w2[class.data.w1.w2 == "Jon Bottema"        ] <- 12
class.data.w1.w2[class.data.w1.w2 == "Raven Simonds"      ] <- 23
class.data.w1.w2[class.data.w1.w2 == "Carlena Orosco"     ] <- 19
class.data.w1.w2[class.data.w1.w2 == "Megan Verhagen"     ] <- 24
class.data.w1.w2[class.data.w1.w2 == "Peter Best"         ] <- 11
class.data.w1.w2[class.data.w1.w2 == "Abigail Henderson"  ] <- 16
class.data.w1.w2[class.data.w1.w2 == "Jessica Rosenthal"  ] <- 21
class.data.w1.w2[class.data.w1.w2 == "Carlena Orosco"     ] <- 19
class.data.w1.w2[class.data.w1.w2 == "Justin Sanchez"     ] <- 22  
class.data.w1.w2[class.data.w1.w2 == "Natasha Khade"     ] <- 17  
class.data.w1.w2[class.data.w1.w2 == "Katherine Brown"     ] <- 13  

  
### Build the "Is this student someone whom you spend time with frequently outside of class?" adjancency matrix.
spend.time.w2.mat <- cbind(class.data.w1.w2[,3],class.data.w1.w2[,34],class.data.w1.w2[,35],class.data.w1.w2[,36], class.data.w1.w2[,37])

# reshape the roster structure to an adjancency matrix.
y   <- spend.time.w2.mat
ids <- spend.time.w2.mat[,1]
sid <- sort(unique(ids))
x   <- matrix(0, ncol=length(sid), nrow=length(sid))
id  <- match(ids,sid)
f1  <- match(spend.time.w2.mat[,2] ,sid)
f2  <- match(spend.time.w2.mat[,3] ,sid)
f3  <- match(spend.time.w2.mat[,4] ,sid)
f4  <- match(spend.time.w2.mat[,5] ,sid)
for (i in 1:nrow(spend.time.w2.mat)){
  if(!is.na(f1[i])) {x[id[i], f1[i]]<-1 }
  if(!is.na(f2[i])) {x[id[i], f2[i]]<-1 }
  if(!is.na(f3[i])) {x[id[i], f3[i]]<-1 }
  if(!is.na(f4[i])) {x[id[i], f4[i]]<-1 }
}
dimnames(x)<-list(class.data.w1.w2[,1],class.data.w1.w2[,1])
spend.time.w2.adj.mat  <-as.matrix(x)
diag(spend.time.w2.adj.mat) <- 0


# "Is this student someone whom you have talked with about this course or discussed this course?" adjancency matrix
talk.course.w2.mat <-cbind(
  class.data.w1.w2[,3],
  class.data.w1.w2[,38],class.data.w1.w2[,39],class.data.w1.w2[,40],class.data.w1.w2[,41],class.data.w1.w2[,42],
  class.data.w1.w2[,43],class.data.w1.w2[,44],class.data.w1.w2[,45],class.data.w1.w2[,46],
  class.data.w1.w2[,47],class.data.w1.w2[,49],class.data.w1.w2[,49],class.data.w1.w2[,50])

# reshape the roster structure to an adjancency matrix.
y    <- talk.course.w2.mat
ids  <- talk.course.w2.mat[,1]
sid  <- sort(unique(ids))
x    <- matrix(0, ncol=length(sid), nrow=length(sid))
id   <- match(ids,sid)
f1   <- match(talk.course.w2.mat[,2]  ,sid)
f2   <- match(talk.course.w2.mat[,3]  ,sid)
f3   <- match(talk.course.w2.mat[,4]  ,sid)
f4   <- match(talk.course.w2.mat[,5]  ,sid)
f5   <- match(talk.course.w2.mat[,6]  ,sid)
f6   <- match(talk.course.w2.mat[,7]  ,sid)
f7   <- match(talk.course.w2.mat[,8]  ,sid)
f8   <- match(talk.course.w2.mat[,9]  ,sid)
f9   <- match(talk.course.w2.mat[,10] ,sid)
f10  <- match(talk.course.w2.mat[,11] ,sid)
f11  <- match(talk.course.w2.mat[,12] ,sid)
f12  <- match(talk.course.w2.mat[,13] ,sid)
f13  <- match(talk.course.w2.mat[,14] ,sid)
for (i in 1:nrow(talk.course.w2.mat)){
  if(!is.na(f1[i])) {x[id[i] , f1[i]]<-1 }
  if(!is.na(f2[i])) {x[id[i] , f2[i]]<-1 }
  if(!is.na(f3[i])) {x[id[i] , f3[i]]<-1 }
  if(!is.na(f4[i])) {x[id[i] , f4[i]]<-1 }
  if(!is.na(f5[i])) {x[id[i] , f5[i]]<-1 }
  if(!is.na(f6[i])) {x[id[i] , f6[i]]<-1 }
  if(!is.na(f7[i])) {x[id[i] , f7[i]]<-1 }
  if(!is.na(f8[i])) {x[id[i] , f8[i]]<-1 }
  if(!is.na(f9[i])) {x[id[i] , f9[i]]<-1 }
  if(!is.na(f10[i])) {x[id[i], f10[i]]<-1 }
  if(!is.na(f11[i])) {x[id[i], f11[i]]<-1 }
  if(!is.na(f12[i])) {x[id[i], f12[i]]<-1 }  
  if(!is.na(f13[i])) {x[id[i], f13[i]]<-1 }
}
dimnames(x)<-list(class.data.w1.w2[,1],class.data.w1.w2[,1])
talk.course.w2.adj.mat  <-as.matrix(x)
diag(talk.course.w2.adj.mat) <- 0


# "Would you trust telling this student something that might be potentially damaging to your reputation or embarrassing if revealed to others?" network.
trust.w2.mat <- cbind(
  class.data.w1.w2[,3],
  class.data.w1.w2[,51],class.data.w1.w2[,52],class.data.w1.w2[,53],class.data.w1.w2[,54],
  class.data.w1.w2[,55],class.data.w1.w2[,56],class.data.w1.w2[,57],class.data.w1.w2[,58],class.data.w1.w2[,59])

# reshape the roster structure to an adjancency matrix.
y    <- trust.w2.mat
ids  <- trust.w2.mat[,1]
sid  <- sort(unique(ids))
x    <- matrix(0, ncol=length(sid), nrow=length(sid))
id   <- match(ids,sid)
f1   <- match(trust.w2.mat[,2] ,sid)
f2   <- match(trust.w2.mat[,3] ,sid)
f3   <- match(trust.w2.mat[,4] ,sid)
f4   <- match(trust.w2.mat[,5] ,sid)
f5   <- match(trust.w2.mat[,6] ,sid)
f6   <- match(trust.w2.mat[,7] ,sid)
f7   <- match(trust.w2.mat[,8] ,sid)
f8   <- match(trust.w2.mat[,9] ,sid)
f9   <- match(trust.w2.mat[,10] ,sid)
for (i in 1:nrow(trust.w2.mat)){
  if(!is.na(f1[i])) {x[id[i] , f1[i]]<-1 }
  if(!is.na(f2[i])) {x[id[i] , f2[i]]<-1 }
  if(!is.na(f3[i])) {x[id[i] , f3[i]]<-1 }
  if(!is.na(f4[i])) {x[id[i] , f4[i]]<-1 }
  if(!is.na(f5[i])) {x[id[i] , f5[i]]<-1 }
  if(!is.na(f6[i])) {x[id[i] , f6[i]]<-1 }
  if(!is.na(f7[i])) {x[id[i] , f7[i]]<-1 }
  if(!is.na(f8[i])) {x[id[i] , f8[i]]<-1 }
  if(!is.na(f9[i])) {x[id[i] , f9[i]]<-1 }
}
dimnames(x)<-list(class.data.w1.w2[,1],class.data.w1.w2[,1])
trust.w2.adj.mat  <-as.matrix(x)
diag(trust.w2.adj.mat) <- 0


# ================== #
# Create the network structures and attach the attributes.

# First, create the network objects.
spend.time.w2.net  <- network(spend.time.w2.adj.mat ,directed=TRUE,matrix.type="adjacency")
talk.course.w2.net <- network(talk.course.w2.adj.mat,directed=TRUE,matrix.type="adjacency")
trust.w2.net       <- network(trust.w2.adj.mat      ,directed=TRUE,matrix.type="adjacency")

# Then, assign the vertex attributes to each network.
set.vertex.attribute(spend.time.w2.net,"Know_Nett2" , class.data.w1.w2[,60])
set.vertex.attribute(spend.time.w2.net,"Studyt2"    , class.data.w1.w2[,61])
set.vertex.attribute(spend.time.w2.net,"Sleept2"    , class.data.w1.w2[,62])
set.vertex.attribute(spend.time.w2.net,"Mealst2"    , class.data.w1.w2[,63])
set.vertex.attribute(spend.time.w2.net,"KnowNett1"  , class.data.w1.w2[,25])
set.vertex.attribute(spend.time.w2.net,"Musict1"    , class.data.w1.w2[,26])
set.vertex.attribute(spend.time.w2.net,"Studyt1"    , class.data.w1.w2[,27])
set.vertex.attribute(spend.time.w2.net,"Sleept1"    , class.data.w1.w2[,28])
set.vertex.attribute(spend.time.w2.net,"TV1t1"      , class.data.w1.w2[,29])
set.vertex.attribute(spend.time.w2.net,"TV2t1"      , class.data.w1.w2[,30])
set.vertex.attribute(spend.time.w2.net,"TV3t1"      , class.data.w1.w2[,31])
set.vertex.attribute(spend.time.w2.net,"Mealst1"    , class.data.w1.w2[,32])
set.vertex.attribute(spend.time.w2.net,"GenTrustt1" , class.data.w1.w2[,33])

set.vertex.attribute(talk.course.w2.net,"Know_Nett2" , class.data.w1.w2[,60])
set.vertex.attribute(talk.course.w2.net,"Studyt2"    , class.data.w1.w2[,61])
set.vertex.attribute(talk.course.w2.net,"Sleept2"    , class.data.w1.w2[,62])
set.vertex.attribute(talk.course.w2.net,"Mealst2"    , class.data.w1.w2[,63])
set.vertex.attribute(talk.course.w2.net,"KnowNett1"  , class.data.w1.w2[,25])
set.vertex.attribute(talk.course.w2.net,"Musict1"    , class.data.w1.w2[,26])
set.vertex.attribute(talk.course.w2.net,"Studyt1"    , class.data.w1.w2[,27])
set.vertex.attribute(talk.course.w2.net,"Sleept1"    , class.data.w1.w2[,28])
set.vertex.attribute(talk.course.w2.net,"TV1t1"      , class.data.w1.w2[,29])
set.vertex.attribute(talk.course.w2.net,"TV2t1"      , class.data.w1.w2[,30])
set.vertex.attribute(talk.course.w2.net,"TV3t1"      , class.data.w1.w2[,31])
set.vertex.attribute(talk.course.w2.net,"Mealst1"    , class.data.w1.w2[,32])
set.vertex.attribute(talk.course.w2.net,"GenTrustt1" , class.data.w1.w2[,33])

set.vertex.attribute(trust.w2.net,"Know_Nett2" , class.data.w1.w2[,60])
set.vertex.attribute(trust.w2.net,"Studyt2"    , class.data.w1.w2[,61])
set.vertex.attribute(trust.w2.net,"Sleept2"    , class.data.w1.w2[,62])
set.vertex.attribute(trust.w2.net,"Mealst2"    , class.data.w1.w2[,63])
set.vertex.attribute(trust.w2.net,"KnowNett1"  , class.data.w1.w2[,25])
set.vertex.attribute(trust.w2.net,"Musict1"    , class.data.w1.w2[,26])
set.vertex.attribute(trust.w2.net,"Studyt1"    , class.data.w1.w2[,27])
set.vertex.attribute(trust.w2.net,"Sleept1"    , class.data.w1.w2[,28])
set.vertex.attribute(trust.w2.net,"TV1t1"      , class.data.w1.w2[,29])
set.vertex.attribute(trust.w2.net,"TV2t1"      , class.data.w1.w2[,30])
set.vertex.attribute(trust.w2.net,"TV3t1"      , class.data.w1.w2[,31])
set.vertex.attribute(trust.w2.net,"Mealst1"    , class.data.w1.w2[,32])
set.vertex.attribute(trust.w2.net,"GenTrustt1" , class.data.w1.w2[,33])


# ================== #
# Examine some plots.

gplot(spend.time.w2.net , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightblue" , arrowhead.cex = 0.25, main = "Spend Time w/ Network t2")
gplot(talk.course.w2.net, displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightgreen", arrowhead.cex = 0.25, main = "Talk w/ About Course Network t2")
gplot(trust.w2.net      , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "orange"    , arrowhead.cex = 0.25, main = "Trust Network t2")

# partition the plotting window and plot all the networks.
par(mfrow=c(3,2))
gplot(spend.time.net    , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightblue" , arrowhead.cex = 0.25, main = "Spend Time w/ Network t1")
gplot(spend.time.w2.net , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightblue" , arrowhead.cex = 0.25, main = "Spend Time w/ Network t2")
gplot(talk.course.net   , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightgreen", arrowhead.cex = 0.25, main = "Talk w/ About Course Network t1")
gplot(talk.course.w2.net, displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "lightgreen", arrowhead.cex = 0.25, main = "Talk w/ About Course Network t2")
gplot(trust.net         , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "orange"    , arrowhead.cex = 0.25, main = "Trust Network t1")
gplot(trust.w2.net      , displaylabels = TRUE, label.pos = 5, label.cex = 0.5, edge.col = "grey60", vertex.col = "orange"    , arrowhead.cex = 0.25, main = "Trust Network t2")


# ================== #
# Clean up the workspace and save the file.

# Remove the temporary objects.
rm(f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,i,id,ids,sid,x,y)
rm(spend.time.mat,talk.course.mat,trust.mat)
rm(spend.time.adj.mat,talk.course.adj.mat,trust.adj.mat)
rm(mat,uR,uC,tv.data.edges)


# Either from a local directory.
#use the setwd() function to specify your local directory.
setwd("/Users/jyoung20/Dropbox (ASU)/TEACHING_materials/ASU_courses/CRJ_605_Networks_Young/CRJ_605_Networks_SPRING_2019/")
save.image("CRJ_605_Networks_SPRING_2019_Class_Survey_Data_W1_W2.RData")

# create some .csv files from the networks.
setwd("/Users/jyoung20/Dropbox (ASU)/TEACHING_materials/ASU_courses/CRJ_605_Networks_Young/CRJ_605_Networks_SPRING_2019/")
load("CRJ_605_Networks_SPRING_2019_Class_Survey_Data_W1_W2.RData")
write.csv(as.matrix(spend.time.net),"CRJ_605_Networks_SPRING_2019_Spend_Time_W1_Adjancency.csv")
write.csv(as.matrix(talk.course.net),"CRJ_605_Networks_SPRING_2019_Talk_Course_W1_Adjancency.csv")
write.csv(as.matrix(trust.net),"CRJ_605_Networks_SPRING_2019_Trust_W1_Adjancency.csv")
write.csv(as.matrix(tv.net),"CRJ_605_Networks_SPRING_2019_TV_W1_Adjancency.csv")
write.csv(as.matrix(spend.time.w2.net),"CRJ_605_Networks_SPRING_2019_Spend_Time_W2_Adjancency.csv")
write.csv(as.matrix(talk.course.w2.net),"CRJ_605_Networks_SPRING_2019_Talk_Course_W2_Adjancency.csv")
write.csv(as.matrix(trust.w2.net),"CRJ_605_Networks_SPRING_2019_Trust_W2_Adjancency.csv")


# ############### #
# END SYNTAX FILE #
# ############### #
