#' Get sample data from x for bootstrap
#'
#' Returns a subset of the data decreased by the absolute value given in
#' "decrease_by = ..."
#'
#' @param x vector, numeric. Original set of measurements
#' @param decrease_by integer. A value that should be subtracted from the
#' length of the original measurement vector (x)
#'
#' @return a sample of x decreased by `decrease_by`
#' @keywords internal
#'
#' @examples
#' \dontrun{
#' x <- 1:100
#' sampleofx <- sample_bootstrap(x, decrease_by = 10)
#' length(sampleofx)}
sample_bootstrap <- function(x, decrease_by = 0) {
  sample <- sample(size = length(x) - decrease_by,
                   x = x, replace = TRUE)
  return(sample)
}
