# poisson_function.R - Bill White - 2/20/19
# 
# https://en.wikipedia.org/wiki/Poisson_distribution
# popular for modelling the number of times an event occurs in an interval of time or space.
# 
# k is the number of occurrences (support)
# r rate λ is the expected number of occurrences, which need not be an integer
amstat_poisson <- function(k, r) {
  results <- lapply(k, function(x) {
    data.frame(x = rep(x, length(r)), 
               y = (r ^ x * exp(-r)) / factorial(x),
               Parameters = paste("lambda =", r))
  })
  results
}
