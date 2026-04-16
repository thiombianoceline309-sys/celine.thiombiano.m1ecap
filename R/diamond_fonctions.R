#' Filtrer le jeu de données diamonds
#' @param data tibble diamonds
#' @param cut filtre coupe (NULL = tout)
#' @param color filtre couleur (NULL = tout)
#' @return tibble filtré
#' @export
filtrer_diamonds <- function(data = diamonds, cut = NULL, color = NULL) {
  result <- data

  if (!is.null(cut)) {
    result <- dplyr::filter(result, cut %in% !!cut)
  }

  if (!is.null(color)) {
    result <- dplyr::filter(result, color %in% !!color)
  }

  result
}



#' Calculer des statistiques groupées
#'
#' @param data Jeu de données
#' @param group_var Variable de regroupement (ex : "color")
#' @param numeric_var Variable numérique (ex : "price")
#'
#' @return Un tableau avec moyenne, médiane et maximum
#'
#' @import dplyr
#' @import stats
#'
calcul_stats <- function(data, group_var, numeric_var){
  data |>
    dplyr::group_by(dplyr::across(dplyr::all_of(group_var))) |>
    dplyr::summarise(
      moyenne = mean(.data[[numeric_var]], na.rm = TRUE),
      mediane = median(.data[[numeric_var]], na.rm = TRUE),
      maximum = max(.data[[numeric_var]], na.rm = TRUE),
      .groups = "drop"
    )
}




#' Graphique ggplot2 basé sur les statistiques groupées
#'
#' @param stats_table Tableau produit par calcul_stats()
#' @param group_var Nom de la variable de regroupement
#'
#' @return Un graphique ggplot2
#'
#' @import ggplot2
#'
#'
plot_stats <- function(stats_table, group_var){
  ggplot2::ggplot(stats_table, ggplot2::aes(x = .data[[group_var]], y = moyenne)) +
    ggplot2::geom_col(fill = "#2C7BB6") +
    ggplot2::labs(
      title = paste("Moyenne par", group_var),
      x = group_var,
      y = "Moyenne"
    ) +
    ggplot2::theme_minimal()
}
