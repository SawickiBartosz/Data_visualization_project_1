library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)
# plot municipalities (only borders are plotted)
plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "#aad3df", 
     lwd = 0.5)
# plot population
choroLayer(
  x = mtq, 
  var = "POP",
  col = carto.pal("orange.pal", n1 = 7),
  legend.pos = "topright",  
  legend.title.txt = "Total population"
)
# layout
layoutLayer(title = "Population Distribution in Martinique",
            frame = FALSE, north = FALSE, tabtitle = TRUE)
# north arrow
north(pos = "topleft")