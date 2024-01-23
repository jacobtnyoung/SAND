# -------------------- #
# Automate topic pages #

# This script knits the pages for the SAND website


# Load the needed libraries
require( knitr )
require( rmarkdown )
require( here )


# Creates the html output
render( here::here( "labs/lab-01-r-intro.Rmd" ), "html_document" )
render( here::here( "labs/lab-02-rmarkdown.Rmd" ), "html_document" )
render( here::here( "labs/lab-03-network-data.Rmd" ), "html_document" )

###HERE WITH UPDATING
#render( here::here( "labs/lab-04-degree-centrality.Rmd" ), "html_document" )
#render( here::here( "labs/lab-05-close-between-centrality.Rmd" ), "html_document" )
#render( here::here( "labs/lab-06-subgroups.Rmd" ), "html_document" )
#render( here::here( "labs/lab-07-bipartite.Rmd" ), "html_document" )
#render( here::here( "labs/lab-08-projection-weighted.Rmd" ), "html_document" )
#render( here::here( "labs/lab-09-ergm-intro.Rmd" ), "html_document" )
#render( here::here( "labs/lab-10-ergm-gof.Rmd" ), "html_document" )
#render( here::here( "labs/lab-11-sabm-intro.Rmd" ), "html_document" )
#render( here::here( "labs/lab-12-sabm-coevolution.Rmd" ), "html_document" )


# Close this script
quit( save = "no" )