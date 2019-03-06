# polya_function.R - Bill White - 3/5/19
# 
# http://www.math.wm.edu/~leemis/chart/UDR/PDFs/Polya.pdf
#
# Polya distribution (from http://www.math.wm.edu/˜leemis/chart/UDR/UDR.html)
# The shorthand X ∼ Polya(n, p, β) is used to indicate that the random variable
# X has the Polya distribution with parameters n, p, and β. A Polya random variable X with
# parameters n, p, and β
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - real > 0
# n_s - vector of integer n's for range of x-axis 1.2...
# p_s = vector of numeric - 0 < p_s < 1 
# b_s - vector of numeric > 0

amstat_polya <- function(x_s, n_s, p_s, b_s) {
  n_results <- lapply(n_s, function(n) {
    n_string <- sprintf("n=%1.0f", n)
    x_results <- lapply(x_s, function(x) {
      y_results <- lapply(seq_along(p_s), function(i) {
        p <- p_s[i]
        b <- b_s[i]
        n1 <- choose(n, x)
        n2 <- prod(unlist(lapply(0:(x - 1), function(j) { p + (j * b) })))
        n3 <- prod(unlist(lapply(0:(n - x - 1), function(k) { 1 - p + (k * b) })))
        dn <- prod(unlist(lapply(0:(n - 1), function(i) { 1 + (i * b) })))
        y <- (n1 * n2 * n3) / dn
        data.frame(x = x, y = y, grp = n_string,
                   Parameters = sprintf("p = %5.3f beta = %1.0f", p, b))
      })
      do.call(rbind, y_results)
    })
    do.call(rbind, x_results)
  })
  do.call(rbind, n_results)
}
