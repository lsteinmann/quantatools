
x <- 0.37 * rep(seq(2, 6, 1), 2000)
#plot_quantogram(calculate_quantogram(x), "assd")


test_that("returns df", {
  expect_equal(class(calculate_quantogram(x)), "data.frame")
})

test_that("gives true quantum", {
  quant <- calculate_quantogram(x)
  expect_equal(quant$q[which.max(quant$f_q)], 0.185)
})



