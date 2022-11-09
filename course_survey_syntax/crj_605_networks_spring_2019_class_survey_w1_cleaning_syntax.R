# ######################################## #
# CRJ 605 Statistical Analysis of Networks.
# ######################################## #

# ==================================== # 
# This syntax file cleans the first wave of the survey data collected in class.
# ==================================== # 

# Clear workspace.
rm(list=ls())

# Call the needed libraries.
library(foreign)
library(sna)
library(network)

# ================== #
# Read the data into R.

# Either from a local directory.
  #use the setwd() function to specify your local directory.
setwd("/Users/jyoung20/Dropbox (ASU)/TEACHING_materials/ASU_courses/CRJ_605_Networks_Young/CRJ_605_Networks_SPRING_2019/")
class.data.w1 <- read.csv("crj_605_networks_spring_2019_class_survey_data_w1.csv", as.is = TRUE, header = TRUE)

# Or from my website.
class.data.w1 <- read.csv(url("https://www.jacobtnyoung.com/uploads/2/3/4/5/23459640/crj_605_networks_spring_2019_class_survey_data_w1.csv"), as.is = TRUE, header = TRUE)

# Look at the data.
class.data.w1
dim(class.data.w1) # 15 rows (students) and 33 columns (variables).


# ================== #
# Examine the structure of the data.

# Network data. 
class.data.w1[,4:6]  # columns 4:6 are the "spend time with frequently.." responses.
class.data.w1[,7:16]  # columns 7:16 are the "talked with about course.." responses.
class.data.w1[,17:24]  # columns 8:24 are the "trust re damaging repuation.." responses.

# Non-network data.
class.data.w1[,25:28]  # columns 25:28 are the network course knowledge, genre of music, preparation, and sleep questions, respectively.
class.data.w1[,29:31]  # columns 29:31 are the 3 tv shows responses.
class.data.w1[,32:33]  # columns 32:33 are the meals eaten out and generalized trust questions.


# ================== #
# Clean the data and build the adjacency matrices.

### First, go through the network data and clean up names that are mispelled.
unique(c(
  # spend time responses:
  class.data.w1[,4],class.data.w1[,5],class.data.w1[,6],
  # talked about course responses:
  class.data.w1[,7],class.data.w1[,8],class.data.w1[,9],class.data.w1[,10],class.data.w1[,11],
  class.data.w1[,12],class.data.w1[,13],class.data.w1[,14],class.data.w1[,15],class.data.w1[,16],
  # trust responses:
  class.data.w1[,17],class.data.w1[,18],class.data.w1[,19],class.data.w1[,20],
  class.data.w1[,21],class.data.w1[,22],class.data.w1[,23],class.data.w1[,24]
))

# Correct the spelling.
class.data.w1[class.data.w1 == "Karizza Pelletier"] <- "Karissa Pelletier"
class.data.w1[class.data.w1 == "Cariena Orosco"]    <- "Carlena Orosco"
class.data.w1[class.data.w1 == "Carina Orosco"]     <- "Carlena Orosco"
class.data.w1[class.data.w1 == "Michalea Flippin"]  <- "Michaela Flippin" 
class.data.w1[class.data.w1 == "Cariena Matekel"]   <- "Carlena Orosco" #had to go back to the hard copy to fix this one!
class.data.w1[class.data.w1 == "Manuel Sanchez"]    <- "Justin Sanchez"  #change Justin's name from Manuel.

# Now, replace missing characters with NA.
class.data.w1[class.data.w1 ==""] <- NA 

# Now, we want to simply things by assiging a numeric id.
unique(c(
  class.data.w1[,4],class.data.w1[,5],class.data.w1[,6],
  class.data.w1[,7],class.data.w1[,8],class.data.w1[,9],class.data.w1[,10],class.data.w1[,11],
  class.data.w1[,12],class.data.w1[,13],class.data.w1[,14],class.data.w1[,15],class.data.w1[,16],
  class.data.w1[,17],class.data.w1[,18],class.data.w1[,19],class.data.w1[,20],
  class.data.w1[,21],class.data.w1[,22],class.data.w1[,23],class.data.w1[,24]
))

