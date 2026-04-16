## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

#| eval: false
## code to prepare `DATASET` dataset goes here

# SOURCE : Le jeu de donnée diamonds a été chargé sur R à base du package ggplot2



library(ggplot2)
data(diamonds)


write.csv(diamant, "diamonds.csv", row.names = FALSE)

library(readr)
diamonds <- read_csv("C:/Users/hp/OneDrive/Bureau/M1 ECAP/S2 ECAP/R_avancé/Examen/diamonds.csv")



# si besoin ici, le code pour extraire une sous-partie du jeu de données
