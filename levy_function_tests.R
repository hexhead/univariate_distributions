# levy_function_tests.R - Bill White - 5/19/19
# 
# https://www.wikiwand.com/en/Levy_distribution
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) [x, inf)
# m_s - vector of numerics - mu - location
# c_s - vector of numerics - scale > 0

library(ggplot2)

source("levy_function.R")

x_s <- seq(from = 0.05, to = 4, by = 0.01)
m_s <- c(0, 1)
c_s <- c(0.5, 1, 2, 4, 8)
raw_results <- amstat_levy(x_s = x_s, m_s = m_s, c_s = c_s) 
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + 
  xlab("x") + ylab("PDF") + 
  ggtitle(label = "Levy Distribution",
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(~Facet)
print(plot_obj)
