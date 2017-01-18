library(ggplot2)
library(stringr)

forecast_viz <- function(obs_data){
  ggplot(obs_data, aes(x = date, y = value)) +
    geom_line()
}

obs_data <- read.csv("data/RodentsAsOfSep2015.csv")
forecast_data <- read.csv("data/PortalForecasts.csv")
total_counts <- obs_data %>%
  filter(period > 0) %>%
  group_by(yr, mo) %>%
  summarise(value = n())
total_counts$date <- as.Date(str_c(total_counts$yr, "-", total_counts$mo, "-", 1))

forecast_viz(total_counts)
