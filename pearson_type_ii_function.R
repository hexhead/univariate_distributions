# pearson_type_ii_function.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson Type II distribution
# * The Pearson Type II Curve is used in computing the table of significant 
#   correlation coefficients for Spearman's rank correlation coefficient when 
#   the number of items in a series is less than 100 (or 30, depending on some 
#   sources). After that, the distribution mimics a standard Student's 
#   t-distribution. For the table of values, certain values are used
#   as the constants.
# * The Pearson type II distribution is a special case of the Pearson type I 
#   family restricted to symmetric distributions.
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# (1 – x ^ 2) ^ m - support (-1 ≤ x ≤ 1)
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (-1 ≤ x ≤ 1)
# m_s - vector of numerics - m

amstat_pearson_type_ii <- function(x_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <-  lapply(m_s, function(m) {
      y <- (1 - x ^ 2) ^ m
      data.frame(x = x, y = y, Parameters = sprintf("m=%3.0f", m))
    })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
