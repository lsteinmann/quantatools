#' Get sample data from x for bootstrap
#'
#' Returns a subset of the data decreased by the absolute value given in
#' "decrese_by = ..."
#'
#' @param x vector, numeric. Original set of measurements
#' @param decrease_by integer. A value that should be subtracted from the
#' length of the original measurement vector (x)
#'
#' @return a sample of x decreased by `decrease_by`
#' @export
#'
#' @examples
#' x <- 1:100
#' sample_of_x <- sample_bootstrap(x, decrease_by = 10)
#' length(sample_of_x)
sample_bootstrap <- function(x, decrease_by = 0) {
  sample <- sample(size = length(x) - decrease_by,
                   x = x, replace = T)
  return(sample)
}
