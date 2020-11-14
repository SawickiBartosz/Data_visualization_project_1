library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("maps_with_legends/fig/colorized_proportional_symbols_continiues.svg",  width = 5, height = 6)

# Plot the municipalities
plot(st_geometry(mtq), col="darkseagreen3", border="black",  
     bg = "lightblue1", lwd = 0.5)
# Plot symbols with choropleth coloration
propSymbolsChoroLayer(
  x = mtq, 
  var = "POP", 
  border = "grey50",
  lwd = 1,
  legend.var.pos = "topright", 
  legend.var.title.txt = "Population",
  var2 = "MED",
  method = "equal", 
  nclass = 4, 
  col = carto.pal(pal1 = "sand.pal", n1 = 4),
  legend.var2.values.rnd = -2,
  legend.var2.pos = "left", 
  legend.var2.title.txt = "Median\nIncome\n(in euros)",
  legend.var.values.rnd = -3
) 
# layout
layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()
