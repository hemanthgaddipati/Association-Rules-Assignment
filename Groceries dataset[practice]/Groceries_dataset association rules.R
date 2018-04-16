require(arules) || install.packages("arules");library(arules) #required Package
require(arulesViz) || install.packages("arulesViz");library(arulesViz) #dependency package of "arules package" used for visualzation

#load and inspect the data

Groceries_dataset <- read.transactions(file = "C:/Users/SRIRAMA/Desktop/Association Rules assignment/groceries.csv", format = "basket", sep = ",")
View(Groceries_dataset)
summary(Groceries_dataset)

## Data is catagorical (i.e the data is names of items so no need to convert)
#so we can directly proceed with the rules

#apply apriori algorithm to the data

rules <- apriori(Groceries_dataset, parameter = list(support = 0.002, confidence = 0.5))

#sorting the rules based on lift ratio

inspect(head(sort(rules, by = "lift")))
plot(rules)

# sorting the rules based on quality (i.e based on support,confidence and lift)
head(quality(rules))
plot(rules, method = "grouped")