cbind(class.data.w1[,1],class.data.w1[,3]) # to see what ids correspond to what names.
class.data.w1[9,1] <- "Carlena" #correct misspelling in name entry.
class.data.w1[12,1] <- "Justin" #change Manuel to Justin.

# Rewrite over the names with the unique ids.
class.data.w1[class.data.w1 == "Karissa Pelletier"  ] <- 20
class.data.w1[class.data.w1 == "Michaela Flippin"   ] <- 14
class.data.w1[class.data.w1 == "Katherine Brown"    ] <- 13  
class.data.w1[class.data.w1 == "Caitlin Matekel"    ] <- 18 
class.data.w1[class.data.w1 == "Danielle Haverkate" ] <- 15
class.data.w1[class.data.w1 == "Jon Bottema"        ] <- 12
class.data.w1[class.data.w1 == "Raven Simonds"      ] <- 23
class.data.w1[class.data.w1 == "Carlena Orosco"     ] <- 19
class.data.w1[class.data.w1 == "Megan Verhagen"     ] <- 24
class.data.w1[class.data.w1 == "Peter Best"         ] <- 11
class.data.w1[class.data.w1 == "Abigail Henderson"  ] <- 16
class.data.w1[class.data.w1 == "Jessica Rosenthal"  ] <- 21
class.data.w1[class.data.w1 == "Carlena Orosco"     ] <- 19
class.data.w1[class.data.w1 == "Justin Sanchez"     ] <- 22  


### Build the "Is this student someone whom you spend time with frequently outside of class?" adjancency matrix.
spend.time.mat <- cbind(class.data.w1[,3],class.data.w1[,4],class.data.w1[,5],class.data.w1[,6])

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
dimnames(x)<-list(class.data.w1[,1],class.data.w1[,1])
spend.time.adj.mat  <-as.matrix(x)
diag(spend.time.adj.mat) <- 0


# "Is this student someone whom you have talked with about this course or discussed this course?" adjancency matrix
talk.course.mat <-cbind(
class.data.w1[,3],  
class.data.w1[,7],class.data.w1[,8],class.data.w1[,9],class.data.w1[,10],class.data.w1[,11],
class.data.w1[,12],class.data.w1[,13],class.data.w1[,14],class.data.w1[,15],class.data.w1[,16])

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
dimnames(x)<-list(class.data.w1[,1],class.data.w1[,1])
talk.course.adj.mat  <-as.matrix(x)
diag(talk.course.adj.mat) <- 0


# "Would you trust telling this student something that might be potentially damaging to your reputation or embarrassing if revealed to others?" network.
trust.mat <- cbind(
  class.data.w1[,3],
  class.data.w1[,17],class.data.w1[,18],class.data.w1[,19],class.data.w1[,20],
  class.data.w1[,21],class.data.w1[,22],class.data.w1[,23],class.data.w1[,24])

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
}
dimnames(x)<-list(class.data.w1[,1],class.data.w1[,1])
trust.adj.mat  <-as.matrix(x)
diag(trust.adj.mat) <- 0


# ================== #
# Create the network structures and attach the attributes.

# First, create the network objects.
spend.time.net  <- network(spend.time.adj.mat,directed=T,matrix.type="adjacency")
talk.course.net <- network(talk.course.adj.mat,directed=T,matrix.type="adjacency")
trust.net       <- network(trust.adj.mat,directed=T,matrix.type="adjacency")

