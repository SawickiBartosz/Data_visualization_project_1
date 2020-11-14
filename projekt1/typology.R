library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/typology.svg",  width = 5, height = 6)

# plot municipalities (only the backgroung color is plotted)
plot(st_geometry(mtq), col = "white", border = "black", bg = "lightblue1")
# plot administrative status
typoLayer(
  x = mtq, 
  var="STATUS",  
  col = c('#7570b3','#1b9e77','#d95f02'), 
  lwd = .7,
  legend.values.order = c("Prefecture",
                          "Sub-prefecture", 
                          "Simple municipality"),
  legend.pos = "n",
  legend.title.txt = "", 
  add = TRUE
)
#  plot municipalities
plot(st_geometry(mtq), lwd = 0.5, border = "grey20", add = TRUE, lty = 3)
# title, source, author
layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()