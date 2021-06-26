test_that("options have correct names", {
  options <- getOption("CONSTANTS_QUANTOGRAM")
  expect_equal(names(options), c("RNG_START", "RNG_END", "STEP", "Q_MIN"))
})
