# pareto_generalized_function_tests.R - Bill White - 5/19/19
# 
# https://www.wikiwand.com/en/Generalized_Pareto_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# g_s - vector of numerics - gamma - location
# k_s - vector of numerics - kappa - shape
# s_s - vector of numerics - sigma - scale

library(ggplot2)

source("pareto_generalized_function.R")

x_s <- seq(from = 0.05, to = 4, by = 0.05)
#k_s <- c(-1.2, -1, -0.8, -0.5, 0, 0.5)
k_s <- c(1, 5, 20, 1, 5, 20)
g_s <- c(0, 0, 0, 0, 0, 0)
s_s <- c(1, 1, 1, 2, 2, 2)
raw_results <- amstat_pareto_generalized(x_s = x_s, 
                                         g_s = g_s, 
                                         k_s = k_s, 
                                         s_s = s_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + ylim(0, 1.5) +
  ggtitle(label = "Generalized Pareto Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
