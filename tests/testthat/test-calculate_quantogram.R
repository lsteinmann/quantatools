x <- 0.37 * rep(seq(2, 6, 1), 2000)

test_that("returns df", {
  expect_equal(class(calculate_quantogram(x)), "data.frame")
})

test_that("gives true quantum", {
  quant <- calculate_quantogram(x)
  expect_equal(quant$q[which.max(quant$f_q)], 0.185)
})

test_that("params tested",{
  expect_error(calculate_quantogram(c(1,2,3,4), param = c("null")))
})


