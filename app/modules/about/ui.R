###########################################################
# UI definitions of the ABOUT module
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################

aboutModuleUI <- function(id) {
  # obtain namespace
  ns <- NS(id)

  tagList(
    # TODO: add UI elements here
    div(
      id = ns("headline-help"),
      h3("About")
    )
  )
}
