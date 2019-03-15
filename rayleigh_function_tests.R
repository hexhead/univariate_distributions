# rayleigh_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Rayleigh_distribution
# 
library(ggplot2)

source("rayleigh_function.R")

# Parameters:
# x_s - vector of numerics to evaluate (x values) [0, inf)
# s_s - vector of numerics - sigma - scale > 0

x_s <- seq(from = 0, to = 10, by = 0.05)
s_s <- c(0.5, 1, 2, 3, 4)
raw_results <- amstat_rayleigh(x_s = x_s, s_s = s_s)
print(head(raw_results))
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Rayleigh Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
