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
  stopifnot(is.numeric(a),length(a)== 1)
  stopifnot(is.numeric(b),length(a)== 1)
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
