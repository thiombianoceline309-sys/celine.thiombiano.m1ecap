test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("calcul_stats fonctionne avec données valides", {
  result <- calcul_stats(diamonds, "color", "price")
  expect_true("moyenne" %in% names(result))
  expect_equal(nrow(result), 8)  # 8 couleurs D-Z
})

test_that("calcul_stats gère les erreurs", {
  expect_error(calcul_stats(diamonds, "couleur_inexistante", "price"))
})
