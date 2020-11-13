# isopleth

library(sf)
library(cartography)
library(SpatialPosition)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

svg("fig/isopleth.svg", width = 6, height = 5)


# plot municipalities (only the backgroung color is plotted)
plot(st_geometry(mtq), col = NA, border = NA, bg = "lightblue1")
# plot isopleth map
smoothLayer(
  x = mtq, 
  var = 'POP',
  typefct = "exponential",
  span = 4000,
  beta = 2,
  nclass = 12,
  col = carto.pal(pal1 = 'brown.pal', n1 = 12),
  border = "grey",
  lwd = 0.1, 
  mask = mtq, 
  legend.values.rnd = -3,
  legend.title.txt = "Population\nPotential",
  legend.pos = "topright", 
  add=TRUE
)
# layout
layoutLayer(title = "Population Distribution in Martinique",
            sources = "Sources: Insee and IGN, 2018",
            author = paste0("cartography ", packageVersion("cartography")),
            frame = FALSE, north = FALSE, tabtitle = TRUE, scale = 5)

dev.off()