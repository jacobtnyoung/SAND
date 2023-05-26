# =============================================================================== #
# Build WOPINS data files for SAND course.
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

# Site 1.
setwd( "/Users/jyoung20/PINS/WOPINS_data/WOPINS_S1_data" )
load( "WOPINS_S1_TRUST_NETWORKS_FOR_ERGMS.RData" )
  
# Site 2.
setwd( "/Users/jyoung20/PINS/WOPINS_data/WOPINS_S2_data" )
load( "WOPINS_S2_TRUST_NETWORKS_FOR_ERGMS.RData" )


# ----
# Create function to build adjacency matrix and write it to .csv.

write.adjacency <- function( input.net, file.name ){
  net.out <- network::as.sociomatrix( input.net )
  write.csv( net.out, paste( path, file.name, ".csv", sep = "" ) )
}


# ----
# Create the adjacency matrices.

path <- "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/SAND/data/"
write.adjacency( SDD.net, "data-WOPINS-trust-s1gb-adj" )
write.adjacency( SDD.gb.net, "data-WOPINS-trust-s2gb-adj" )
write.adjacency( SDD.gp.net, "data-WOPINS-trust-s2gp-adj" )


# =============================================================================== #
# END FILE.
# =============================================================================== #