#' Plot and calculate SLS results
#'
#' @param x numeric vector of measurement values
#' @param params
#' @param title
#'
#' @return
#' @export
#'
#' @examples
selective_least_squares <- function(x,
                                    title = "...",
                                    params = getOption("CONSTANTS_SLS")) {

  all_quanta <- seq(params$SLS_RNG_START, params$SLS_RNG_END, params$SLS_STEP)
  quanta_pairs <- utils::combn(all_quanta, params$SLS_MAX_N_QUANTA)

  scores <- as.data.frame(matrix(nrow = ncol(quanta_pairs),
                                 ncol = 3))
  colnames(scores) <- c("quantum_1", "quantum_2", "score")

  for (i in seq_len(ncol(quanta_pairs))) {
    quantum_1 <- quanta_pairs[1, i]
    quantum_2 <- quanta_pairs[2, i]
    score <- calculate_sls(measurements = x,
                           quanta = c(quantum_1,
                                      quantum_2))
    scores[i, ] <- c(quantum_1, quantum_2, score)
  }

  scores$new_score <- 1 / score ^ 2

  p <- ggplot2::ggplot(scores, ggplot2::aes(x = quantum_1, y = quantum_2,
                                            col = new_score,
                                            size = new_score)) +
    ggplot2::geom_point() +
    ggplot2::theme(legend.position = "none") +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = title)

  sls_list <- list("plot" = p,
                   "scores" = scores)
  p
  return(sls_list)
}
