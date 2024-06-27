data("Erechtheion")
bootstr <- bootstrap_quanta(Erechtheion$Measurement_m)

test_that("plot produced", {
  p <- plot_bootstrap(bootstr, caption = "test")
  expect_equal(p$labels$caption, "test")
})

test_that("caption empty", {
  p <- plot_bootstrap(bootstr)
  expect_equal(p$labels$caption, "")
})


test_that("peak in subtitle", {
  p <- plot_bootstrap(bootstr)
  expect_true(grepl(bootstr$quanta$q, p$labels$subtitle))
})

