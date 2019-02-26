# chi_squared_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Chi-squared_distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# k_s - vector of numerics for the averages (mu's)

library(ggplot2)

source("chi_squared_function.R")

x_s <- seq(from = 0, to = 8, by = 0.05)
k_s <- seq(1, 9, 1)
raw_results <- amstat_chi_squared(x_s = x_s, k_s = k_s)
head(raw_results)
# NOTE: ylim(0, 0.5) used below to match Wikipedia plot, 
# so we get get some ggplot warnings; increase ylim's second value
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_point() + geom_line() + 
  xlab("x") + ylab("PMF") + ylim(0, 0.5) +
  ggtitle(label = "Chi Squared Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
