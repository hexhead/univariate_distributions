# pearson_type_viii_function.R - Bill White - 3/8/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - 0 <= x <= 1
# m_s - vector of numerics - m

amstat_pearson_type_viii <- function(x_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      y <-  (1 + x) ^ -m
      data.frame(x = x, y = y, Parameters = sprintf("m=%4.2f", m))
    })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
