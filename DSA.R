# Load the packages
library(tidyverse)
library(ggplot2)

#Read in the dataset 
mydata.departure = read.csv('Departure.csv', header = TRUE)
mydata.departure$Period = as.Date(mydata.departure$Period)
head(mydata.departure)

# Plot the time series using ggplot2 
p = ggplot(mydata.departure, aes(x = Period, y = Value, col = Label1)) + geom_line()

# Format the dates on the x-axis and add in titles for the plot 
p = ggplot(mydata.departure, aes(x = Period, y = Value, col = Label1)) +
  geom_line()
p + scale_x_date(date_labels = "%b %y") + ggtitle("Daily Border Crossings - Departures") +  xlab("Year") + 
  ylab("Numbers")

# Model of the departure dataset 
m = lm(formula = Value ~ Period, data = mydata.departure)

# Summary of the dataset
summary(m)

# Plot a boxplot to check on outliers 
boxplot(mydata.departure$Value,
        ylab = "Value",  main = 'Boxplot for departure dataset') 





