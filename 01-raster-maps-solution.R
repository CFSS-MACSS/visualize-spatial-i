library(tidyverse)
library(ggmap)
library(here)

# set default theme
theme_set(theme_minimal())

# load data
nyc_311 <- read_csv(file = here("data", "nyc-311.csv"))
glimpse(nyc_311)

# Obtain map tiles using ggmap for New York City
## store bounding box coordinates
nyc_bb <- c(
  left = -74.263045,
  bottom = 40.487652,
  right = -73.675963,
  top = 40.934743
)

nyc <- get_stamenmap(
  bbox = nyc_bb,
  zoom = 11
)

## plot the raster map
ggmap(nyc)

# Generate a scatterplot of complaints about sidewalk conditions
## initialize map
ggmap(nyc) +
  # add layer with scatterplot
  # use alpha to show density of points
  geom_point(
    data = filter(nyc_311, complaint_type == "Sidewalk Condition"),
    mapping = aes(
      x = longitude,
      y = latitude
    ),
    size = .25,
    alpha = .05
  )

# Generate a heatmap of complaints about sidewalk conditions
# Do you see any unusual patterns or clusterings?
## initialize the map
ggmap(nyc) +
  # add the heatmap
  stat_density_2d(
    data = filter(nyc_311, complaint_type == "Sidewalk Condition"),
    mapping = aes(
      x = longitude,
      y = latitude,
      fill = stat(level)
    ),
    alpha = .1,
    bins = 50,
    geom = "polygon"
  )

# Obtain map tiles for Roosevelt Island
roosevelt_bb <- c(
  left = -73.967121,
  bottom = 40.748700,
  right = -73.937080,
  top = 40.774704
)
roosevelt <- get_stamenmap(
  bbox = roosevelt_bb,
  zoom = 14
)

## plot the raster map
ggmap(roosevelt)

# Generate a scatterplot of food poisoning complaints
## initialize the map
ggmap(roosevelt) +
  # add a scatterplot layer
  geom_point(
    data = filter(nyc_311, complaint_type == "Food Poisoning"),
    mapping = aes(
      x = longitude,
      y = latitude
    ),
    alpha = 0.2
  )
