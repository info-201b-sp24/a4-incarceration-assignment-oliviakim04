library("dplyr")

data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true", stringsAsFactors = FALSE)

# total incarcerated population in 2016 (too many NA values for years after 2016)
total_incarcerated <- select(data, year, total_prison_pop) %>%
  filter(year == 2016, !is.na(total_prison_pop)) %>%
  summarize(sum = sum(total_prison_pop)) %>%
  pull(sum) %>%
  tail(1)
total_incarcerated 

# total black prisoners in 2016
total_black <- select(data, year, black_prison_pop) %>%
  filter(year == 2016, !is.na(black_prison_pop)) %>%
  summarize(sum = sum(black_prison_pop)) %>%
  pull(sum) %>%
  tail(1)
total_black

# total white prisoners in 2016 
total_white <- select(data, year, white_prison_pop) %>%
  filter(year == 2016, !is.na(white_prison_pop)) %>%
  summarize(sum = sum(white_prison_pop)) %>%
  pull(sum) %>%
  tail(1)
total_white

# total female prisoners in 2016
total_female <- select(data, year, female_prison_pop) %>%
  filter(year == 2016, !is.na(female_prison_pop)) %>%
  summarize(sum = sum(female_prison_pop)) %>%
  pull(sum) %>%
  tail(1)
total_female

# total male prisoners in 2016
total_male <- select(data, year, male_prison_pop) %>%
  filter(year == 2016, !is.na(male_prison_pop)) %>%
  summarize(sum = sum(male_prison_pop)) %>%
  pull(sum) %>%
  tail(1)
total_male
