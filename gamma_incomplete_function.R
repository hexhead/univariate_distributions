# gamma_incomplete_function.R - Bill White - 03/11/19
# 
# Parameters
# x_s - vector of numeric - 
# n_s - vector of numeric - 

source("exponential_sum_function.R")
source("gamma_function.R")

amstat_gamma_incomplete <- function(n_s, x_s, location = 'upper') {
  n_results <- lapply(n_s, function(n) {
    x_results <- lapply(x_s, function(x) {
      expsum <- amstat_exponential_sum(n = n - 1, x = x)
      if (location == 'upper') {
        # This function changes rapidly from 0 to 1 around the point z == a:
        # Returns the normalised upper incomplete gamma function of n and x
        y <- 1 - (factorial(n - 1) * exp(-x) * expsum) / amstat_gamma(n)
      } else {
        # This function changes rapidly from 1 to 0 around the point z == a
        # Returns the full (non-normalised) lower incomplete gamma function 
        # of a and z:
        # NOTE: to match the plot, had to normalize with amstat_gamma(n)
        y <- (factorial(n - 1) * exp(-x) * expsum) / amstat_gamma(n)
      }
      
      data.frame(x = x, y = y, Parameters = sprintf("%4.1f", n))
    })
    do.call(rbind, x_results)
  })
  do.call(rbind, n_results)
}
