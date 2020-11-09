library(cartography)
library(sf)

plot(st_geometry(world))
propSymbolsLayer(world,var = "pop",
                 col = "#756bb1", 
                 legend.pos = c(-180,-50),
                 legend.values.rnd = -4, 
                 legend.title.txt = "Population by countries")
