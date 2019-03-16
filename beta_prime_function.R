# beta_prime_function.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Beta_prime_distribution
# 
# The beta prime distribution (also known as inverted beta distribution or 
# beta distribution of the second kind is an absolutely continuous 
# probability distribution defined for x>0 with two parameters α and β.
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) (0, inf)
# a_s - vector of numerics - alpha - shape > 0 
# b_s - vector of numerics - beta - shape > 0

source("beta_function.R")

amstat_beta_prime <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(seq_along(a_s), function(i) {
      a <- a_s[i]
      b <- b_s[i]
      num <- x ^ (a - 1) * (1 + x) ^ (-a - b)
      den <- amstat_beta(a, b)
      y <- num / den
      data.frame(x = x, y = y, 
                 Parameters = sprintf("alpha=%2.0f beta=%2.0f", a, b))
    })         
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
