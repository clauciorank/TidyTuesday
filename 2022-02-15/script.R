
colors = c('#fdfdfd', '#ecb456', '#e3bbb0', '#c90a32',
                 '#291c54', '#7a543f', '#737373', '#333232', '#000000')

levels = c("UNDER - 10,000", "10,000 - 25,000", "25,000 - 50,000", "50,000 - 100,000",
                "200,000 - 300,000", "300,000 - 500,000",  "500,000 - 600,000", "600,000 - 750,000",
                "750,000 AND OVER")

map <- sf::read_sf('./usmap')

data <- read.csv('data.csv') |>
            dplyr::left_join(map, by = c('State' = 'STATE'))

library(ggplot2)
library(showtext)

font_add(family = 'mandator', regular = './font/MANDATOR.ttf')
showtext_auto()


ggplot(data) +
    geom_sf(aes(geometry = geometry, fill = factor(Population, levels = levels)), color = 'black')+
    scale_fill_manual(values = colors) +
    labs(title = stringr::str_wrap('RELATIVE NEGRO POPULATION OF THE STATES OF THE UNITED STATES',46),
        fill = '')+
    theme_void()+
    theme(legend.position = 'bottom', plot.title = element_text(hjust = 0.5),
            panel.background = element_rect(fill = '#dbd1c0', color = '#dbd1c0'),
            plot.background =  element_rect(fill = '#dbd1c0', color = '#dbd1c0'),
            panel.border = element_blank(),
            text = element_text(family = 'mandator')
            )










