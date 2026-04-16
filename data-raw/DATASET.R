## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

#| eval: false
## code to prepare `DATASET` dataset goes here

# SOURCE : Le jeu de donnée diamonds a été chargé sur R à base du package ggplot2



#

library(readr)

diamonds <- read_csv("data-raw/diamonds.csv")

usethis::use_data(diamonds, overwrite = TRUE)



# si besoin ici, le code pour extraire une sous-partie du jeu de données
