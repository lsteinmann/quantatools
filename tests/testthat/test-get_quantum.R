test_that("returns vector of numbers", {
  expect_equal(class(get_quantum(1, fofq = FALSE)),
               "numeric")
})

test_that("returns df ", {
  expect_equal(class(get_quantum(1, fofq = TRUE)),
               "data.frame")
})
