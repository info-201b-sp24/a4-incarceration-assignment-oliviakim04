library(ggplot2)
library(dplyr)

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true", stringsAsFactors = FALSE)

data_filtered <- filter(data, data$year == 2016, !is.na(data$black_prison_pop), 
                       !is.na(data$white_prison_pop))

ggplot(data_filtered, aes(x = white_prison_pop, y = black_prison_pop, color = urbanicity)) +
  geom_point(size = 0.5) +
  guides(colour = guide_legend(title = "Urbanicity")) + 
  xlim(0, 6000) +
  ylim(0, 15000) +
  labs(title = "Black prisoners and White prisoner population in 2016", y = "Black prisoners", x = "White prisoners")