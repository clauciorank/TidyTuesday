library(dplyr)
library(ggplot2)
library(showtext)

data <- read.csv('data/babynames.csv')

names <- c('Leia', 'Luke')

data_filtered <- data %>% filter(name %in% names & year > 1966 & year <= 1993)

font_add(family = 'starjedi', regular = 'data/Starjedi.ttf')
showtext_auto()

leia <-
data_filtered %>% 
  filter(name == 'Leia') %>% 
  group_by(name, year) %>% 
  summarise(n = sum(n)) %>% 
  ggplot(aes(year, n, color = name, group = 1))+
  geom_vline(xintercept = c(1977, 1980, 1983), linetype = 2, color = 'white')+
  geom_line(color = '#a56095')+
  geom_point(size = 3)+
  annotate(geom = 'text', label = 'The Empire Strikes Back', x = 1980.5, y = 67, angle = 90, color = 'white', size = 3.5)+
  annotate(geom = 'text', label = 'Return of the Jedi', x = 1982.5, y = 50, angle = 90, color = 'white', size = 3.5)+
  labs(title = 'Leia', y = 'Number of babies with the name', x = 'Year')+
  theme_minimal()+
  theme(plot.title = element_text(hjust = .5, color = 'white', size = 14, family = 'starjedi'), legend.position = 'none',
        plot.background = element_rect(fill = 'black'),
        panel.grid.minor =  element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(size = 0.1),
        axis.text = element_text(size = 12, color = 'white', family = 'starjedi'))

luke <- 
data_filtered %>% 
  filter(name == 'Luke') %>% 
  group_by(name, year) %>% 
  summarise(n = sum(n)) %>% 
  ggplot(aes(year, n, color = name, group = 1))+
  geom_vline(xintercept = c(1977, 1980, 1983), linetype = 2, color = 'white')+
  geom_line(color = '#1c5092')+
  geom_point(size = 3, color = '#049cf2')+
  annotate(geom = 'text', label = 'A New Hope', x = 1976.5, y = 3000, angle = 90, color = 'white', size = 3.5)+
  labs(title = 'Luke', y = 'Number of babies with the name', x = 'Year')+
  theme_minimal()+
  theme(plot.title = element_text(hjust = .5, color = 'white', size = 14, family = 'starjedi'), legend.position = 'none',
        plot.background = element_rect(fill = 'black'),
        panel.grid.minor =  element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(size = 0.1),
        axis.text = element_text(size = 12, color = 'white', family = 'starjedi'))


title <- cowplot::ggdraw() + 
          cowplot::draw_label("Star Wars First 3 Released Films impact in Baby Names", 
                              fontface='bold', color = 'white', fontfamily = 'starjedi')+
           theme(plot.background = element_rect(fill ='black'))

cowplot::plot_grid(title, leia, luke, nrow = 3, rel_heights = c(0.1,.45,.45))







