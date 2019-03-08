# pearson_type_i_function.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson type I distribution
# The Pearson type I distribution (a generalization of the beta distribution) 
# arises when the roots of the quadratic equation (2) are of opposite sign, 
# that is, a_{1}<0<a_{2}. Then the solution p is supported on the 
# interval (a_{1},a_{2}).
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# Type I => Beta-distribution of the first kind.
# (1 + x)^m1 * (1 – x)^m2
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (-1 ≤ x ≤ 1)
# m1_s - vector of numerics - m1
# m1_s - vector of numerics - m2

amstat_pearson_type_i <- function(x_s, m1_s, m2_s) {
  x_results <- lapply(x_s, function(x) {
    m1_results <-  lapply(m1_s, function(m1) {
      m2_results <- lapply(m2_s, function(m2) {
        y <- (x + 1) ^ m1 * (1 - x) ^ m2
        data.frame(x = x, y = y, Parameters = sprintf("m1=%f m2=%f", m1, m2))
      })         
      do.call(rbind, m2_results)
    })         
    do.call(rbind, m1_results)
  })
  do.call(rbind, x_results)
}
