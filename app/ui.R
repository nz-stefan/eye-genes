###########################################################
# UI definitions for the app
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################


ui <- myNavbarPage(
  id = "tabs",
  nav_header = tagList(
    # include shinyjs globally (must be included once only)
    useShinyjs(),
    introjsUI(),
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "assets/css/style.css")),
    div(tags$img(src = "assets/images/banner.png"), id = "page-banner")
  ),

  tabPanel("Search", value = "search", searchModuleUI("search_module")),
  tabPanel("Explore", value = "explore", exploreModuleUI("explore_module")),
  tabPanel("About", value = "about", aboutModuleUI("about_module")),
  
  # set a max width for the content (looks nicer on larger screens)
  # change max width in the CSS file
  footer = tagList(
    tags$script("$('.navbar-default').addClass('fixed-width');"),
    tags$script("$('nav + .container-fluid').addClass('fixed-width panel-content')"),
    tags$script("$('#page-banner').addClass('fixed-width')")
  ),
  
  help_ui = div(
    style = "text-align: right;",
    actionButton("intro", "Help", icon = icon("question-circle"), class = "btn-help")
  )
)
