## Geração de Mapas no R ##

## Instalar os pacotes
install.packages("sp")
install.packages("sf")
install.packages("ggplot2")
install.packages("ggspatial")
install.packages('dplyr')

## Carregar os pacotes
library('sp')
library('sf')
library('ggplot2')
library('ggspatial')
library('dplyr')

## Ler o nosso shapefile no R!!

shp_br = st_read('Dados/shapefile_ibge.shp')
head(shp_br)


## Exploradinha
arrange(shp_br, desc(VarPerc))
arrange(shp_br, desc(Pop2022))
