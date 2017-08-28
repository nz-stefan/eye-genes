###########################################################
# Create network graph
# 
# Author: Stefan Schliebs
# Created: 2017-08-28
###########################################################

library(dplyr)
library(readr)
library(arules)
library(igraph)
library(networkD3)


# Load data ---------------------------------------------------------------

d <- read_rds("data/eye-gene-data.rds") %>% 
  select(`Gene Symbol`, Phenotypes) %>% 
  distinct()

trans <- as(split(d$`Gene Symbol`, d$Phenotypes), "transactions")
adj_mat <- crossTable(trans, measure = "count")


g <- graph.adjacency(adj_mat, mode = "undirected", weighted = TRUE)
wc <- cluster_walktrap(g)
members <- membership(wc)

gd3 <- igraph_to_networkD3(g, group = members)

forceNetwork(Links = gd3$links, Nodes = gd3$nodes, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'group')
