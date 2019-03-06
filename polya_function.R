# polya_function.R - Bill White - 3/5/19
# 
# http://www.math.wm.edu/~leemis/chart/UDR/PDFs/Polya.pdf
# * See also: negative binomial and exponential distributions.
# * one can say that the Negative Binomial distribution is a 
#   special case of the Polya.

source("gamma_function.R")

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
                   Parameters = sprintf("p = %6.2f gamma = %6.2f", p, g))
      })
      do.call(rbind, y_results)
    })
    do.call(rbind, k_results)
  })
  do.call(rbind, n_results)
}

# -----------------------------------------------------------------------------
# https://www.vosesoftware.com/riskwiki/Polyadistribution.php
# Parameters:
# x_s - vector of numerics to evaluate (x values) - 0 <= k <= n
# a_s = vector of numeric - alpha > 0
# b_s - vector of numeric - beta > 0
vose_polya <- function(x_s, a_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    y_results <- lapply(seq_along(a_s), function(i) {
      a <- a_s[i]
      b <- b_s[i]
      y <- amstat_gamma(a + x) * (b ^ x) / 
        (amstat_gamma(x + 1) * amstat_gamma(a) * (1 + b) ^ (a + x))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("alpha = %6.2f beta = %6.2f", a, b))
    })
    do.call(rbind, y_results)
  })
  do.call(rbind, x_results)
}

