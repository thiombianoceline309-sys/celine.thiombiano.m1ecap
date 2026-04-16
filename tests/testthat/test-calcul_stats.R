test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("calcul_stats produit les bonnes colonnes", {
  stats <- calcul_stats(df_test, "color", "price")
  expect_true(all(c("moyenne", "mediane", "maximum") %in% names(stats)))
})

test_that("calcul_stats calcule correctement la moyenne", {
  stats <- calcul_stats(df_test, "color", "price")
  expect_equal(
    stats$moyenne[stats$color == "D"],
    mean(df_test$price[df_test$color == "D"])
  )
})

test_that("calcul_stats fonctionne avec une autre variable numérique", {
  stats <- calcul_stats(df_test, "cut", "carat")
  expect_equal(
    stats$maximum[stats$cut == "Premium"],
    max(df_test$carat[df_test$cut == "Premium"])
  )
})

