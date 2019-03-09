# pearson_type_xi_function.R - Bill White - 3/9/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (1 ≤ x < ∞)

amstat_pearson_type_xi <- function(x_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      y <-  x ^ -m
      data.frame(x = x, y = y, Parameters = sprintf("m=%4.2f", m))
    })
    do.call(rbind, m_results)
  })         
  do.call(rbind, x_results)
}
