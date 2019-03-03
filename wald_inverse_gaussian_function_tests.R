# wald_inverse_gaussian_function_tests.R - Bill White - 2/25/19
# 
# https://www.wikiwand.com/en/Inverse_Gaussian_distribution
# * describes the distribution of the time a Brownian motion with positive 
#   drift takes to reach a fixed positive level
# * the inverse Gaussian distribution (also known as the Wald distribution)
# * x > 0, where \mu >0 is the mean and \lambda >0 is the shape parameter
# * As λ tends to infinity, the inverse Gaussian distribution becomes more 
#   like a normal (Gaussian) distribution
# * a two-parameter exponential family with natural parameters −λ/(2μ2) 
# limiting form of a sample in a sequential probability ratio test
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics mu mean
# l_s - vector of numerics lambda shape

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
