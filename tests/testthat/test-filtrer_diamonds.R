test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

# Crée df_test pour tests reproductibles
df_test <- tibble::tibble(
  cut = rep(c("Ideal", "Premium", "Good"), 3),
  color = rep(c("D", "E", "F"), each = 3),
  price = 100:108
)

test_that("filtrer_diamonds filtre correctement par couleur", {
  res <- filtrer_diamonds(df_test, color = "D")
  expect_true(all(res$color == "D"))
  expect_equal(nrow(res), 3)
})

test_that("filtrer_diamonds filtre correctement par cut", {
  res <- filtrer_diamonds(df_test, cut = "Ideal")
  expect_true(all(res$cut == "Ideal"))
  expect_equal(nrow(res), 3)
})

test_that("filtrer_diamonds retourne tout si aucun filtre", {
  res <- filtrer_diamonds(df_test)
  expect_equal(nrow(res), nrow(df_test))
})

test_that("filtrer_diamonds accepte plusieurs valeurs", {
  res <- filtrer_diamonds(df_test, cut = c("Ideal", "Good"))
  expect_true(all(res$cut %in% c("Ideal", "Good")))
  expect_equal(nrow(res), 6)
})
