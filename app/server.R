###########################################################
# Global server logic of the application
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################


shinyServer(
  function(input, output, session) {

    # call modules to add functionality of dashboard tabs
    callModule(searchModule, "search_module")
    callModule(exploreModule, "explore_module")
    callModule(aboutModule, "about_module")


    # handle help messages
    observeEvent(input$intro, {
      if (input$tabs == "search") {
        introjs(session, options = list(steps = searchModuleHelp("search_module")))
      }
      if (input$tabs == "explore") {
        introjs(session, options = list(steps = exploreModuleHelp("explore_module")))
      }
      if (input$tabs == "about") {
        introjs(session, options = list(steps = aboutModuleHelp("about_module")))
      }
    })
  }
)
