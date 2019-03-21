# uniform_continuous_function.R - Bill White - 3/20/19
# 
# aka continuous rectangular
# 
# # AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) (-inf, inf)
# a - lower limit x
# b - upper limit x
# 
amstat_uniform_continuous <- function(x_s, a, b) {
  x_results <- lapply(x_s, function(x) {
    y <- 0
    if ((x > a) && (x < b)) {
      y <- 1 / (b - a)
    }
    data.frame(x = x, y = y, Parameters = paste("a =", a, "b =", b))
  })
  do.call(rbind, x_results)
}
