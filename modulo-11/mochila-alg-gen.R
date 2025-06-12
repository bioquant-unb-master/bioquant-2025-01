#Resolvendo o problema da mochila com o algoritmo genetico
library(GA) # Version 3.0.1

# Define data 
p <- c(6, 5, 8, 9, 6, 7, 3) # Profits 
w <- c(2, 3, 6, 7, 5, 9, 4) # Weights 
W <- 9 # Knapsack ’s capacity 
n <- length(p) # Number of items

# Define fitness function 
knapsack <- function(x) { 
  f <- sum(x * p) 
  penalty <- sum(w) * abs(sum(x * w) - W) 
  f - penalty 
}

# Run SGA
SGA <- ga(type="binary", 
          fitness=knapsack , 
          nBits=n, 
          maxiter=100, # Maximum number of generations 
          run=200,     # Stop if the best-so-far fitness
          # hasn't improved for 'run' generations 
          popSize=100, 
          seed=101)

x.star <- SGA@solution # Final solution: c(1, 0, 0, 1, 0, 0, 0)
sum(x.star)     # Total number of selected items: 2
sum(x.star * p) # Total profit of selected items: 15
sum(x.star * w) # Total weight of selected items: 9