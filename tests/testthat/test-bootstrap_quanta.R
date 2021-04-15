data(Erechtheion)
set <- Erechtheion$Measurement_m

test_that("error for non numeric value in sample portion", {
  expect_error(bootstrap_quanta(set = set, sample_portion = "börek"),
               "numeric")
})

test_that("returns list", {
  boots <- bootstrap_quanta(set = set)
  expect_equal(class(boots), "list")
})
