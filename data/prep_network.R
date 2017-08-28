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


# Create network ----------------------------------------------------------

# all genes that have the same phenotype will be connected 
trans <- as(split(d$`Gene Symbol`, d$Phenotypes), "transactions")

# convert transactions into adjacency matrix which can be loaded into igraph
adj_mat <- crossTable(trans, measure = "count")

# create igraph
g <- graph.adjacency(adj_mat, mode = "undirected", weighted = TRUE)

# compute node groups
wc <- cluster_walktrap(g)
members <- membership(wc)

# convert igraph into networkD3 graph
gd3 <- igraph_to_networkD3(g, group = members)

# visualise graph
# NOTE: This is super slow...
forceNetwork(Links = gd3$links, Nodes = gd3$nodes, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'group')
