#' Compute boostrap confidence interval
#'
#' @param set a numeric vector of measurements from which quantum and bootstrap
#' should be computed
#' @param confint confidence level, 0.05 by default
#' @param n_samples number of bootstrap samples
#' @param sample_portion The portion (<1) of the original data that should
#' be used for each sample
#' @param params Constants used in the quantum calculation,
#' see getOption("CONSTANTS_QUANTOGRAM")
#'
#' @return a list containing the bootstrap plot, the original quanta, a
#' dataframe with the bootstrap results and the confidence interval
#' @export
#'
#' @examples
#' x <- rnorm(10) * 0.652
#' bootstrap_quanta(set = x, sample_portion = 0.5,
#' confint = 0.05, n_samples = 100)
#'
bootstrap_quanta <- function(set = NULL,
                             sample_portion = 0.75,
                             confint = 0.05,
                             n_samples = 500,
                             params = getOption("CONSTANTS_QUANTOGRAM")) {

  if (!is.numeric(sample_portion)) {
    stop("non-numeric sample portion")
  } else if (sample_portion > 1) {
    stop("sample_portion should be 1 or less")
  }

  original_quanta <- get_quantum(set, fofq = TRUE)
  results <- rep(list(NA), n_samples)

  decrease <- length(set) - floor(length(set) * sample_portion)

  multiple_peaks <- rep(NA, n_samples)

  for (n in 1:n_samples) {
    sample <- sample_bootstrap(set, decrease_by = decrease)
    sample_quantum <- cbind(sample_nr = n, get_quantum(sample, fofq = TRUE))
    number_of_peaks <- nrow(sample_quantum)
    if (number_of_peaks > 1) {
      multiple_peaks[n] <- TRUE
      sample_quantum$peak <- 1:number_of_peaks
    } else {
      multiple_peaks[n] <- FALSE
      sample_quantum$peak <- 1
    }
    results[[n]] <- sample_quantum
  }
  results_all <- do.call(rbind.data.frame, results)

  if (any(multiple_peaks)) {
    message(paste("There were multiple peaks in f(q) at ",
                  paste(original_quanta$q, collapse = ", "),
                  " -- bootstrap result might not be reasonable.",
                  sep = ""))
  }

  borders <- stats::quantile(results_all$q,
                             c((0 + confint / 2),
                               (1 - confint / 2)))
  p <- plot_bootstrap(results = results_all,
                      original_quanta = original_quanta,
                      borders = borders,
                      binwidth = params$STEP)
  p
  l <- list("plot" = p,
            "quanta" = original_quanta,
            "results" = results_all,
            "confidence interval" = borders)
  return(l)
}
