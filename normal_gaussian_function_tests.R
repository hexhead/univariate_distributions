# normal_gaussian_function_tests.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Normal_distribution
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics for the averages (mu's)
# s_s - vector of numerics for standard deviations
# v_s - vector of numerics for  variances
 
library(ggplot2)

source("normal_gaussian_function.R")

x_s <- seq(from = -5, to = 5, by = 0.1)
m_s <- c(0, 0, 0, -2)
v_s <- c(0.2, 1.0, 5.0, 0.5)
raw_results <- amstat_normal_gaussian(x_s = x_s, m_s = m_s, v_s = v_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_point() + geom_line() + 
    xlab("x") + ylab("PMF") + ylim(0, 1) +
  ggtitle(label = "Normal (gaussian) Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")

print(plot_obj)
