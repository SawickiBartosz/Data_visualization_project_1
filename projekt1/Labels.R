library(sf)
library(cartography)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/Labels.svg",  width = 5, height = 6)

# plot municipalities
plot(st_geometry(mtq), col = "#e4e9de", border = "black", 
     bg = "lightblue1", lwd = 0.5)
# plot labels
labelLayer(
  x = mtq, 
  txt = "LIBGEO", 
  col= "black", 
  cex = 0.7, 
  font = 4,
  halo = TRUE, 
  bg = "white", 
  r = 0.1, 
  overlap = FALSE, 
  show.lines = FALSE
)
# map layout
layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()