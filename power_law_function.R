# power_law_function.R - Bill White - 5/20/19
# 
# https://www.wikiwand.com/en/Power_law#/Power-law_probability_distributions

# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) (0, a)
# a_s - vector of numerics - alpha
# b_s - vector of numerics - beta

amstat_power_law <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(a_s, function(a) {
      b_results <- lapply(b_s, function(b) {
        #y <- (b * x ^ (b - 1)) / (a ^ b)
        y <- (x ^ -a) * exp(-b * x)
        data.frame(x = x, 
                   y = y, 
                   Parameters = sprintf("alpha=%4.2f beta=%4.2f", a, b))
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
