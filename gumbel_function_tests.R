# gumbel_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Gumbel_distribution
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics - mu - location (real)
# b_s - vector of numerics  - beta - scale (pos real)

library(ggplot2)

source("gumbel_function.R")

x_s <- seq(from = -6, to = 20, by = 0.1)
m_s <- c(0.5, 1, 1.5, 3)
b_s <- c(2, 2, 3, 4)
raw_results <- amstat_gumbel(x_s = x_s, m_s = m_s, b_s = b_s)
print(head(raw_results))
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Gumbel Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
