library(sf)
library(cartography)


# path to the geopackage file embedded in cartography
path_to_gpkg <- system.file("gpkg/mtq.gpkg", package="cartography")
# import to an sf object
mtq <- st_read(dsn = path_to_gpkg, quiet = TRUE)
# path to the csv file embedded in cartography
path_to_csv <- system.file("csv/mob.csv", package="cartography")
# import to a data.frame
mob <- read.csv(path_to_csv)
# select workplaces with administrative status = Prefecture or Sub-prefecture
mob <- mob[mob$sj != "Simple municipality",]

# create an sf object of links
mtq_mob <- getLinkLayer(
  x = mtq, 
  xid = "INSEE_COM", 
  df = mob, 
  dfid = c("i","j")
)


svg("maps_with_legends/fig/flows.svg", width = 5, height = 6)


# plot municipalities
plot(st_geometry(mtq), col="#f2efe9", border="#b38e43", bg = "lightblue1", 
     lwd = 0.5)
# plot graduated links
gradLinkTypoLayer(
  x = mtq_mob, 
  xid = c("i", "j"),
  df = mob,
  dfid = c("i","j"),
  var = "fij", 
  breaks = c( 100,  500, 1200, 2500, 4679.0),
  lwd = c(1,4,8,16),
  legend.var.pos = "left",
  legend.var.title.txt = "Nb. of\nCommuters",
  var2 = "sj", 
  col = c("grey25", "red4"),
  legend.var2.title.txt = "Workplace",
  legend.var2.pos = "topright"
) 
# map layout
layoutLayer(frame = FALSE, title = "",scale = FALSE)


dev.off()