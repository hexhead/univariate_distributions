# dagum_function.R - Bill White - 3/16/19
# 
# https://www.wikiwand.com/en/Dagum_distribution
# 
# * Dagum distribution can be derived as a special case of the Generalized 
#   Beta II (GB2) distribution (a generalization of the Beta prime distribution)
# * often used to model income and wealth distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) > 0
# a_s - vector of numerics - a - shape > 0
# b_s - vector of numerics - b - scale > 0
# p_s - vector of numerics - p - shape > 0
amstat_dagum <- function(x_s, a_s, b_s, p_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(seq_along(a_s), function(i) {
      a <- a_s[i]
      b <- b_s[i]
      p <- p_s[i]
      t1 <- (a * p) / x
      num <- (x / b) ^ (a * p)
      den <- (((x / b) ^ a) + 1) ^ (p + 1)
      y <- t1 * (num / den)
      data.frame(x = x, y = y, 
                 Parameters = sprintf("alpha=%3.1f beta=%3.1f p=%3.1f", a, b, p))
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
