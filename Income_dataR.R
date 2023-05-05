install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("ggpubr")

library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
income.data <-read.csv("income.data.csv", stringsAsFactors = FALSE)
summary(income.data)

hist(income.data$happiness)
plot(happiness ~ income, data = income.data)

#Perform the linear regression analysis
income.happiness.lm <- lm(happiness ~ income, data = income.data)
summary(income.happiness.lm)

par(mfrow=c(2,2))
plot(income.happiness.lm)
par(mfrow=c(1,1))

#Plot the data points on a graph
income.graph<-ggplot(income.data, aes(x=income, y=happiness))+
  geom_point()
income.graph

#Add the linear regression line to the plotted data
income.graph <- income.graph + geom_smooth(method="lm", col="black")
income.graph

#Add the equation for the regression line.
income.graph <- income.graph +
  stat_regline_equation(label.x = 3, label.y = 7)
income.graph

#Make the graph ready for publication
income.graph +
  theme_bw() +
  labs(title = "Reported happiness as a function of income",
       x = "Income (x$10,000)",
       y = "Happiness score (0 to 10)")