library(tidyverse)
library(ggmap)
library(here)

# set default theme
theme_set(theme_minimal())

# load data
nyc_311 <- read_csv(file = here("data", "nyc-311.csv"))
glimpse(nyc_311)

# Obtain map tiles using ggmap for New York City


# Generate a scatterplot of complaints about sidewalk conditions


# Generate a heatmap of complaints about sidewalk conditions
# Do you see any unusual patterns or clusterings?


# Obtain map tiles for Roosevelt Island


# Generate a scatterplot of food poisoning complaints

