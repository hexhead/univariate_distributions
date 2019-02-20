# binomial_function.R - Bill White - 2/19/19
# https://en.wikipedia.org/wiki/Binomial_distribution
# k is the number of observed successes (suport)
# n is the number of draws (i.e. quantity drawn in each trial) { 0, 1, 2, ... N}
# p is the numeric vector of probabilities of success [0, 1]
amstat_binomial <- function(k, n, p) {
  results <- lapply(k, function(x) {
    data.frame(x = x, 
               y = choose(n, x) * (p ^ x * (1 - p) ^ (n - x)),
               Parameters = paste("n =", n, "p =", p))
  })
  results
}
