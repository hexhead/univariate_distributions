# pearson_type_xii_function.R - Bill White - 3/9/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# [(g + x)/ (g – x)]h
# Parameters:
# g_s - vector of numerics 
# h_s - vector of numerics 

amstat_pearson_type_xii <- function(g_s, h_s) {
  g_results <- lapply(g_s, function(g) {
    h_results <- lapply(h_s, function(h) {
      x_s <- seq(from = -g, to = g, by = 0.05)
      x_results <- lapply(x_s, function(x) {
        y <- ((g + x) / (g - x)) ^ h
        data.frame(x = x, y = y, Parameters = sprintf("g=%4.2f h=%4.2f", g, h))
      })         
      do.call(rbind, x_results)
    })
    do.call(rbind, h_results)
  })
  do.call(rbind, g_results)
}
