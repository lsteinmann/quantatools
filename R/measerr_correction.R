#' Add a sequence of values around each measurement
#'
#' In cases where one is not confident that the measurements are consistent and
#' correct, this function adds a sequence of 'fake' measurements around each
#' value. Sequence runs between the values +- the value given as measurement
#' error.
#'
#' @param x a vector of measurements
#' @param measurement_error the possible error (same unit as measurements)
#'
#' @return x with additional sequences around each value
#' @export
#'
#' @examples
measerr_correction <- function(x, measurement_error = numeric(1),
                               params = getOption("CONSTANTS_QUANTOGRAM")) {
  newvec <- lapply(x, FUN = function(y) seq(from = (y - measurement_error),
                                            to = (y + measurement_error),
                                            by = params$STEP))
  newvec <- unlist(newvec)
  return(newvec)
}
