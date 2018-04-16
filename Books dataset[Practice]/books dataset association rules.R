require(arules) || install.packages("arules");library(arules)
require(arulesViz) || install.packages("arulesViz");library(arulesViz)

#load and inspect the data

Books_data <- read.csv(file.choose())
View(Books_data)
summary(Books_data)

  ## If we have binary data we convert that data into matrix by loading the csv and performing the operations

data_trans <- as(as.matrix(Books_data), "transactions")
inspect(data_trans[1:100])

#apply apriori algorithm to the data

rules <- apriori(as.matrix(Books_data), parameter = list(support = 0.02, confidence = 0.50))

#sorting the rules based on lift ratio

  inspect(head(sort(rules, by = "lift")))
  plot(rules)

  # sorting the rules based on quality (i.e based on support,confidence and lift)
    head(quality(rules))
    plot(rules, method = "grouped")


