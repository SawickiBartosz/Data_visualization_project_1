library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/choropleth.svg", width = 6, height = 5)

# plot municipalities (only borders are plotted)
plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "lightblue1", 
     lwd = 0.5)
# plot population
choroLayer(
  x = mtq, 
  var = "POP",
  col = carto.pal("orange.pal", n1 =6),
  legend.pos = "topright",  
  legend.title.txt = "Total population",
  add = TRUE,
  legend.values.rnd = -3
)
# layout
layoutLayer(title="Population Distribution in Martinique", 
            author = "cartography 2.1.3", 
            sources = "Sources: Insee and IGN, 2018", 
            scale = 5, tabtitle = TRUE, frame = FALSE)

dev.off()
