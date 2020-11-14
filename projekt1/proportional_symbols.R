library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/proportional_symbols.svg",  width = 5, height = 6)

# plot municipalities (only borders are plotted)
plot(st_geometry(mtq), col="#f2efe9", border="black", bg = "lightblue1", 
     lwd = 0.5)
# plot population
propSymbolsLayer(
  x = mtq, 
  var = "POP", 
  inches = 0.25, 
  col = "brown4",
  legend.pos = "n",  
  legend.title.txt = "Total population",
  legend.values.rnd = -3 
)
# layout
layoutLayer(frame = FALSE, title = "",scale = FALSE)

dev.off()