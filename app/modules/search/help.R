###########################################################
# Help descriptions of the SEARCH module
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################


searchModuleHelp <- function(id) {
  ns <- NS(id)

  help_defs <- list(
    list(
      id = ns("search_term-help"),
      help = "Use the search bar to look up genes or diseases. You can use
        regular expressions to fine-tune your search."
    )
  )

  data.frame(
    element = lapply(help_defs, function(x) paste0("#", x$id)) %>% unlist(),
    intro = lapply(help_defs, function(x) x$help) %>% unlist()
  )
}
