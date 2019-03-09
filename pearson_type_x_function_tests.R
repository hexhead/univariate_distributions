# pearson_type_x_function_tests.R - Bill White - 3/8/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)

library(ggplot2)

source("pearson_type_x_function.R")

x_s <- seq(from = 0, to = 6, by = 0.1)
raw_results <- amstat_pearson_type_x(x_s = x_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y)) + geom_line() +
  xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type X - Negative Exponential", 
          subtitle = "Probability Density Function")
print(plot_obj)
