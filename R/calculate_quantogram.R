#' Calculate Kendall's Cosine Quantogram
#'
#' The cosine quantogram method was developed by David George Kendall (1974).
#' Its aim is to determine a 'quantum' (i.e. a common base measure) of
#' previously unknown size from a set of measurements (see D. G. Kendall,
#' Hunting Quanta, Philosophical Transactions of the Royal Society of London.
#' Mathematical and Physical Sciences A 276, 1974, 231--266).
#'
#' The method has already been implemented in archaeology and historical
#' architecture (see e.g. J. Pakkanen, Deriving Ancient Foot Units from
#' Building Dimensions: a Statistical Approach Employing Cosine Quantogram
#' Analysis, 2002, doi: 10.15496/PUBLIKATION-3389).
#'
#' @param x A numeric vector of measurement values from which
#' the quantogram should be calculated
#' @param params cosine quantogram parameters, standard parameters accessible
#' with `getOption("CONSTANTS_QUANTOGRAM")`: "RNG_START", "RNG_END",
#' "STEP", "Q_MIN"
#' @param unround TRUE/FALSE, declares if artificial noise should be added to
#' the measurements (T) or if they should be taken as is (F), defaults to TRUE.
#'
#' @return a data frame with quanta and f(q)
#' @export
#'
#' @examples
#' data <- 0.37 * rep(seq(3, 6, 2), 300)
#' calculate_quantogram(data)
calculate_quantogram <- function(x,
                                 unround = TRUE,
                                 params = getOption("CONSTANTS_QUANTOGRAM")) {

  if (4 != sum(c("RNG_START", "RNG_END", "STEP", "Q_MIN") %in% names(params))) {
    stop("Incorrect parameters")
  }

  if (unround) {
    x <- unround_data(x)
  }

  A <- sqrt(2 / length(x))

  rng <- seq(params$RNG_START, params$RNG_END, by = params$STEP)
  results <- as.data.frame(matrix(ncol = 2, nrow = length(rng)))
  colnames(results) <- c("q", "f_q")
  results$q <- rng

  results$f_q <- vapply(results$q,
                        FUN.VALUE = numeric(1),
                        FUN = function(y) get_fofq(try_q = y,
                                                   x = x,
                                                   params = params,
                                                   A = A))
  return(results)
}


#' Calculate f(q)
#'
#' Calculates the f(q) of a given quantum for all measurements (in x).
#'
#' @param try_q a quantum value
#' @param params cosine quantogram parameters, standard parameters accessible
#' with `getOption("CONSTANTS_QUANTOGRAM")`, including "RNG_START", "RNG_END",
#' "STEP", "Q_MIN"
#' @param x A numeric vector of measurement values from which
#' the quantogram should be calculated
#' @param A Should be the sqrt(2 / length(measurement_vector))
#'
#' @keywords internal
#'
#' @return f(q)
get_fofq <- function(try_q, params, x, A) {
  q <- try_q
  if (q < params$Q_MIN) {
    f_q <- 0
  } else {
    sum <- 0
    e <- x %% q
    cosVal <- 2.0 * pi * e / q
    cosVal <- cos(cosVal)
    sum <- sum(cosVal)
    f_q <- A * sum
  }
  return(f_q)
}


#' Get a Quantum (single value) for a Set of Measurements
#'
#' @param x A numeric vector of measurement values for which
#' the quantum should be found
#' @param fofq TRUE / FALSE: Include f(q) in output or not
#' @param unround TRUE/FALSE, declares if artificial noise should be added to
#' the measurements (T) or if they should be taken as is (F), defaults to TRUE.
#'
#' @return The quantum of x
#' @export
#'
#' @examples
#' data <- 0.37 * rep(seq(3, 6, 2), 300)
#' get_quantum(data)
get_quantum <- function(x, fofq = FALSE, unround = TRUE) {
  quantogram <- calculate_quantogram(x, unround = unround)
  quantum <- quantogram[which(quantogram$f_q == max(quantogram$f_q)), ]
  if (fofq) {
    return(quantum)
  } else {
    return(quantum$q)
  }

}
