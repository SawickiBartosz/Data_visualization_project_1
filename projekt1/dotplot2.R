# Dotplot

library(cartography)
library(sp)
library(dplyr)
library(tmap)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

towers <- read.csv("Martinique_cellphones_towers.csv")

tmap_mode("plot")


map <- tm_shape(mtq) +tm_layout(bg.color = "lightblue1") + tm_polygons(col = "#f2efe9",) + 
  tm_shape(towers_sp) + tm_dots(col = "red") + tm_legend( frame = FALSE, frame.lwd = 0)+
  tm_layout(asp = 8/5, outer.margins = c(0.2,0.1,0.1,0.1))

tmap_save(map, filename = "fig/dotplot2.svg",height = 5, width = 6)