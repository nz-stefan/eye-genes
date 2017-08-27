###########################################################
# UI definitions of the EXPLORE module
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################

exploreModuleUI <- function(id) {
  # obtain namespace
  ns <- NS(id)

  tagList(
    # TODO: add UI elements here
    div(
      id = ns("headline-help"),
      h3("Explore")
    )
  )
}
