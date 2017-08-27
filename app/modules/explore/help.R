###########################################################
# Help descriptions of the EXPLORE module
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################


exploreModuleHelp <- function(id) {
  ns <- NS(id)

  help_defs <- list(
    list(
      id = ns("headline-help"),
      help = "Some help message specific to the Explore module"
    )
  )

  data.frame(
    element = lapply(help_defs, function(x) paste0("#", x$id)) %>% unlist(),
    intro = lapply(help_defs, function(x) x$help) %>% unlist()
  )
}
