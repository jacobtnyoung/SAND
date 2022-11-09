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
com.data <- read.csv("MS_PhD_data.csv", as.is = TRUE, header = TRUE)

# ================== #
# Build the bipartite object.

# Create an edgelist format object.
data.edges <- rbind(
  cbind(com.data$"LastName",com.data$"Chair"),
  cbind(com.data$"LastName",com.data$"Member1"),
  cbind(com.data$"LastName",com.data$"Member2")
)

# clean up the names.
data.edges[data.edges == "Maguire, Edward" ]<-"Ed"
data.edges[data.edges == "Reisig, Michael" ]<-"Mike R."
data.edges[data.edges == "Pardini, Dustin" ]<-"Dustin"
data.edges[data.edges == "Roosevelt, Stacia" ]<-"Stacia"
data.edges[data.edges == "Fox, Kate" ]<-"Kate"
data.edges[data.edges == "Decker, Scott" ]<-"Scott"
data.edges[data.edges == "Sweeten, Gary" ]<-"Gary"
data.edges[data.edges == "Young, Jacob" ]<-"Jacob"
data.edges[data.edges == "Katz, Charles" ]<-"Chuck"
data.edges[data.edges == "Hepburn, John" ]<-"John"
data.edges[data.edges == "Wang, Xia" ]<-"Xia"
data.edges[data.edges == "Spohn, Cassia" ]<-"Cassia"
data.edges[data.edges == "White, Michael" ]<-"Mike W."
data.edges[data.edges == "Wallace, Danielle" ]<-"Danielle"
data.edges[data.edges == "Holtfreter, Kristy" ]<-"Kristy"
data.edges[data.edges == "Fradella, Hank" ]<-"Hank"
data.edges[data.edges == "Terrill, William" ]<-"Bill"
data.edges[data.edges == "Wright, Kevin" ]<-"Kevin"
data.edges[data.edges == "Chamberlain, Alyssa" ]<-"Alyssa"
data.edges[data.edges == "Scott, Michael" ]<-"Mike S."
data.edges[data.edges == "Telep, Cody" ]<-"Cody"
data.edges[data.edges == "Madeline Meier" ]<-"Madeline"
data.edges[data.edges == "Trinkner, Rick" ]<-"Rick"
data.edges[data.edges == "Grubesic, Tony" ]<-"Tony"
data.edges[data.edges == "Pizarro, Jesy" ]<-"Jesy"

# Create the adjacency matrix.
uR <-unique(data.edges[,1])
uC <- unique(data.edges[,2])
mat <- matrix(0, length(uR), length(uC))
rownames(mat) <- uR
colnames(mat) <- uC
mat[data.edges] <- 1
diag(mat) <- 0

# Take a look at the matrix.
sum(mat) # 104 edges.
dim(mat) # 60 students by 26 faculty.

# Now, create the bipartite network. 
PHD.MS.net <- network(mat,bipartite=dim(mat)[1],matrix.type="adjacency")

# removing the missing case.
delete.vertices(PHD.MS.net,61)

# Check the names.
network.vertex.names(PHD.MS.net)

# Take a look at the plot.
op <- par(mar=c(0,0,4,0))
gplot(PHD.MS.net,gmode="twomode",usearrows = FALSE,
    displayisolates = FALSE,
    label = network.vertex.names(PHD.MS.net), label.cex = 0.8, label.pos = 5, 
    label.col = c(rep("black",dim(as.matrix(PHD.MS.net))[1]),rep("black",dim(as.matrix(PHD.MS.net))[2])),label.bg = TRUE,
    vertex.col = c(rep("white",dim(as.matrix(PHD.MS.net))[1]),rep("grey80",dim(as.matrix(PHD.MS.net))[2])),
    vertex.cex = 1.2
)
par(op)


# ================== #
# Clean up the workspace and save the file.

# Remove the temporary objects.
rm(f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,i,id,ids,sid,x,y)
rm(spend.time.mat,talk.course.mat,trust.mat)
rm(spend.time.adj.mat,talk.course.adj.mat,trust.adj.mat)
rm(mat,uR,uC,tv.data,tv.data.edges)

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