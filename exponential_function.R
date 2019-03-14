# exponential_function.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Exponential_distribution
# Alternative parameterization
# 
# describes the time between events in a Poisson point process, i.e., 
# a process in which events occur continuously and independently at a 
# constant average rate
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0 - inf)
# l_s = vector of numeric lambas - rate parameter > 0

amstat_exponential <- function(x_s, l_s) {
  l_results <- lapply(l_s, function(l) {
    x_results <- lapply(x_s, function(x) {
      y <- l * exp(-(l * x))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("lambda = %6.3f", l))
    })
    do.call(rbind, x_results)
  })
  do.call(rbind, l_results)
}