# Then, assign the vertex attributes to each network.
set.vertex.attribute(spend.time.net,"KnowNett1"  ,class.data.w1[,25])
set.vertex.attribute(spend.time.net,"Musict1"    ,class.data.w1[,26])
set.vertex.attribute(spend.time.net,"Studyt1"    ,class.data.w1[,27])
set.vertex.attribute(spend.time.net,"Sleept1"    ,class.data.w1[,28])
set.vertex.attribute(spend.time.net,"TV1t1"      ,class.data.w1[,29])
set.vertex.attribute(spend.time.net,"TV2t1"      ,class.data.w1[,30])
set.vertex.attribute(spend.time.net,"TV3t1"      ,class.data.w1[,31])
set.vertex.attribute(spend.time.net,"Mealst1"    ,class.data.w1[,32])
set.vertex.attribute(spend.time.net,"GenTrustt1" ,class.data.w1[,33])
set.vertex.attribute(talk.course.net,"KnowNett1" ,class.data.w1[,25])
set.vertex.attribute(talk.course.net,"Musict1"   ,class.data.w1[,26])
set.vertex.attribute(talk.course.net,"Studyt1"   ,class.data.w1[,27])
set.vertex.attribute(talk.course.net,"Sleept1"   ,class.data.w1[,28])
set.vertex.attribute(talk.course.net,"TV1t1"     ,class.data.w1[,29])
set.vertex.attribute(talk.course.net,"TV2t1"     ,class.data.w1[,30])
set.vertex.attribute(talk.course.net,"TV3t1"     ,class.data.w1[,31])
set.vertex.attribute(talk.course.net,"Mealst1"   ,class.data.w1[,32])
set.vertex.attribute(talk.course.net,"GenTrustt1",class.data.w1[,33])
set.vertex.attribute(trust.net      ,"KnowNett1" ,class.data.w1[,25])
set.vertex.attribute(trust.net      ,"Musict1"   ,class.data.w1[,26])
set.vertex.attribute(trust.net      ,"Studyt1"   ,class.data.w1[,27])
set.vertex.attribute(trust.net      ,"Sleept1"   ,class.data.w1[,28])
set.vertex.attribute(trust.net      ,"TV1t1"     ,class.data.w1[,29])
set.vertex.attribute(trust.net      ,"TV2t1"     ,class.data.w1[,30])
set.vertex.attribute(trust.net      ,"TV3t1"     ,class.data.w1[,31])
set.vertex.attribute(trust.net      ,"Mealst1"   ,class.data.w1[,32])
set.vertex.attribute(trust.net      ,"GenTrustt1",class.data.w1[,33])

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
    cbind(network.vertex.names(spend.time.net),class.data.w1$"TV1t1"),
    cbind(network.vertex.names(spend.time.net),class.data.w1$"TV2t1"),
    cbind(network.vertex.names(spend.time.net),class.data.w1$"TV3t1")
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
# Clean up the workspace and save the file.

# Remove the temporary objects.
rm(f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,i,id,ids,sid,x,y)
rm(spend.time.mat,talk.course.mat,trust.mat)
rm(spend.time.adj.mat,talk.course.adj.mat,trust.adj.mat)
rm(mat,uR,uC,tv.data.edges)

# Either from a local directory.
#use the setwd() function to specify your local directory.
setwd("/Users/jyoung20/Dropbox (ASU)/TEACHING_materials/ASU_courses/CRJ_605_Networks_Young/CRJ_605_Networks_SPRING_2019/")
save.image("CRJ_605_Networks_SPRING_2019_Class_Survey_Data_W1.RData")

# create some .csv files from the networks.
setwd("/Users/jyoung20/Dropbox (ASU)/TEACHING_materials/ASU_courses/CRJ_605_Networks_Young/CRJ_605_Networks_SPRING_2019/")
load("CRJ_605_Networks_SPRING_2019_Class_Survey_Data_W1.RData")
write.csv(as.matrix(spend.time.net),"CRJ_605_Networks_SPRING_2019_Spend_Time_W1_Adjancency.csv")
write.csv(as.matrix(talk.course.net),"CRJ_605_Networks_SPRING_2019_Talk_Course_W1_Adjancency.csv")
write.csv(as.matrix(trust.net),"CRJ_605_Networks_SPRING_2019_Trust_W1_Adjancency.csv")
write.csv(as.matrix(tv.net),"CRJ_605_Networks_SPRING_2019_TV_W1_Adjancency.csv")


# ############### #
# END SYNTAX FILE #
# ############### #
