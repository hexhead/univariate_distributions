# beta_prime_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Beta_prime_distribution
# 
library(ggplot2)

source("beta_prime_function.R")

# Parameters:
# x_s - vector of numerics to evaluate (x values) (0, inf)
# a_s - vector of numerics - alpha - shape > 0 
# b_s - vector of numerics - beta - shape > 0

x_s <- seq(from = 0, to = 5, by = 0.05)
a_s <- c(1, 1, 2, 2, 2, 5)
b_s <- c(1, 2, 1, 2, 3, 3)
raw_results <- amstat_beta_prime(x_s = x_s, a_s = a_s, b_s = b_s)
print(head(raw_results))
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + ylim(0, 2) +
  ggtitle(label = "Beta Prime Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
