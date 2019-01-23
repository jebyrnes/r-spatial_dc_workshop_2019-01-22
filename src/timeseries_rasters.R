#'-----------------------------
#'
#' Raster Timeseries
#' 
#'-----------------------------

library(raster)
library(rgdal)
library(scales)
library(tidyr)

#filepath
#file.choose()
NDVI_HARV_path <- "data/NEON-DS-Landsat-NDVI/HARV/2011/NDVI/"


#the files
all_NDVI_HARV <- list.files(NDVI_HARV_path,
                            full.names = TRUE,
                            pattern = ".tif$")
#making a raster stack
NDVI_HARV_stack <- stack(all_NDVI_HARV)


#look at our stack
NDVI_HARV_stack

plot(NDVI_HARV_stack)

#turn into a data frame
NDVI_HARV_stack_df <- as.data.frame(NDVI_HARV_stack, xy=TRUE) %>%
  gather(variable, value, -x, -y)

head(NDVI_HARV_stack_df)


ggplot(data = NDVI_HARV_stack_df) +
  geom_raster(mapping = aes(x = x, y = y, fill = value)) +
  facet_wrap(~variable) +
  scale_fill_viridis_c(option = "A")

ggplot(data = NDVI_HARV_stack_df) +
  geom_histogram(aes(value)) +
  facet_wrap(~variable)

#look at day 277
day_277 <- "data/NEON-DS-Landsat-NDVI/HARV/2011/RGB/277_HARV_landRGB.tif"

raster_277 <- brick(day_277)
plot(raster_277)
plotRGB(raster_277)

#filter out bad days
NDVI_HARV_good <- NDVI_HARV_stack_df %>%
  filter(variable != "X277_HARV_ndvi_crop") %>%
  filter(variable != "X293_HARV_ndvi_crop")

#plot the average cell value over time
ggplot(NDVI_HARV_good %>%
         group_by(x, y) %>%
         summarize(value = mean(value, na.rm=T))) +
  geom_raster(aes(x = x, y = y, fill = value)) +
  scale_fill_viridis_c(option = "B")

#look at the time series by cell
ggplot(NDVI_HARV_good,
       aes(x = variable, y = value,
           group = paste(x, y))) +
  geom_point() +
  geom_line()
