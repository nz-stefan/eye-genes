###########################################################
# UI definitions of the SEARCH module
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################

searchModuleUI <- function(id) {
  # obtain namespace
  ns <- NS(id)

  tagList(
    h3("Search genes"),
    p("Search for genes (e.g. 'TEAD1'), phenotypes (e.g. 'Bardet-Biedl') or inheritance patterns (e.g. 'recessive')"),
    fluidRow(
      column(
        width = 8,
        div(
          id = ns("search_term-help"),
          searchInput(
            inputId = ns("search_term"),
            placeholder = "Enter a search term or a regular expression...", 
            btnSearch = icon("search"), 
            btnReset = icon("remove"), 
            width = "100%",
            label = ""
          )
          # style = "margin-top: 30px;"
        )
      ),
      column(
        width = 8,
        # uiOutput(ns("search_results"))
        div(
          dataTableOutput(ns("results_table"), width = "100%") %>% 
            withSpinner(type = 3, color.background = "white"),
          style = "margin-bottom: 60px"
        )
      ),
      column(
        width = 4,
        uiOutput(ns("record_details"))
      )
    )
  )
}
