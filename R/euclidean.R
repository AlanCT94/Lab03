#' Euclidean Algorithm implementation
#'
#' @param a integer
#' @param b integer
#'
#' @return greatest common divisor
#' @export
#'
#' @examples euclidean(100, 1000)
euclidean <- function(a,b){
  stopifnot(is.numeric(a),round(a)==a,length(a)== 1)
  stopifnot(is.numeric(b),round(b)==b,length(a)== 1)

  while (a != b) {
    if (a > b){
      a <- a-b
    }
    else{
      b <- b-a
    }
  }
  return(a)
}
