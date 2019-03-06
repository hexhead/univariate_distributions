# polya_function.R - Bill White - 3/5/19
# 
# http://www.math.wm.edu/~leemis/chart/UDR/PDFs/Polya.pdf
# See also: negative binomial and exponential distributions.
#
# Parameters:
# k_s - vector of numerics to evaluate (x values) - 0 <= k <= n
# n_s - vector of integer n's for range of x-axis 1.2...
# p_s = vector of numeric - 0 < p_s < 1 
# g_s - vector of numeric  gamma > 0
amstat_polya <- function(n_s, p_s, g_s) {
  n_results <- lapply(n_s, function(n) {
    n_string <- sprintf("n=%1.0f", n)
    k_s <- seq(from = 1, to = n, by = 1)
    k_results <- lapply(k_s, function(k) {
      y_results <- lapply(seq_along(p_s), function(i) {
        p <- p_s[i]
        q <- 1 - p
        g <- g_s[i]
        y <- (choose((p / g) + k - 1, k) * choose((q / g) + n - k - 1, n - k)) /
              choose((1 / g) + n - 1, n)
        # amstat 2008 paper:
        # n1 <- choose(n, x)
        # n2 <- prod(unlist(lapply(0:(x - 1), function(j) { p + (j * b) })))
        # n3 <- prod(unlist(lapply(0:(n - x - 1), function(k) { 1 - p + (k * b) })))
        # dn <- prod(unlist(lapply(0:(n - 1), function(i) { 1 + (i * b) })))
        # y <- (n1 * n2 * n3) / dn
        data.frame(x = k, y = y, grp = n_string,
                   Parameters = sprintf("p = %5.3f beta = %1.0f", p, g))
      })
      do.call(rbind, y_results)
    })
    do.call(rbind, k_results)
  })
  do.call(rbind, n_results)
}
