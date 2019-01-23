#'-----------------------------
#' Plotting All the Things
#' 
#'-----------------------------

#libraries
library(sf)
library(ggplot2)
library(dplyr)

#loading data

aoi_boundary_HARV <- st_read("data/NEON-DS-Site-Layout-Files/HARV/HarClip_UTMZ18.shp")

lines_HARV <- st_read("data/NEON-DS-Site-Layout-Files/HARV/HARV_roads.shp")

point_HARV <- st_read("data/NEON-DS-Site-Layout-Files/HARV/HARVtower_UTM18N.shp")

#plot them all!!!
ggplot() +
  geom_sf(data = aoi_boundary_HARV, fill = "grey", 
          color = "green") +
  geom_sf(data = lines_HARV, aes(color = TYPE), size = 1) +
  geom_sf(data = point_HARV) +
  coord_sf()

#combine a raster and vector
library(raster)

chm_HARV <- raster("data/NEON-DS-Airborne-Remote-Sensing/HARV/CHM/HARV_chmCrop.tif")

chm_HARV_df <- as.data.frame(chm_HARV, xy = TRUE)

ggplot() +
  geom_raster(data = chm_HARV_df,
              aes(x = x, y = y, fill = HARV_chmCrop)) +
  geom_sf(data = aoi_boundary_HARV, fill = "grey", 
          color = "green") +
  geom_sf(data = lines_HARV, 
          aes(color = TYPE), size = 1) +
  geom_sf(data = point_HARV) +
  coord_sf()
