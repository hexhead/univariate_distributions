# gamma_general_function.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Gamma_distribution
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) (0, inf)
# k_s - vector of numerics - k - shape > 0
# t_s - vector of numerics - theta - scale > 0

source("gamma_function.R")

amstat_gamma_general <- function(x_s, k_s, t_s) {
  x_results <- lapply(x_s, function(x) {
    k_results <- lapply(seq_along(k_s), function(i) {
      k <- k_s[i]
      t <- t_s[i]
      t1 <- 1 / (amstat_gamma(k) * (t ^ k))
      t2 <- x ^ (k - 1)
      t3 <- exp(-(x / t))
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("k=%6.3f t=%6.3f", k, t))
    })         
    do.call(rbind, k_results)
  })
  do.call(rbind, x_results)
}
