# pareto_function_tests.R - Bill White - 2/27/19
# 
# https://www.wikiwand.com/en/Pareto_distribution
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics - xm_s
# a_s - vector of numerics - alphas

library(ggplot2)

source("pareto_function.R")

x_s <- seq(from = 0, to = 8, by = 0.05)
m_s <- c(1, 2)
a_s <- c(1, 2, 3)
raw_results <- amstat_pareto_typeI(x_s = x_s, m_s = m_s, a_s = a_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + 
  ggtitle(label = "Pareto Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(. ~ facet)
print(plot_obj)
