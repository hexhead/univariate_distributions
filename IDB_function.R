# IDB_function.R - Bill White - 3/13/19
#
# http://www.math.wm.edu/~leemis/chart/UDR/PDFs/IDB.pdf
#
# A distribution with one scale and two shape parameters is studied. The 
# distribution can describe increasing (I), decreasing (D), constant and 
# bathtub-shaped (B) failure rates. This motivates the working name, IDB 
# distribution.
# #
# Parameters:
# x_s - vector of numerics to evaluate (x values) > 0
# d_s = vector of numeric delta - scale parameter > 0
# k_s = vector of numeric kappa - shape parameter > 0
# g_s = vector of numeric gamma - shape parameter >= 0

amstat_IDB <- function(x_s, d_s, k_s, g_s) {
  x_results <- lapply(x_s, function(x) {
    d_results <- lapply(seq_along(d_s), function(i) {
      d <- d_s[i]
      k <- k_s[i]
      g <- g_s[i]
      num <- ((1 + (k * x)) * (d * x)) + g
      den <- (1 + (k * x)) ^ (g / (k + 1))
      t1 <- exp(-d * (x ^ 2)) / 2
      y <- (num / den) * t1
      data.frame(x = x, y = y, 
                 Parameters = sprintf("delta=%2.0f kappa=%2.0f gamma=%2.0f", d, k, g))
    })
    do.call(rbind, d_results)
  })
  do.call(rbind, x_results)
}
