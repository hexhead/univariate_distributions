# minimax_function.R - Bill White - 3/26/19
#
# AMSTAT verion.
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) 0 < x < 1
# g_s - vector of numerics - gamma
# b_s - vector of numerics - beta
amstat_minimax <- function(x_s, g_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    g_results <- lapply(g_s, function(g) {
      b_results <- lapply(b_s, function(b) {
        t1 <- b * g * (x ^ (b - 1))
        t2 <- (1 - (x ^ b)) ^ (g - 1)
        y <- t1 * t2
        data.frame(x = x, y = y, 
                   Parameters = sprintf("beta=%5.2f gamma=%5.2f", b, g))
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, g_results)
  })
  do.call(rbind, x_results)
}
