
nordic <- read.csv("data/nordic-data.csv")
str(nordic) #structure
head(nordic)
nordic$country
class(nordic$country)

# Reorder levels of a factor ####
nordic$country <- factor(nordic$country, 
                         levels=c("Sweden", "Norway", "Denmark"))
nordic$country
  # use caution when reordering levels, check out mapvalues

class(1 + 1i)
class(TRUE)

# Type coercion ####
# what happens when different classes are combined together into a single vector?
c(TRUE, "a")
c(1.17, "1.17")

as.numeric(nordic$country)
nordic$country
c(nordic$country, 1)

nordic$country + 2
# logical -> integer -> numeric -> complex -> character

str(nordic)

### Sequences ####
(a <- 1:10)
b <- seq(0, 100, by = 3)
head(b)
tail(b)

?read.csv
## Challenge - read in nordic dataframe, ####
# keeping the column with the countries as a 
# character instead of a factor
nordic2 <- read.csv("data/nordic-data.csv",
                    stringsAsFactors=FALSE)
str(nordic2)

nordic2 <- read.csv("data/nordic-data.csv",
                    colClasses=c("character", "integer", "numeric"))
str(nordic2)

# third way: change global options (see Etherpad)
# any csv that you read in, will read stringsAsFactors=FALSE
# reset when you restart R

# fourth way
nordic2 <- read.csv("data/nordic-data.csv",
                    as.is=TRUE)
str(nordic2)

### Lists ####
list_ex <- list(1, "a", TRUE, c(1,2,3))
list_ex
class(list_ex)
class(list_ex[[3]])
list_ex[[4]][2]

list_ex2 <- list(num = 1, chr = "a", log = TRUE, vect = c(1,2,3))
list_ex2
list_ex2[[1]]
list_ex2$num

### Rows and columns
# nordic[row,column]
# nordic[row,]
# nordic[,column]
nordic
nordic[2, 3]
nordic[3,]
nordic[2:3,]

# three ways to get first column from data frame ####
nordic[[1]] # hard coding
nordic[,"country"]
nordic[,1]

nordic[,c("country", "lifeExp")]
b

### Exploring data frames ####
gapminder <- read.csv("data/gapminder_data.csv")
gapminder <- read.csv("https://raw.githubusercontent.com/datacarpentry/r-intro-geospatial/master/_episodes_rmd/data/gapminder_data.csv")

str(gapminder)
nrow(gapminder)
ncol(gapminder)
colnames(gapminder)
names(gapminder)
dim(gapminder)

below_ave <- gapminder$lifeExp < 70.5
head(below_ave)
length(below_ave) # number of obs.
sum(below_ave) # number of TRUE

##### Adding column to data frame ####
gapminder$below_ave <- below_ave 
head(gapminder)
  # your data frame and your variable (vector) have to be the same length

# check that number rows in our data is equal to the length of our variable
# should return a TRUE or FALSE
# "unit test"
if(length(below_ave) != nrow(gapminder)){
  print("Error")
}

##### Adding row to data frame ####
names(gapminder)
new_row <- list("Norway", 2016, 5e7, "Nordic", 80.3, 
                49400.0, FALSE)
gapminder_norway <- rbind(gapminder, new_row)
# warning!!!
str(gapminder$continent)
levels(gapminder$continent)

# First we need to add a level to our factor "continent"
levels(gapminder$continent) <- c(levels(gapminder$continent),
                                 "Nordic")

gapminder_norway <- rbind(gapminder, new_row)
tail(gapminder_norway)

# Columns are vectors (one data class)
# Rows are lists (multiple data classes)

# Challenge: Add a row with a made up country and other made up data
# a new dataframe gapminder_me
# Add a logical column if gdpPercap between 700 and 750. Call this column "med_gdp"
my_row <- list("Brigid", 1985,  3000000, "Nordic", 101.000,  
               725.1234, FALSE)
levels(gapminder_norway$country) <- c(levels(gapminder_norway$country),
                                 my_row[[1]])
gapminder_me <- rbind(gapminder_norway, my_row)
gapminder_me$med_gdp <- (gapminder_me$gdpPercap > 700) &
                        (gapminder_me$gdpPercap < 750)
  # TRUE if gdp between 700 and 750

gapminder_me$ext_gdp <- (gapminder_me$gdpPercap < 700) |
                        (gapminder_me$gdpPercap > 750)
  # TRUE if gdp < 700 or gdp > 750

### Creating a dataframe ####
df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)
df
df[1:2,] # get  first two rows and all columns
df[,3] # get 3rd column
df[-2,] # get all columns and rows except the 2nd row
df[-c(1,3),] # subtract 1st and 3rd column from the data


### NAs ####
sum(is.na(gapminder))
  # check for NA
gapminder_nona <- na.omit(gapminder)
  # return the data frame with rows that don't any NAs
str(gapminder_nona)

na_logic <- complete.cases(gapminder)
  # returns TRUE if no NAs in that row
  # returns FALSE if at least one NA in that row
str(na_logic)

### dplyr ####
library("dplyr")

# Get the mean gdp in Africa
mean(gapminder[gapminder$continent=="Africa", "gdpPercap"])

# Select columns ####
year_country_gdp <- select(gapminder, year, country, gdpPercap)
str(year_country_gdp)

# Pipes ####
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
str(year_country_gdp)

# Get rows with "filter" ####
# data for Europe, want year, country, and gdp
year_country_gdp_euro <- gapminder %>% 
  filter(continent=="Europe") %>%
  select(year, country, gdpPercap)

# Challenge: 
# Write a single command (which can span multiple lines and includes pipes) 
# that will produce a dataframe that has the African values for lifeExp, 
# country and year, but not for other Continents. How many rows does your 
# dataframe have and why?

year_country_lifeExp_Africa <- gapminder %>%
  filter(continent=="Africa") %>%
  select(year,country,lifeExp)

# Group_by ####
gdp_bycontinents <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_bycontinents

# Calculate the average life expectancy per country. 
lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp=mean(lifeExp))
lifeExp_bycountry

# Which has the longest average life expectancy and which 
# has the shortest average life expectancy?

# one way
lifeExp_bycountry %>% arrange(mean_lifeExp)
lifeExp_bycountry %>% arrange(desc(mean_lifeExp))

# 2nd way
# click on data object in Environment

# 3rd way
lifeExp_bycountry %>%
  filter(mean_lifeExp == min(mean_lifeExp) | 
           mean_lifeExp == max(mean_lifeExp))

# Group and summarize multiple variables ####
gdp_bycontinents_byyear <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_bycontinents_byyear

gdp_pop_bycontinents_byyear <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            num = n(),
            se_gdpPercap = sd_gdpPercap/sqrt(num)
  )
gdp_pop_bycontinents_byyear 
# add SE for mean_gdpPercap (SE = sd/sqrt(n))

## Count ####
gapminder %>% count(continent, sort=TRUE)

## Mutate ####
# add a column to the data
gdp_pop_bycontinents_byyear <- gapminder %>% 
  mutate(gdp_billion = gdpPercap*pop/10^9) %>% # NEW LINE
  group_by(continent, year) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            num = n(),
            se_gdpPercap = sd_gdpPercap/sqrt(num),
            mean_gdp_billion = mean(gdp_billion) # NEW LINE
  )
gdp_pop_bycontinents_byyear
