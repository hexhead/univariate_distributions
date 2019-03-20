# von_mises_function_tests.R - Bill White - 5/20/19
# 
# https://www.wikiwand.com/en/Von_Mises_distribution
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) (0, 2*pi)
# m_s - vector of numerics - mu location - real
# k_s - vector of numerics - sigma scale > 0

library(ggplot2)

source("von_mises_function.R")

x_s <- seq(from = -pi, to = pi, by = 0.01)
m_s <- c(0)
k_s <- c(0, 0.5, 1, 2, 4, 8)
raw_results <- amstat_von_mises(x_s = x_s, m_s = m_s, k_s = k_s) 

plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") +
  ggtitle(label = "von Mises Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
