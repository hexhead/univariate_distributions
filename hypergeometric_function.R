# hypergeometric_function.R - Bill White - 2/19/19

# k is the number of observed successes
# N is the population size { 0, 1, 2, ...}
# K is the number of success states in the population { 0, 1, 2, ... N}
# n is the number of draws (i.e. quantity drawn in each trial) { 0, 1, 2, ... N}
amstat_hypergeometric <- function(k, N, K, n) {
  results <- lapply(k, function(x) {
    data.frame(x = x, 
               y = (choose(K, x) * choose(N - K, n - x)) / choose(N, n),
               Parameters = paste("N =", N, "K =", K, "n =", n))
  })
  results
}
