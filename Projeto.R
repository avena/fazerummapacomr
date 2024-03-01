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
# shp_mg = filter(shp_br, nam_stt == 'Minas Gerais')
# head(shp_mg)

shp_rs = filter(shp_br, nam_stt == 'Rio Grande do Sul')
head(shp_rs)


ggplot(data = shp_mg, aes(x = Pop2022, y = Pop2010)) + 
  geom_point() + 
  geom_line()


### Plotando os Mapas
# ggplot() + 
#   geom_sf(data = shp_mg, col = 'black', linewidth = 0.1, aes(fill = VarPerc)) + 
#   scale_fill_gradientn( colors = brewer.pal(name = "Spectral", n = 11)  ) + 
#   theme_bw() +
#   labs(title = 'Taxa de Crescimento Populacional em (%) - Minas Gerais', 
#        subtitle = 'Fonte: Censo 2022 - IBGE') +
#   annotation_north_arrow(location = 'tr') + 
#   annotation_scale() + 
#   theme(legend.position = 'bottom',
#         axis.text = element_text(size = 30),
#         plot.title = element_text(size = 25, hjust = 0.5),
#         plot.subtitle = element_text(size = 10, hjust = 0.5),
#         legend.key.size = unit(0.5, 'cm')
#         )

## plot para RS
ggplot() + 
  geom_sf(data = shp_rs, col = 'black', linewidth = 0.1, aes(fill = VarPerc)) + 
  scale_fill_gradientn( colors = brewer.pal(name = "Spectral", n = 11)  ) + 
  theme_bw() +
  labs(title = 'Taxa de Crescimento Populacional em (%) - Rio Grande do Sul', 
       subtitle = 'Fonte: Censo 2022 - IBGE') +
  annotation_north_arrow(location = 'tr') + 
  annotation_scale() + 
  theme(legend.position = 'bottom',
        axis.text = element_text(size = 30),
        plot.title = element_text(size = 25, hjust = 0.5),
        plot.subtitle = element_text(size = 10, hjust = 0.5),
        legend.key.size = unit(0.5, 'cm')
  )


## Exportar
# ggsave(filename = 'Resultados/tx_crescimento_mg_2022.jpeg',
#        width = 20,
#        height = 20,
#        units = 'in',
#        dpi = 300)



ggsave(filename = 'Resultados/tx_crescimento_rs_2022.jpeg',
       width = 20,
       height = 20,
       units = 'in',
       dpi = 300)