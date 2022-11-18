# -------------------- #
# Automate topic pages #

# This script knits the pages for the SAND website


# Load the needed libraries
require( knitr )
require( rmarkdown )
require( here )


# Creates the html output
render( here::here( "topics/page-01-intro.Rmd" ), "html_document" )
render( here::here( "topics/page-02-network-data.Rmd" ), "html_document" )
render( here::here( "topics/page-03-r-network-vis.Rmd" ), "html_document" )
render( here::here( "topics/page-04-centrality.Rmd" ), "html_document" )
render( here::here( "topics/page-05-subgroups.Rmd" ), "html_document" )
render( here::here( "topics/page-06-bipartite.Rmd" ), "html_document" )
render( here::here( "topics/page-07-ergm.Rmd" ), "html_document" )
render( here::here( "topics/page-08-sabm.Rmd" ), "html_document" )
render( here::here( "topics/page-99-help.Rmd" ), "html_document" )

# Close this script
quit( save = "no" )