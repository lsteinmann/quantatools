data(Erechtheion)
set <- Erechtheion$Measurement_m

test_that("error for non numeric value in sample portion", {
  expect_error(bootstrap_quanta(set = set, sample_portion = "börek"),
               "numeric")
})

test_that("error for sample portion above 1", {
  expect_error(bootstrap_quanta(set = set, sample_portion = 2),
               "less")
})


test_that("returns list", {
  expect_message(bootstrap_quanta(set = c(1,2,3,4), sample_portion = 0.75),
                 "multiple")
})

test_that("returns list", {
  boots <- bootstrap_quanta(set = set)
  expect_equal(class(boots), "list")
})
