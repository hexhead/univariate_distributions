# logistic_function_tests.R - Bill White - 3/4/19
# 
# https://www.wikiwand.com/en/Logistic_distribution
# 
# # Parameters: 
# x_s - vector of numerics to evaluate (x values)
# l_s - vector of numerics - location - real
# s_s - vector of numerics - scale > 0

library(ggplot2)

source("logistic_function.R")

x_s <- seq(from = -5, to = 20, by = 0.1)
l_s <- c(5, 9, 9, 6, 2)
s_s <- c(2, 3, 4, 2, 1)
raw_results <- amstat_logistic(x_s = x_s, s_s = s_s, l_s = l_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + 
  ggtitle(label = "Logistic Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
