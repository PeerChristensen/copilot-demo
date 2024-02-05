# this script is intended to perform exploratory data analyses of the iris dataset
# including plots made with ggplot2 and a simple regression model with Species as dependent variable.
# all code suggestions should follow the tidyverse style guide (https://style.tidyverse.org/)

library(tidyverse)
library(ggcorrplot)

# load iris dataset
data(iris)

# create a scatterplot of Sepal.Length vs. Sepal.Width
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

# create a scatterplot of Sepal.Length vs. Sepal.Width with color coding by Species
# use theme_minimal() as theme
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +  
  theme_minimal()

# describe the dataset with number of rows, columns and variables
glimpse(iris)

# create a correlation matrix of the numeric variables
# use cor() to calculate the correlation matrix
# use ggcorrplot() to plot the correlation matrix
# use a wacky color palette

cor_matrix <- cor(iris[,1:4])
ggcorrplot(cor_matrix, hc.order = TRUE, type = "lower", lab = TRUE, lab_size = 3, colors = c("#6D9EC1", "white", "#E46726"))

# use green and blue colors for the correlation plot. do not use the palette argument
# use a diverging color palette
ggcorrplot(cor_matrix, hc.order = TRUE, type = "lower", lab = TRUE, lab_size = 3, colors = c("#6D9EC1", "white", "#E46726"), palette = "RdBu")


# summarise he data with a table of mean, median, min, max and standard deviation for each variable
# use summarise_all() with the functions mean(), median(), min(), max() and sd()
# deselect the Species column with select(-Species)
# convert to long format
iris %>% 
  select(-Species) %>% 
  summarise_all(list(mean = mean, median = median, min = min, max = max, sd = sd)) %>%
  as_tibble() %>%
  gather(key = "variable", value = "value")

# summarise the data with summarise(). group by Species and calculate the mean of each variable.
iris %>% 
  group_by(Species) %>% 
  summarise_all(list(mean = mean))

# q: how many rows are there in the iris dataset?
# a: 150

# fit a regresssion model with Species as dependent variable and Sepal.Length independent variable
# use glm() with family = "binomial"
# use summary() to print the model summary

model <- glm(Species ~ Sepal.Length, data = iris, family = "binomial")
summary(model)




