# muth_function.R - Bill White - 3/26/19
#
# AMSTAT verion.
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) 0 < x < 1
# k_s - vector of numerics - kappa 0 < k <= 1
amstat_muth <- function(x_s, k_s) {
  x_results <- lapply(x_s, function(x) {
    k_results <- lapply(k_s, function(k) {
      t1 <- exp(k * x) - k
      t2 <- exp(((-exp(k * x) / k) + (k * x) + (1 / k)))
      y <- t1 * t2
      data.frame(x = x, y = y, 
                 Parameters = sprintf("kappa=%5.2f", k))
    })
    do.call(rbind, k_results)
  })
  do.call(rbind, x_results)
}
