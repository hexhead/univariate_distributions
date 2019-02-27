# wald_inverse_gaussian_function.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Inverse_Gaussian_distribution
# * describes the distribution of the time a Brownian motion with positive 
#   drift takes to reach a fixed positive level
# * the inverse Gaussian distribution (also known as the Wald distribution)
# * x > 0, where \mu >0 is the mean and \lambda >0 is the shape parameter
# * As λ tends to infinity, the inverse Gaussian distribution becomes more 
#   like a normal (Gaussian) distribution
# * a two-parameter exponential family with natural parameters −λ/(2μ2) 
# limiting form of a sample in a sequential probability ratio test
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics mu mean
# l_s - vector of numerics lambda shape

amstat_wald_inverse_gaussian <- function(x_s, m_s, l_s) {
  x_results <- lapply(x_s, function(x) {
    m_v_results <- lapply(seq_along(m_s), function(i) {
      m <- m_s[i]
      l <- l_s[i]
      s1 <- sqrt(l / (2 * pi * x ^ 3))
      s2 <- exp(-(l * ((x - m) ^ 2)) / (2 * (m ^ 2) * x))
      y <- s1 * s2
      data.frame(x = x, y = y, 
                 Parameters = paste("mu", m_s[i], " l=", l_s[i]))
    })         
    do.call(rbind, m_v_results)
  })
  do.call(rbind, x_results)
}
