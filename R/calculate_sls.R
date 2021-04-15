#' Calculate selective least squares method (by Paakanen)
#'
#'
#'
#' @param measurements numeric vector of measurement values
#' @param quanta a vector of quanta
#'
#' @return
#' @export
calculate_sls <- function(measurements, quanta) {
  quanta <- unique(quanta)
  sum <- 0
  for (i in seq_along(measurements)) {
    msmt <- measurements[i]
    g_sq <- c()
    for (j in seq_along(quanta)) {
      g_sq <- c(g_sq, least_absolute_remainder(msmt, quanta[j]) ^ 2)
    }
    sum <- sum + min(g_sq)
  }
  return(sum)
}
