# wald_inverse_gaussian_function_tests.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Normal_distribution
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics for the averages (mu's)
# s_s - vector of numerics for standard deviations
# v_s - vector of numerics for  variances

library(ggplot2)

source("wald_inverse_gaussian_function.R")

x_s <- seq(from = 1E-8, to = 3, by = 0.01)
l_s <- c(1, 0.2, 3, 1, 0.2)
m_s <- c(1, 1, 1, 3, 3)
raw_results <- amstat_wald_inverse_gaussian(x_s = x_s, m_s = m_s, l_s = l_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") +
  ggtitle(label = "Wald (Inverse Gaussian) Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
