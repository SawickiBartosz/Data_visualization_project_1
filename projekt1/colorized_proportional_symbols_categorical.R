library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/colorized_proportional_symbols_categorical.svg",  width = 5, height = 6)


# Plot the municipalities
plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "lightblue1", 
     lwd = 0.5)
# Plot symbols with choropleth coloration
propSymbolsTypoLayer(
  x = mtq, 
  var = "POP", 
  inches = 0.5,
  symbols = "square",
  border = "white",
  lwd = .5,
  legend.var.pos = "n", 
  legend.var.title.txt = "Population",
  var2 = "STATUS",
  legend.var2.values.order = c("Prefecture", "Sub-prefecture", 
                               "Simple municipality"),
  col = c('#7570b3','#1b9e77','#d95f02'), 
  legend.var2.pos = "n", 
  legend.var2.title.txt = "Administrative\nStatus",
  legend.values.rnd = -3
) 
# layout
layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()
