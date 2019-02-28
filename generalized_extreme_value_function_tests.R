# generalized_extreme_value_function_tests.R - Bill White - 2/27/19
# 
# https://www.wikiwand.com/en/Generalized_extreme_value_distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics -location - real
# s_s - vector of numerics - scale > 0
# xi_s - vector of numerics - shape - real

library(ggplot2)

source("generalized_extreme_value_function.R")

x_s <- seq(from = -4, to = 4, by = 0.05)
m_s <- c(0)
s_s <- c(1)
xi_s <- c(-1 / 2, 0, 1 / 2)
raw_results <- amstat_generalized_extreme_value(x_s = x_s, 
                                                m_s = m_s, 
                                                s_s = s_s, 
                                                xi_s = xi_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PMF") + 
  ggtitle(label = "Generalized Extreme Value (GEV) Distribution",
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
