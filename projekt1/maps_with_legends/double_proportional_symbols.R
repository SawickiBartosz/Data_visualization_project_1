# dotplot of Martinique population in 2015
library(sf)
library(cartography)
library(sp)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("maps_with_legends/fig/double_proportional_symbols.svg",  width = 5, height = 6)

plot(st_geometry(mtq), col="#f2efe9", border="black", bg = "lightblue1", 
     lwd = 0.5)
# plot population
propTrianglesLayer(mtq, var1 ="ACT", var2 = "CHOM", legend.title.txt = NULL,
                   legend.var1.txt = "Active", legend.var2.txt = "Unemployed",
                   legend.style = "e", k = 0.05, legend.values.rnd = -2,
                   legend.pos = "topright")

layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()
