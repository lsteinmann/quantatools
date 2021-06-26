data("Erechtheion")

test_that("returns vector of same length", {
  errors <- calculate_error(Erechtheion$Measurement_m,
                          get_quantum(Erechtheion$Measurement_m))
  expect_equal(length(errors), length(Erechtheion$Measurement_m))
})

test_that("returns vector of length 1", {
  error <- calculate_error(Erechtheion$Measurement_m,
                           get_quantum(Erechtheion$Measurement_m),
                           mean = TRUE)
  expect_length(length(error), 1)
})

test_that("is same mean", {
  errors <- calculate_error(Erechtheion$Measurement_m,
                            get_quantum(Erechtheion$Measurement_m))
  mean_error <- calculate_error(Erechtheion$Measurement_m,
                                get_quantum(Erechtheion$Measurement_m),
                           mean = TRUE)
  expect_equal(mean_error, mean(errors))
})
