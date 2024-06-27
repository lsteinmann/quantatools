#' Plot a Histogram of the Bootstrapped Samples
#'
#' Plot a Histogram of the bootstrapped samples
#' including lines for the confidence interval
#'
#' @param results result (list) of the bootstrap sampling process as returned by
#' `bootstrap_quanta()`, containing three lists: results = results of the
#' bootstrapped samples, quanta = original quanta, confidence interval = the
#' confidence interval.
#' @param title Title of the Plot
#' @param caption Caption of the Plot
#' @param binwidth binwidth of the histogram (by default set to STEP used
#' in global package options)
#'
#' @return A histogram with confidence intervals
#' @export
plot_bootstrap <- function(results,
                           title = "Bootstrapped Quanta",
                           caption = "",
                           binwidth = getOption("CONSTANTS_QUANTOGRAM")$STEP) {

  original_quanta <- results$quanta
  borders <- results$`confidence interval`

  subtitle <- paste("Original Quantum at ", paste(results$quanta$q, sep = ", "), sep = "")

  p <- ggplot2::ggplot(results$results, ggplot2::aes(x = .data$q)) +
    ggplot2::geom_histogram(binwidth = binwidth, position = "stack") +
    ggplot2::geom_vline(data = original_quanta,
                        ggplot2::aes(xintercept = .data$q),
                        colour = "blue", linetype = "dotted",
                        linewidth = 1) +
    ggplot2::geom_vline(xintercept = borders, colour = "red",
                        linetype = "dashed", linewidth = 1.5, alpha = 0.3) +
    ggplot2::labs(x = "quantum estimation", title = title,
                  caption = caption,
                  subtitle = subtitle) +
    ggplot2::scale_x_continuous(limits = c(0, 1)) +
    ggplot2::theme_minimal()
  return(p)
}
