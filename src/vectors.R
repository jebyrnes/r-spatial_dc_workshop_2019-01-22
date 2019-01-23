#'-----------------------------
#' How to work with vectors in R
#' 
#'-----------------------------

#libraries
library(sf)
library(ggplot2)
library(dplyr)

#loading in some data about HARV
file.choose()
aoi_boundary_HARV <- st_read("data/NEON-DS-Site-Layout-Files/HARV/HarClip_UTMZ18.shp")


#explore the metadata
st_geometry_type(aoi_boundary_HARV)
st_crs(aoi_boundary_HARV)
st_bbox(aoi_boundary_HARV)

#look at the object
aoi_boundary_HARV
class(aoi_boundary_HARV)
aoi_boundary_HARV$geometry

#plot
ggplot() +
  geom_sf(data = aoi_boundary_HARV,
          fill = "purple", color = "black") +
  coord_sf()


# Using the steps above, import the HARV_roads and HARVtower_UTM18N layers into R. 
# Call the HARV_roads object lines_HARV 
#and the HARVtower_UTM18N point_HARV.
# Answer the following questions:
#   What type of R spatial object is created when you import each layer?
#   What is the CRS and extent for each object?
#   Do the files contain points, lines, or polygons?
#   How many spatial objects are in each file?
#   Plot each file using geom_sf

lines_HARV <- st_read("data/NEON-DS-Site-Layout-Files/HARV/HARV_roads.shp")
point_HARV <- st_read("data/NEON-DS-Site-Layout-Files/HARV/HARVtower_UTM18N.shp")


st_crs(lines_HARV)
st_crs(point_HARV)

st_bbox(lines_HARV)
st_bbox(point_HARV)

#plot
plot(lines_HARV["geometry"])
plot(point_HARV["geometry"])

ggplot() +
  geom_sf(data = point_HARV) 

ggplot() +
  geom_sf(data = lines_HARV) 

#Explore these attribute
names(lines_HARV)
ncol(lines_HARV)
head(lines_HARV)

lines_HARV$TYPE


#Let's look at just footpaths
#within Harvard forest
footpath_HARV <- lines_HARV %>%
  filter(TYPE == "footpath")

nrow(footpath_HARV)

ggplot()+
  geom_sf(data = footpath_HARV) +
  coord_sf()


# Let's look at different footpaths
ggplot()+
  geom_sf(data = footpath_HARV,
          mapping = aes(color = factor(OBJECTID))) +
  coord_sf()

# using lines_HARV
# 1. Subset to all boardwalks and plot
# 2. Subset to all stone walls, and plot with each feature
#    having a unique color

levels(lines_HARV$TYPE)

lines_HARV %>%
  filter(TYPE == "boardwalk") %>%
  ggplot() +
  geom_sf()

stone_walls_HARV <- lines_HARV %>%
  filter(TYPE == "stone wall")

ggplot() +
  geom_sf(data = stone_walls_HARV,
          mapping = aes(color = factor(OBJECTID))) +
  coord_sf()

# Maybe we want to see all of the line types
colors_for_harv <- c("green", "blue", "navy", "purple")
size_for_harv <- 1:4

ggplot() +
  geom_sf(lines_HARV,
          mapping = aes(color = TYPE,
                        size = TYPE)) +
  coord_sf() +
  scale_color_manual(values = colors_for_harv) +
  scale_size_manual(values = size_for_harv)

#aesthetics - color, fill, size, shape, alpha
ggplot() +
  geom_sf(data = lines_HARV,
          mapping = aes(color = TYPE)) +
  coord_sf() +
  scale_color_manual(values = colors_for_harv) +
  labs(color = "Road Type") +
  ggtitle("NEON Harvard Forest Field Site",
          subtitle = "Roads and Trails")

##
# 
# Create a map of the state boundaries in the United States using the data located in your downloaded data folder: NEON-DS-Site-Layout-Files/US-Boundary-Layers\US-State-Boundaries-Census-2014. Apply a fill color to each state using its region value. Add a legend.
#go wild and try some other aesthetics, titles, etc.

us_map <- st_read("data/NEON-DS-Site-Layout-Files/US-Boundary-Layers/US-State-Boundaries-Census-2014.shp")

ggplot() +
  geom_sf(data = us_map,
          mapping = aes(fill = region),
          color = "blue") +
  scale_fill_viridis_d(option = "B") +
  coord_sf()
