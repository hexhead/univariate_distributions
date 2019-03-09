# pearson_type_xii_function_tests.R - Bill White - 3/9/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (1 ≤ x < ∞)

library(ggplot2)

source("pearson_type_xii_function.R")

g_s <- c(0.25, 0.5, 1.0)
h_s <- c(0.25, 0.5, 1)
raw_results <- amstat_pearson_type_xii(g_s = g_s, h_s = h_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() +
  xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type XII", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") +
  geom_vline(xintercept = c(-g_s, g_s), lty = 2)
print(plot_obj)
