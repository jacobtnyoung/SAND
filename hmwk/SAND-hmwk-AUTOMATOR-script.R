# ----------------------- #
# Automate homework pages #

# Load the needed libraries
require( knitr )
require( rmarkdown )
require( here )

# Create the instructions
render( here::here( "hmwk/hmwk-01-instrutions.Rmd" ), "html_document" )
render( here::here( "hmwk/hmwk-02-instrutions.Rmd" ), "html_document" )

# Create the templates
render( here::here( "hmwk/hmwk-02-template.Rmd" ), "html_document" )

# Create the solutions


# Close this script
quit( save = "no" )