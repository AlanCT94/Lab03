#' Euclidean Algorithm implementation
#'
#' @param a integer
#' @param b integer
#'
#' @return a
#' @export
#'
#' @examples euclidean(100, 1000)
euclidean <- function(a,b){
  while (a != b) {
    if (a > b){
      a <- a-b
    }
    else{
      b <- b - a
    }
  }
  return(a)
}
