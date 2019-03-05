# gamma_inverse_function.R - Bill White - 3/5/19
# 
# https://www.wikiwand.com/en/Inverse-gamma_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# a_s = vector of numeric alpha shape
# b_s - vector of numeric beta scale

source("gamma_function.R")

amstat_gamma_inverse <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    y_results <- lapply(1:length(a_s), function(i) {
      a <- a_s[i]
      b <- b_s[i]
      t1 <- (b ^ a) / amstat_gamma(a)
      t2 <- (1 / x) ^ (a + 1)
      t3 <- exp(-(b / x))
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("a = %2.0f b = %2.0f", a_s[i], b_s[i]))
    })
    do.call(rbind, y_results)
  })
  do.call(rbind, x_results)
}
