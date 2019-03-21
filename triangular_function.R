# triangular_function.R - Bill White - 5/20/19
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) (-inf, inf)
# a - lower limit x
# m - midpoint/cutoff x
# b - upper limit x

amstat_triangular <- function(x_s, a, b, m) {
  x_results <- lapply(x_s, function(x) {
    if ((x > a) && (x <= m)) {
      y <- (2 * (x - a)) / ((b - a) * (m - a))
    } else {
      if ((x >= m) && (x < b)) {
        y <- (2 * (b - x)) / ((b - a) * (b - m))
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
