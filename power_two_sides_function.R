# power_two_sides_function.R - Bill White - 5/20/19
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) (-inf, inf)
# n - exponent
# a - lower limit x
# m - midpoint/cutoff x
# b - upper limit x

amstat_power_two_sides <- function(x_s, n, a, b, m) {
  x_results <- lapply(x_s, function(x) {
    normalizer <- n / (b - a)
    if ((x > a) && (x <= m)) {
      y <- normalizer * ((x - a) / (m - a)) ^ (n - 1)
    } else {
      if ((x >= m) && (x < b)) {
        y <- normalizer * ((b - x) / (b - m)) ^ (n - 1)
      } else {
        y <- 0
      }
        
    }
    data.frame(x = x, 
               y = y, 
               Parameters = sprintf("a=%4.2f m=%4.2f b=%4.2f", a, m, b))
  })
  do.call(rbind, x_results)
}
