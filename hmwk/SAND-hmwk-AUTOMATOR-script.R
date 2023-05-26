# ----------------------- #
# Automate homework pages #

# Load the needed libraries
require( knitr )
require( rmarkdown )
require( here )

# Creates the html output
render( here::here( "hmwk/hmwk-01-instrutions.Rmd" ), "html_document" )


# Close this script
quit( save = "no" )