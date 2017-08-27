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

  d_genes <- reactive({
    data_frame(
      gene = paste("G-", LETTERS, sep = ""),
      disease = paste("Eye syndrome", LETTERS),
      chromosome = 1:26
    )
  })
  
  d_genes_filtered <- reactive({
    req(input$search_term)
    
    d_genes() %>% 
      filter(
        str_detect(gene, input$search_term) |
        str_detect(disease, input$search_term)
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
      autoWidth = TRUE)
    
    d_genes_filtered() %>% 
      select(gene, disease) %>% 
      datatable(dt_options, rownames = FALSE, escape = FALSE, selection = 'single')
  })
  
  
  # Record details ----------------------------------------------------------
  
  output$record_details <- renderUI({
    req(input$results_table_rows_selected)
    
    record <- d_genes_filtered()[input$results_table_rows_selected,]

    tagList(
      h3("Record Details"),
      div("Gene: ", record$gene),
      div("Disease: ", record$disease),
      div("Chromosome: ", record$chromosome)
      
    )
  })
}


