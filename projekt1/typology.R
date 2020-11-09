library(sf)
library(cartography)
# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)

# plot municipalities (only the backgroung color is plotted)
plot(st_geometry(mtq), col = "white", border = NA, bg = "lightblue1")
# plot administrative status
typoLayer(
  x = mtq, 
  var="STATUS",  
  col = c("aquamarine4", "yellow3","wheat"), 
  lwd = .7,
  legend.values.order = c("Prefecture",
                          "Sub-prefecture", 
                          "Simple municipality"),
  legend.pos = "left",
  legend.title.txt = "", 
  add = TRUE
)
#  plot municipalities
plot(st_geometry(mtq), lwd = 0.5, border = "grey20", add = TRUE, lty = 3)
# title, source, author
layoutLayer(title = "Administrative Status",
            north = FALSE, tabtitle = TRUE, postitle = "right", 
            col = "white", coltitle = "black") 
# north arrow
north(pos = "topleft")