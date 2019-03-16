# chi_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Chi_distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0, inf)]
# k_s - vector of numerics degrees of freedom > 0

library(ggplot2)

source("chi_function.R")

x_s <- seq(from = 0, to = 4, by = 0.05)
k_s <- seq(1, 5, 1)
raw_results <- amstat_chi(x_s = x_s, k_s = k_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 1) +
  ggtitle(label = "Chi Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
