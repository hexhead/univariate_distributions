# chi_squared_function.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Chi-squared_distribution
# 
# Pearson type III distribution is a generalized gamma distribution 
# or chi-squared distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# k_s - vector of numerics for the averages (mu's)

source("gamma_function.R")

amstat_chi_squared <- function(x_s, k_s) {
  x_results <- lapply(x_s, function(x) {
    k_results <- lapply(k_s, function(k) {
      # break it down into steps for debugging
      s1 <- 1 / (2 ^ (k / 2) * amstat_gamma(k / 2)) 
      s2 <- x^((k / 2) - 1)
      s3 <- exp(-(x / 2))
      y <- s1 * s2 * s3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("k = %2d", k))
    })         
    do.call(rbind, k_results)
  })
  do.call(rbind, x_results)
}
