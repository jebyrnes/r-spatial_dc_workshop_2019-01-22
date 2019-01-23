## KE Lotterhos
## 20190123
## (Description of this script) Learning ggplot

library(ggplot2)
library(dplyr)
gapminder <- read.csv("data/gapminder_data.csv")
head(gapminder)

ggplot(data = gapminder, aes(x=lifeExp)) + geom_histogram()

# Challenge: show distribution of gdp per capita
ggplot(data = gapminder, aes(x=gdpPercap)) + geom_histogram()

gapminder_small <- filter(gapminder, year == 2007, 
                          continent == "Americas")
  # this line gave 1/2 the class problems
  # dplyr wasn't installed

gapminder %>% filter(year==2007) %>% filter(continent == "Americas")

ggplot(data = gapminder_small, aes(x= country, y = gdpPercap)) +
  geom_col() + coord_flip()

# create a gapminder_small_2 with America data and 
# `year %in% c(1952, 2007)`

# Create a 2-way bar plot comparing the gdpPercap for each country
# between 1952 and 2007
# inside aes(fill = as.factor(year))
# geom_col(position = ?) # want bars to be side by side

gapminder_small_2 <- gapminder %>% filter(continent == "Americas") %>%
filter(year %in% c(1952, 2007))

ggplot(gapminder_small_2, aes(x=country, y = gdpPercap,
                              fill = as.factor(year))) + 
  geom_col(position="dodge") + coord_flip()

