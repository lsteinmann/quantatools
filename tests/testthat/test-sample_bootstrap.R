x <- 1:100
sample_of_x <- sample_bootstrap(x, decrease_by = 10)
length(sample_of_x)

test_that("returns less", {
  x <- 1:100
  expect_lt(length(sample_bootstrap(x, decrease_by = 10)), length(x))
})

test_that("returns same length", {
  x <- 1:100
  expect_equal(length(sample_bootstrap(x)), length(x))
})
