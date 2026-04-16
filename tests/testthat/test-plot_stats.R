test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("plot_stats renvoie un objet ggplot", {
  stats <- calcul_stats(df_test, "color", "price")
  p <- plot_stats(stats, "color")
  expect_s3_class(p, "ggplot")
})

test_that("plot_stats utilise bien la variable groupée", {
  stats <- calcul_stats(df_test, "color", "price")
  p <- plot_stats(stats, "color")
  expect_true("moyenne" %in% names(p$data))
})
