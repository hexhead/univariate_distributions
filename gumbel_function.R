# gumbel_function.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Gumbel_distribution
# 
# The Gumbel distribution is named after Emil Julius Gumbel (1891–1966), 
# based on his original papers describing the distribution.
# 
# also known as the log-Weibull distribution and the double exponential 
# distribution (a term that is alternatively sometimes used to refer to 
# the Laplace distribution)
# 
# related to the Gompertz distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# b_s - vector of numerics - beta - scale (pos real)
# m_s - vector of numerics - mu - location (real)
amstat_gumbel <- function(x_s, m_s, b_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(seq_along(m_s), function(i) {
      m <- m_s[i]
      b <- b_s[i]
      z <- (x - m) / b
      y <-  (1 / b) * exp(-(z + exp(-z)))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("mu=%6.3f beta=%6.3f", m, b))
      })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
