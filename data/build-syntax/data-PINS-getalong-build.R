# =============================================================================== #
# Build PINS data files for SAND course.
# =============================================================================== #


# ----
# This syntax file builds data files for use in the SAND course.
# This script is run once to build the files and export them 
# to the SAND data folder.


# ----
# Setup.

rm( list=ls() )


# ----
# Load the data.
setwd( "/Users/jyoung20/PINS/PINS_Wave_1_data/" )
load( "PINS_Wave_1_NETWORKS_FOR_ANALYSIS.RData" )

setwd( "/Users/jyoung20/PINS/PINS_Wave_2_data/" )
load( "PINS_Wave_2_NETWORKS_FOR_ANALYSIS.RData" )


# ----
# Create function to build adjacency matrix and write it to .csv.

write.adjacency <- function( input.net, file.name ){
  net.out <- network::as.sociomatrix( input.net )
  write.csv( net.out, paste( path, file.name, ".csv", sep = "" ) )
}


# ----
# Create the adjacency matrices.

path <- "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/SAND/data/"
write.adjacency( powerinfluence.net.w1, "data-PINS-power-w1-adj" )
write.adjacency( powerinfluence.net.w2, "data-PINS-power-w2-adj" )


# =============================================================================== #
# END FILE.
# =============================================================================== #