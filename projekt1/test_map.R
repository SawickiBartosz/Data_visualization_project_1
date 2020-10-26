library(mapdata)
library(maps)
library(dplyr)
library(ggplot2)
library(tmap)
library(spData)
library(spDataLarge)

world_population <- read.csv("WPP2019_TotalPopulationBySex.csv")
countries <- world_population %>% filter(Time==2019, LocID<900)
countries$Location[225] = "USA"
countries$Location[173] = "Russia"
countries$Location[102] = "Iran"
countries$Location[229] = "Venezuela"
countries$Location[25] = "Bolivia"
countries$Location[222] = "UK"
countries$Location[57] = "Czech Republic"
countries$Location[206] = "Syria"
countries$Location[223] = "Tanzania"






# how to create simple world map
world <- map_data("world")
ggplot() + geom_polygon(data = world,aes(x=long, y = lat,fill=region, group = group), color = "white" )+ 
  coord_fixed(1.3)+
  guides(fill=FALSE)


world_pop <- world %>% left_join(countries, by = c( "region" = "Location" ))

# world map with population density
world_pop %>% 
  ggplot() + 
  geom_polygon(aes(x=long, y = lat,fill = PopDensity, group = group), color = "white" )+ 
  coord_fixed(1.3)+
  scale_fill_gradientn(colors =c('#ffffcc','#c7e9b4','#7fcdbb','#41b6c4','#1d91c0','#225ea8','#0c2c84'), trans = "log10")

# zoom to see Europe

world_pop %>% 
  ggplot() + 
  geom_polygon(aes(x=long, y = lat,fill = PopDensity, group = group), color = "white" )+ 
  coord_fixed(xlim = c(-10,40), ylim = c(35,71),ratio = 1.3)+
  scale_fill_gradientn(colors =c('#ffffcc','#c7e9b4','#7fcdbb','#41b6c4','#1d91c0','#225ea8','#0c2c84'), trans = "log10")



data(World, metro, rivers, land)

tmap_mode("view")
pal8 <- c("#33A02C", "#B2DF8A", "#FDBF6F", "#1F78B4", "#999999", "#E31A1C", "#E6E6E6", "#A6CEE3")
tm_shape(land, ylim = c(-88,88)) +
  tm_raster("cover_cls", palette = pal8, title = "Global Land Cover")

tm_shape(pol_pres15)  + tm_polygons("II_turnout") 
