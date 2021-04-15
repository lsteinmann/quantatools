#' Unrounding method
#'
#' @param input a numeric vector of values to be "unrounded"
#' @param depth the value by which the fictional "unrounded" measurement can
#' deviate
#'
#' @return input with more decimal numbers (randomized)
#' @export
#'
#' @examples
#' unround_data(c(1, 2, 3), depth = 0.01)
unround_data <- function(input, depth = 0.01) {
  output <- input + round(
    sample(
      c(-depth / 2, depth / 2),
      size <- length(input),
      replace <- T
    ), 3)
  return(output)
}
