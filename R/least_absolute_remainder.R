#' Title
#'
#' @param z value 1
#' @param q value 2
#'
#' @return least absolute remainder between z and q
#' @export
#'
#' @examples
least_absolute_remainder <- function(z, q) {
  lower <- floor(z / q)
  upper <- ceiling(z / q)

  rem_lower <- z - q * lower
  rem_upper <- z - q * upper

  abs_rem <- pmin(abs(rem_lower), abs(rem_upper))
  min_abs_rem <- ifelse(abs_rem == abs(rem_upper),
                        rem_upper,
                        rem_lower)
  return(min_abs_rem)
}
