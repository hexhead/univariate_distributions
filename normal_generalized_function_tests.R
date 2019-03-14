# normal_generalized_function_tests.R - Bill White - 3/14/19
# 
# https://www.wikiwand.com/en/Generalized_normal_distribution
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics - mu - location (real)
# a_s - vector of numerics  - alpha - scale (pos real)
# b_s - vector of numerics  - beta - scale (pos real)

library(ggplot2)

source("normal_generalized_function.R")

x_s <- seq(from = -4, to = 4, by = 0.1)
m_s <- c(0, 0, 0, 0, 0, 0)
a_s <- c(1, 1, 1, 1, 1, 1)
b_s <- c(0.5, 1, 1.5, 2, 3, 8)
raw_results1 <- amstat_normal_generalized_v1(x_s = x_s, m_s = m_s, 
                                             a_s = a_s, b_s = b_s)
print(head(raw_results1))

c_s <- c(0, 0, 0, 0, 0, 0)
a_s <- c(1, 1, 1, 1, 1, 1)
k_s <- c(-1, -0.5, 0, 0.5, 1)
# c_s <- c(0)
# a_s <- c(1)
# k_s <- c(0)
raw_results2 <- amstat_normal_generalized_v2(minx = -4, maxx = 4, c_s = c_s, 
                                             a_s = a_s, k_s = k_s)
print(head(raw_results2))

raw_results <- rbind(raw_results1, raw_results2)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + ylim(0, 0.7) +
  ggtitle(label = "Generalized Normal", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") +
  facet_wrap(~grp)
print(plot_obj)
