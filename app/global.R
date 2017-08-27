###########################################################
# Entry point of the app
#
# Author: Stefan Schliebs
# Created: 2017-08-27
###########################################################


library(shiny)
library(shinyWidgets)
library(shinycssloaders)
library(shinyjs)
library(rintrojs)
library(highcharter)
library(dplyr)
library(readr)
library(stringr)
library(DT)
library(shinydashboard)


# Load utilities ----------------------------------------------------------

# source all global utilities
source("utils/ui-utils.R")


# Load modules ------------------------------------------------------------

source("modules/search/global.R")
source("modules/explore/global.R")
source("modules/about/global.R")

