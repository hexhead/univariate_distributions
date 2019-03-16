# cauchy_log_function.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Log-Cauchy_distribution
# 
# * The distribution of a random variable whose logarithm is distributed in 
#   accordance with a Cauchy distribution
# * Some authors define \mu  and \sigma  as the location and scale parameters, 
#   respectively, of the log-Cauchy distribution.
# * Some authors regard it as a "super-heavy tailed" distribution, because it 
#   has a heavier tail than a Pareto distribution-type heavy tail, i.e., it 
#   has a logarithmically decaying tail.
# * log-Cauchy distribution is a special case of the generalized beta 
#   distribution of the second kind.
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0, inf)
# m_s = vector of numeric - mu - real
# s_s - vector of numeric - sigma - real > 0 
amstat_cauchy_log <- function(x_s, m_s, s_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(1:length(m_s), function(i) {
      m <- m_s[i]
      s <- s_s[i]
      t1 <- 1 / (x * pi)
      t2 <- s / (((log(x) - m) ^ 2) + s ^ 2)
      y <- t1 * t2
      data.frame(x = x, 
                 y = y, 
                 Parameters = sprintf("mu=%3.1f sigma=%3.1f", m, s))
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
