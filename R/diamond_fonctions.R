#' Filtrer le jeu de données diamonds
#'
#' Cette fonction filtre le jeu de données selon la couleur et/ou la qualité de coupe.
#'
#' @param data Jeu de données (par défaut : diamonds)
#' @param cut Valeur(s) de coupe à sélectionner (optionnel)
#' @param color Valeur(s) de couleur à sélectionner (optionnel)
#'
#' @return Un data frame filtré
#'
#' @import dplyr
#' @importFrom ggplot2 diamonds
#'
#' @examples
#' # Filtrer uniquement les diamants de couleur D
#' filtrer_diamonds(diamonds, color = "D")
#'
#' # Filtrer les diamants de coupe Ideal et Premium
#' filtrer_diamonds(diamonds, cut = c("Ideal", "Premium"))
#'
filtrer_diamonds <- function(data = diamonds, cut = NULL, color = NULL){
  data |>
    dplyr::filter(
      (is.null(cut)   | cut   %in% .data$cut),
      (is.null(color) | color %in% .data$color)
    )
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
#'
#' @examples
#' # Calculer les stats du prix par couleur
#' calcul_stats(diamonds, "color", "price")
#'
#' # Calculer les stats du carat par type de coupe
#' calcul_stats(diamonds, "cut", "carat")
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
#' @examples
#' # Exemple complet :
#' stats <- calcul_stats(diamonds, "color", "price")
#' plot_stats(stats, "color")
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
