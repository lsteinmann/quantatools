data("Erechtheion")
set <- Erechtheion$Measurement_m
results <- calculate_quantogram(set)

test_that("does not fail", {
  expect_type(plot_quantogram(results, title = "This is a Quantogram"), "list")
})

test_that("does not fail", {
  expect_error(plot_quantogram(c(1, 2, 3), title = "This is a Quantogram"))
})
