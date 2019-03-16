# chi_function.R - Bill White - 3/16/19
# 
# https://www.wikiwand.com/en/Chi_distribution
# 
# The distribution of the positive square root of the sum of squares of a set 
# of independent random variables each following a standard normal 
# distribution, or equivalently, the distribution of the Euclidean distance 
# of the random variables from the origin. It is thus related to the chi-
# squared distribution by describing the distribution of the positive square 
# roots of a variable obeying a chi-squared distribution.
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0, inf)]
# k_s - vector of numerics degrees of freedom > 0

source("gamma_function.R")

amstat_chi <- function(x_s, k_s) {
  x_results <- lapply(x_s, function(x) {
    k_results <- lapply(k_s, function(k) {
      # break it down into steps for debugging
      t1 <- 1 / (2 ^ ((k / 2) - 1) * amstat_gamma(k / 2)) 
      t2 <- x^(k - 1)
      t3 <- exp(-((x ^ 2) / 2))
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("k = %2d", k))
    })         
    do.call(rbind, k_results)
  })
  do.call(rbind, x_results)
}
