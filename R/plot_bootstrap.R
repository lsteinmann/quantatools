#' Plots a Histogram of the bootstraped samples (within bootstrap_quanta)
#'
#' Plots a Histogram of the bootstraped samples (within bootstrap_quanta)
#' including lines for the confidence interval
#'
#' @param results result of the bootstrap sampling process within
#' `bootstrap_quanta()`
#' @param original_quanta original quanta as returned by `get_quantum()`
#' @param borders confidence interval
#' @param binwidth binwidth of the histogram (by default set to STEP used
#' in global package options)
#'
#' @return
#' @export
plot_bootstrap <- function(results, original_quanta, borders,
                           binwidth = getOption("CONSTANTS_QUANTOGRAM")$STEP) {

  subtitle <- paste("Peak at ", unique(results$q), sep = "")

  p <- ggplot2::ggplot(results, ggplot2::aes(x = q)) +
    ggplot2::geom_histogram(binwidth = binwidth, position = "stack") +
    ggplot2::geom_vline(data = original_quanta,
                        ggplot2::aes(xintercept = q),
                        colour = "blue", linetype = "dotted",
                        size = 1) +
    ggplot2::geom_vline(xintercept = borders, colour = "red",
                        linetype = "dashed", size = 1.5, alpha = 0.3) +
    ggplot2::labs(x = "quantum estimation", title = "Bootstraped Quanta",
                  subtitle = subtitle) +
    ggplot2::scale_x_continuous(limits = c(0, 1)) +
    ggplot2::theme_minimal()
  return(p)
}
