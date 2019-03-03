# lindley_standard_function.R - Bill White - 3/2/19
# 
# https://reference.wolfram.com/language/ref/LindleyDistribution.html
#  
# standard Lindley distribution
# Parameters: 
# x_s - vector of numerics to evaluate (x values) >= 0
# d_s - vector of numerics - delta - any positive real number
amstat_lindley_standard <- function(x_s, d_s) {
  x_results <- lapply(x_s, function(x) {
    d_results <- lapply(d_s, function(d) {
      # y ~ (x + 1) * exp(-d * x)
      n1 <- exp(-d * x)
      n2 <- 1 + x
      n3 <- d ^ 2
      num <- n1 * n2 * n3
      den <- 1 + d
      y <- num / den
      data.frame(x = x, y = y, Parameters = sprintf("d=%4.2f", d))
    })
    do.call(rbind, d_results)
  })
  do.call(rbind, x_results)
}
