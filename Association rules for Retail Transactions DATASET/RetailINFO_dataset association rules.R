require(arules)|| install.packages("arules");library(arules)
require(arulesViz)||install.packages("arulesViz");library(arulesViz)

# Load the dataset

retail_dataset <- read.transactions(file = "C:/Users/SRIRAMA/Desktop/Association Rules assignment/transactions_retail1.csv", format = "basket", sep = ",")
View(retail_dataset)
summary(retail_dataset)

## Data is catagorical (i.e the data is names of items so no need to convert)
#so we can directly proceed with the rules

#apply apriori algorithm to the data

arules <- apriori(retail_dataset, parameter = list(support = 0.003, confidence = 0.4))

#sorting the rules based on lift ratio

inspect(head(sort(arules, by = "lift")))
plot(arules)

# sorting the rules based on quality (i.e based on support,confidence and lift)
head(quality(arules))
plot(arules, method = "paracoord")
plot(arules, method = "grouped")
