#' Unrounding Method
#'
#' As proposed by Kendall (1974) data may be 'unrounded' before calculating
#' the quantogram by adding a random number between -0.005 and 0.005
#' to produce artificial noise.
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
    sample(stats::rnorm(mean = 0, sd = depth / 2, n = 100000),
           size = length(input),
           replace = TRUE), 3)
  return(output)
}
