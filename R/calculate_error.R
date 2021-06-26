#' Get the Measurement Error of Samples Given a Known Quantum
#'
#' Calculates the difference between
#'
#' @param input numeric vector of measurement values
#' @param quantum numeric value of quantum
#' @param mean TRUE/FALSE: Should the mean (T) or the vector of all errors (F)
#' be returned
#'
#' @export
#' @examples
#' real_error <- c(-0.03, -0.02, -0.01, 0.01, 0.02)
#' quantum <- 0.325
#' input <- (1:5 * quantum) + real_error
#' errors <- calculate_error(input, quantum)
#' mean(errors)
calculate_error <- function(input, quantum, mean = FALSE) {
  n_multiply <- round(input / quantum, 0)
  error <- input - n_multiply * quantum
  if (mean) {
    error <- mean(error)
  }
  return(error)
}
