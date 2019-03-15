# frechet_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Fr%C3%A9chet_distribution
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# a_s - vector of numerics - alpha - (0, inf)
# s_s - vector of numerics - s - scale (-inf, inf)
# m_s - vector of numerics - m - location of minimum 
# 
# NOTE: can ignore ggplot warnings for NA's

library(ggplot2)

source("frechet_function.R")

x_s <- seq(from = 0, to = 4, by = 0.05)
a_s <- c(1, 2, 3, 1, 2, 3)
s_s <- c(1, 1, 1, 2, 2, 2)
m_s <- c(0, 0, 0, 0, 0, 0)
raw_results <- amstat_frechet(x_s = x_s, a_s = a_s, m_s = m_s, s_s = s_s)
print(head(raw_results))
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Frechet Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
