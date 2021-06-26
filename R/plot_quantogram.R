#' Plot Cosine Quantogram
#'
#' @param results Resulting data.frame returned by calculate_quantogram(...)
#' @param title Title of the plot
#'
#' @return a plot object (ggplot2)
#' @export
#'
#' @examples
#' data("Erechtheion")
#' set <- Erechtheion$Measurement_m
#' results <- calculate_quantogram(set)
#' plot_quantogram(results, title = "This is a Quantogram")
plot_quantogram <- function(results = NULL,
                            title = "Quantogram") {

  quantum <- results[which(results$f_q == max(results$f_q)), ]

  if (nrow(quantum) > 1) {
    message("Recognised multiple candidates for quantum (",
            paste0(quantum$q, collapse = " or "),
            "). The highest value was selected.")
    quantum <- quantum$q[which.max(quantum$q)]
  } else {
    quantum <- quantum$q
  }

  subtitle <- paste0("Peak in quantum = ", quantum)

  p <- ggplot2::ggplot(results, ggplot2::aes(x = .data$q, y = .data$f_q)) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::geom_hline(yintercept = 0, linetype = "dashed") +
    ggplot2::geom_vline(xintercept = quantum, colour = "#BB0000",
                        linetype = "dashed") +
    ggplot2::scale_x_continuous(breaks = seq(0, 1, 0.10)) +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = title, subtitle = subtitle,
                  x = "quantum",
                  y = "quantogram.score (f(q))")
  return(p)
}
