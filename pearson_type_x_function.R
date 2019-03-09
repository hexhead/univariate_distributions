# pearson_type_x_function.R - Bill White - 3/8/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)

amstat_pearson_type_x <- function(x_s) {
  x_results <- lapply(x_s, function(x) {
    y <-  exp(-x)
    data.frame(x = x, y = y, Parameters = "")
  })         
  do.call(rbind, x_results)
}
