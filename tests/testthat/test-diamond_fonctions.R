test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("filtrer_diamonds filtre correctement par couleur", {
  res <- filtrer_diamonds(df_test, color = "D")
  expect_true(all(res$color == "D"))
})

test_that("filtrer_diamonds filtre correctement par cut", {
  res <- filtrer_diamonds(df_test, cut = "Ideal")
  expect_true(all(res$cut == "Ideal"))
})

test_that("filtrer_diamonds retourne tout si aucun filtre", {
  res <- filtrer_diamonds(df_test)
  expect_equal(nrow(res), nrow(df_test))
})
