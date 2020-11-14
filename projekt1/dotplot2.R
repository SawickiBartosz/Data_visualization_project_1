# Dotplot

library(cartography)
library(sp)
library(tmap)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

towers <- read.csv("Martinique_cellphones_towers.csv")

towers_sp <- st_as_sf(x = towers, 
                          coords = c("lon", "lat"),
                          crs = "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")


tmap_mode("plot")


map <- tm_shape(mtq) +tm_layout(bg.color = "lightblue1") + tm_polygons(col = "#f2efe9",) + 
  tm_shape(towers_sp) + tm_dots(col = "red") + tm_legend( frame = FALSE, frame.lwd = 0)+
  tm_layout(asp = 5/6, outer.margins = c(0.2,0.1,0.1,0.1))

tmap_save(map, filename = "fig/dotplot2_new.svg", width = 5, height = 6)