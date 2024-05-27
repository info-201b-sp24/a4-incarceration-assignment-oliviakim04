library(ggplot2)
library(maps)
library(dplyr)

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true", stringsAsFactors = FALSE) %>%
  filter(year == 2016, !is.na(black_prison_pop)) %>%
  group_by(state) %>%
  summarize(sum = sum(black_prison_pop)) %>%
  mutate(state = state.name[match(state, state.abb)]) %>%
  mutate(state = tolower(state), total_state_black_pop = sum)


state_shape <- map_data("state") %>%
  rename(state = region) %>%
  left_join(data, by = "state")

ggplot(state_shape) + 
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = total_state_black_pop), 
    color = "white",
    linewidth = .1
  ) + 
  coord_map() + 
  scale_fill_continuous(low = "#132B43", high = "Red") +
  labs(fill = "# of Prisoners") + 
  labs(title = "Number of Black prisoner population in 2016") 
