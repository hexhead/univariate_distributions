# laplace_function.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Laplace_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s = vector of numeric means
# b_s - vector of numeric parameter b
# 
# is also sometimes called the double exponential distribution, 
# because it can be thought of as two exponential distributions 
# (with an additional location parameter) spliced together 
# back-to-back

amstat_laplace <- function(x_s, m_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    y_results <- lapply(1:length(m_s), function(i) {
      y <- (1 / (2 * b_s[i])) * exp(-abs((x - m_s[i]) / b_s[i]))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("mu = %6.3f b = %6.3f", 
                                      m_s[i], b_s[i]))
    })
    do.call(rbind, y_results)
  })
  do.call(rbind, x_results)
}
