# logistic_log_function_tests.R - Bill White - 3/15/19
# 
# https://www.wikiwand.com/en/Log-logistic_distribution
# 
# Parameters: 
# x_s - vector of numerics to evaluate (x values) [0, inf)]
# a_s - vector of numerics - alpha - scale > 0
# b_s - vector of numerics - beta - shape > 0

library(ggplot2)

source("logistic_log_function.R")

x_s <- seq(from = 0, to = 2, by = 0.01)
b_s <- c(0.5, 1, 2, 4, 8)
a_s <- rep(1, length(b_s))
raw_results <- amstat_logistic_log(x_s = x_s, a_s = a_s, b_s = b_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 2.2) +
  ggtitle(label = "Log-logistic Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
