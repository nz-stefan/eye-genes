###########################################################
# Server logic of the SEARCH module
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################

# Module server function
searchModule <- function(input, output, session) {

  # Initialisation ----------------------------------------------------------

  # obtain namespace
  ns <- session$ns
  
  
  # Data --------------------------------------------------------------------

  d_genes <- reactive({read_rds("data/eye-gene-data.rds")})

  d_genes_filtered <- reactive({
    req(input$search_term)
    
    d_genes() %>% 
      filter(
        str_detect(tolower(`Gene Symbol`), tolower(input$search_term)) |
        str_detect(tolower(Phenotypes), tolower(input$search_term)) |
        str_detect(tolower(`Inheritance Pattern`), tolower(input$search_term))
      )
  })

    
  # Search results ----------------------------------------------------------
  
  output$results_table <- renderDataTable({
    req(input$search_term)

    validate(
      need(nrow(d_genes_filtered()) > 0, "No results")
    )
    
    
    # specify data table options
    dt_options <- list(
      pageLength = 10,
      lengthChange = FALSE,
      searching = FALSE,
      pagingType = "simple_numbers",
      autoWidth = FALSE
    )
    
    d_genes_filtered() %>% 
      select(`Gene Symbol`, Phenotypes, `Inheritance Pattern`) %>% 
      datatable(dt_options, rownames = FALSE, escape = FALSE, selection = 'single')
  })
  
  
  # Record details ----------------------------------------------------------
  
  output$record_details <- renderUI({
    req(input$results_table_rows_selected)
    
    record <- d_genes_filtered()[input$results_table_rows_selected,]

    tagList(
      div(tags$strong("Record Details")),
      tags$table(
        width = "100%",
        tags$tr(tags$td("Gene: "), tags$td(record$`Gene Symbol`)),
        tags$tr(tags$td("Gene Size: "), tags$td(record$`Gene Size`)),
        tags$tr(tags$td("Phenotype: "), tags$td(record$Phenotypes)),
        tags$tr(tags$td("Inheritance Pattern: "), tags$td(record$`Inheritance Pattern`)),
        tags$tr(tags$td("Chromosome: "), tags$td(record$Chromosome))
      )
    )
  })
}
