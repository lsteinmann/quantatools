data("Erechtheion")
set <- Erechtheion$Measurement_m
results <- calculate_quantogram(set)

test_that("does not fail", {
  expect_type(plot_quantogram(results, title = "This is a Quantogram"), "list")
})

test_that("does not fail", {
  expect_error(plot_quantogram(c(1, 2, 3), title = "This is a Quantogram"))
})


set <- seq(0, 1, 0.1)

test_that("informs of multiple quanta", {
  expect_message(
    plot_quantogram(calculate_quantogram(set, unround = FALSE)),
    "multiple"
    )
})
