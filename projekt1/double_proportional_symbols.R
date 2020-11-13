# dotplot of Martinique population in 2015
library(sf)
library(cartography)
library(dplyr)
library(sp)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/double_proportional_symbols.svg", width = 6, height = 5)

plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "lightblue1", 
     lwd = 0.5)
# plot population
propTrianglesLayer(mtq, var1 ="ACT", var2 = "CHOM", legend.title.txt = NULL,
                   legend.var1.txt = "Active", legend.var2.txt = "Unemployed",
                   legend.style = "e", k = 0.05, legend.values.rnd = -2)

layoutLayer(
  title = "Employment on Martinique in 2015",
  tabtitle = TRUE,
  frame = FALSE,
  author = "cartography 2.1.3", 
  sources = "Sources: Insee and IGN, 2018", 
  scale = 5)

dev.off()
