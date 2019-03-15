# gamma_general_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Gamma_distribution
# 
library(ggplot2)

source("gamma_general_function.R")

# Parameters:
# x_s - vector of numerics to evaluate (x values) (0, inf)
# k_s - vector of numerics - k - shape > 0
# t_s - vector of numerics - theta - scale > 0

x_s <- seq(from = 0, to = 20, by = 0.1)
k_s <- c(1.0, 2.0, 3.0, 5.0, 9.0, 7.5, 0.5)
t_s <- c(2.0, 2.0, 2.0, 1.0, 0.5, 1.0, 1.0)
raw_results <- amstat_gamma_general(x_s = x_s, k_s = k_s, t_s = t_s)
print(head(raw_results))
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + ylim(0, 0.5)
  ggtitle(label = "General Gamma Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
