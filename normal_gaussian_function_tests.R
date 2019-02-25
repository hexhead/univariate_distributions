# normal_gaussian_function_tests.R - Bill White - 2/25/19
# https://www.wikiwand.com/en/Normal_distribution
# 
library(ggplot2)

source("normal_gaussian_function.R")

x_s <- seq(from = -5, to = 5, by = 0.1)
m_s <- c(0, 0, 0, -2)
v_s <- c(0.2, 1.0, 5.0, 0.5)
s_s <- sqrt(v_s)
raw_results <- amstat_normal_gaussian(x_s = x_s, m_s = m_s, s_s = v_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = round(y, 3), 
                                    colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Normal (gaussian) Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")

print(plot_obj)
