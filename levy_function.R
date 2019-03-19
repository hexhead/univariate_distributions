# levy_function.R - Bill White - 5/19/19
# 
# https://www.wikiwand.com/en/Generalized_Pareto_distribution
# 
# * In probability theory and statistics, the Lévy distribution, named after Paul
#   Lévy, is a continuous probability distribution for a non-negative random
#   variable. 
# * In spectroscopy, this distribution, with frequency as the dependent
#   variable, is known as a van der Waals profile.[note 1] It is a special case 
#   of the inverse-gamma distribution. It is a stable distribution.
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) [x, inf)
# m_s - vector of numerics - mu - location
# c_s - vector of numerics - scale > 0
amstat_levy <- function(x_s, m_s, c_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      c_results <- lapply(c_s, function(c) {
        t1 <- sqrt(c / (2 * pi))
        t2 <- exp(-(c / (2 * (x - m)))) / ((x - m) ^ (3 / 2))
        y <- t1 * t2
        data.frame(x = x, 
                   y = y, 
                   Parameters = sprintf("c=%4.2f", c),
                   Facet = sprintf("Location mu: %4.2f", m))
      })
      do.call(rbind, c_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
