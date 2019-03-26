# minimax_function_tests.R - Bill White - 3/26/19
# 
# https://reference.wolfram.com/language/ref/GompertzminimaxDistribution.html

library(ggplot2)

source("minimax_function.R")

# Parameters:
# x_s - vector of numerics to evaluate (x values) 0 < x < 1
# b_s - vector of numerics - beta
# g_s - vector of numerics - gamma
x_s <- seq(from = 0, to = 1, by = 0.01)
b_s <- c(0.5, 1, 2)
g_s <- c(0.5, 1, 2)
raw_results <- amstat_minimax(x_s = x_s, b_s = b_s, g_s = g_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 2.5) +
  ggtitle(label = "Minimax Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
