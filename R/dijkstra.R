#' Dijkstra algorithm implementation
#'
#' @param graph Data frame with thre columns V1. V2 and W
#' @param init_node Initia node where the funcitons will start computing
#'
#' @return dist
#' @export
#'
#' @examples wiki_graph <-
#'          data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'           v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'           w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
#'             dijkstra(wiki_graph, 1)
dijkstra <- function (graph,init_node) {

  #- Check of input
  #- graph should be a data frame, with three variables: v1, v2, w
  #-   v1 & v2: positive integers
  #-   w: positive number
  #- init_node: numeric scalar that exists in the graph
  stopifnot(is.data.frame(graph),length(graph) == 3,
            colnames(graph) == c("v1","v2","w"),
            is.numeric(graph[,1]) & graph[,1] > 0 & round(graph[,1])==graph[,1],
            is.numeric(graph[,2]) & graph[,2] > 0 & round(graph[,2])==graph[,2],
            is.numeric(graph[,3]) & graph[,3] > 0,
            is.numeric(init_node) & length(init_node)==1, any(graph[,1]==init_node))

  #- Initialize dist and Q vectors
  dist <- vector(length=1)
  Q <- vector(length=1)

  #- Set starting values for dist and Q
  for (v in unique(graph[,1])) {
    dist[v] <- Inf
    Q[v] <- v
  }
  dist[init_node] <- 0

  #- Loop through unvisited nodes
  while (length(Q) > 0) {
    #- Find node with minimum distance to init_node in vertex set Q
    dist_Q <- dist[Q]
    u <- Q[which.min(dist_Q)]
    Q <- Q[-which(Q==u)]
    #- Loop through neighbours v of u still in Q
    neighbor_v_of_u <- graph[which(graph[,1]==u),2]
    neighbor_v_of_u_still_in_Q <- neighbor_v_of_u[neighbor_v_of_u %in% Q]
    for (v in neighbor_v_of_u_still_in_Q) {
      alt <- dist[u] + graph[which(graph[,1]==u & graph[,2]==v),3]
      if (alt < dist[v]) {
        dist[v] <- alt
      }
    }
  }
  return(dist)
}
