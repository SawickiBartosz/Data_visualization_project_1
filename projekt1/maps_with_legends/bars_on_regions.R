# bars_on_regions

library(cartography)
library(sf)
library(ggplot2)
library(tidyr)
library(ggthemes)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

df <- pivot_longer(mtq, cols = 4:7, names_to = "category", values_to = "value")

svg('maps_with_legends/fig/plain_map.svg', width = 5, height = 6)
plot(st_geometry(mtq), col = "#e4e9de", border = "darkseagreen4", 
     bg = "lightblue1", lwd = 0.5)
dev.off()
barplots <- ggplot(df) +
  geom_bar(aes(x = category, y = value, col = category, fill = category, width = 0.75), stat = 'identity')+
  facet_wrap(~LIBGEO) +
  theme_tufte()

ggsave("maps_with_legends/fig/barplots.svg", device = "svg")
