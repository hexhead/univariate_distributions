# pearson_type_iii_function.R - Bill White - 3/8/19
#
# pearson_type_iii_function_tests.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson Type III distribution
# * The Pearson type III distribution is a generalized gamma distribution 
#   or chi-squared distribution.
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# x ^ m * exp(-x) - support (0 ≤ x < ∞)
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)
# m_s - vector of numerics - m - real > 0

amstat_pearson_type_iii <- function(x_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <-  lapply(m_s, function(m) {
      y <- x ^ m * exp(-x)
      data.frame(x = x, y = y, Parameters = sprintf("m=%6.2f", m))
    })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
