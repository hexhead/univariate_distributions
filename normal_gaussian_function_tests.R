# normal_gaussian_function_tests.R - Bill White - 2/25/19

library(ggplot2)

source("normal_gaussian_function.R")

x_s <- seq(from = -4, to = 4, by = 0.1)
m_s <- c(0, -1, 1)
s_s <- c(1, 2, 3)
raw_results <- amstat_normal_gaussian(x_s = x_s, m_s = m_s, s_s = s_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Normal (gaussian) Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
