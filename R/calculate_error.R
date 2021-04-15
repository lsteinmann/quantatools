#' Get measurement error of a single sample given a quantum
#'
#' Calculates the difference between
#'
#' @param input numeric vector of measurement values
#' @param quantum numeric value of quantum
#'
#' @export
#' @examples
#' real_error <- c(-0.03, -0.02, -0.01, 0.01, 0.02)
#' quantum <- 0.325
#' input <- (1:5 * quantum) + real_error
#' calculate_error(input, quantum)
calculate_error <- function(input, quantum) {
  n_multiply <- round(input / quantum, 0)
  error <- input - n_multiply * quantum
  return(error)
}
