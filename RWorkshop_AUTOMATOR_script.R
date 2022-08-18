require( knitr )
require( rmarkdown )

# Creates the html output.
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/index.Rmd", "html_document" )
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/R_Basics.Rmd", "html_document" )
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/R_Working_with_Data.Rmd", "html_document" )
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/R_Programming.Rmd", "html_document" )
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/R_Data_Visualization.Rmd", "html_document" )
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/R_Data_Example.Rmd", "html_document" )
render( "/Users/jyoung20/Dropbox (ASU)/GitHub_repos/RWorkshop/R_Markdown.Rmd", "html_document" )

# Close this script.
quit( save = "no" )