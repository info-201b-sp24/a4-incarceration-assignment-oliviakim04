library(ggplot2)
library(patchwork)
library(dplyr)

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true", stringsAsFactors = FALSE)

data_filtered <- filter(data, data$county_name == "Los Angeles County", !is.na(data$black_prison_pop), 
                        !is.na(data$aapi_prison_pop), !is.na(data$white_prison_pop), !is.na(data$native_prison_pop))

p1 <- ggplot() +
  geom_line(aes(x=data_filtered$year, y = data_filtered$black_prison_pop)) +
  labs(title = "Black in LA", y = "prisoners", x = "years") + 
  ylim(0, 27000)

p2 <- ggplot(data_filtered, aes(x=data_filtered$year, y = data_filtered$aapi_prison_pop)) +
  geom_line() +
  labs(title = "AAPI in LA", y = "prisoners", x = "years") + 
  ylim(0, 27000)

p3 <- ggplot() +
  geom_line(aes(x=data_filtered$year, y = data_filtered$white_prison_pop)) +
  labs(title = "White in LA", y = "prisoners", x = "years") + 
  ylim(0, 27000)

p4 <- ggplot() +
  geom_line(aes(x=data_filtered$year, y = data_filtered$native_prison_pop)) + 
  labs(title = "Native in LA", y = "prisoners", x = "years") + 
  ylim(0, 27000)

p5 <- ggplot() +
  geom_line(aes(x=data_filtered$year, y = data_filtered$other_race_prison_pop)) + 
  labs(title = "Other in LA", y = "prisoners", x = "years") + 
  ylim(0, 27000)

p6 <- ggplot() +
  geom_line(aes(x=data_filtered$year, y = data_filtered$latinx_prison_pop)) + 
  labs(title = "Latinx in LA", y = "prisoners", x = "years") + 
  ylim(0, 27000)

(p1 | p2 | p3) / (p4 | p5 | p6)
