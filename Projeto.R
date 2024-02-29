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
library('RColorBrewer')

## Ler o nosso shapefile no R!!

shp_br = st_read('Dados/shapefile_ibge.shp')
head(shp_br)


## Exploradinha
arrange(shp_br, desc(VarPerc))
arrange(shp_br, desc(Pop2022))

## Minas Gerais
shp_mg = filter(shp_br, nam_stt == 'Minas Gerais')
head(shp_mg)


ggplot(data = shp_mg, aes(x = Pop2022, y = Pop2010)) + 
  geom_point() + 
  geom_line()


### Plotando os Mapas
ggplot() + 
  geom_sf(data = shp_mg, col = 'black', linewidth = 0.1, aes(fill = VarPerc)) + 
  scale_fill_gradientn( colors = brewer.pal(name = "Spectral", n = 11)  )
