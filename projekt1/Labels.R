library(sf)
library(cartography)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/Labels.svg", width = 6, height = 5)

# plot municipalities
plot(st_geometry(mtq), col = "#e4e9de", border = "darkseagreen4", 
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
layoutLayer(
  title = "Municipalities of Martinique", 
  sources = "Sources: Insee and IGN, 2018",  
  author = paste0("cartography ", packageVersion("cartography")), 
  frame = FALSE,
  tabtitle = TRUE, 
  scale = 5
) 

dev.off()