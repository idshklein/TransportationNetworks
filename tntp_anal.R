library(tidyverse)
library(igraph)
library(tidygraph)
barcelona <- read_delim("./Barcelona/Barcelona_net.tntp",skip = 8,delim = "\t") %>% 
  select(-1,-ncol(.)) %>% 
  rename(from = init_node, to = term_node)
nodes <- data.frame(name = unique(c(barcelona$init_node %>% unique(),barcelona$term_node %>% unique())))
G <- as_tbl_graph(graph_from_data_frame(barcelona))
mean(degree(G))
