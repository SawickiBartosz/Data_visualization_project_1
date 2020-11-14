# dotplot of Martinique population in 2015
library(sf)
library(cartography)
library(sp)

# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/dotplot.svg", width = 6, height = 5)

plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "lightblue1", 
     lwd = 0.5)
# plot population
dotDensityLayer(mtq, var ="POP", legend.txt = "1 dot represents 500 people", legend.cex = 0.8, legend.frame = FALSE, n=500)

layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()
