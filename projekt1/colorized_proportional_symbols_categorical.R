library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)
# Plot the municipalities
plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "#aad3df", 
     lwd = 0.5)
# Plot symbols with choropleth coloration
propSymbolsTypoLayer(
  x = mtq, 
  var = "POP", 
  inches = 0.5,
  symbols = "square",
  border = "white",
  lwd = .5,
  legend.var.pos = "topright", 
  legend.var.title.txt = "Population",
  var2 = "STATUS",
  legend.var2.values.order = c("Prefecture", "Sub-prefecture", 
                               "Simple municipality"),
  col = carto.pal(pal1 = "multi.pal", n1 = 3),
  legend.var2.pos = c(685000, 1607000), 
  legend.var2.title.txt = "Administrative\nStatus"
) 
# layout
layoutLayer(title="Population Distribution in Martinique",
            scale = 5, tabtitle = TRUE, frame = FALSE)
# north arrow
north(pos = "topleft")
