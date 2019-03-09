#!/usr/bin/env Rscript
#
# pearson_type_iii_function_tests.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson Type III distribution
# * The Pearson type III distribution is a generalized gamma distribution 
#   or chi-squared distribution.
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# x ^ m * exp(-x) - support (0 ≤ x < ∞)
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)
# m_s - vector of numerics - m - real > 0

library(ggplot2)

source("pearson_type_iii_function.R")

x_s <- seq(from = 0, to = 10, by = 0.1)
m_s <- c(0, 0.1, 0.25, 0.5, 1, 1.5, 2)
raw_results <- amstat_pearson_type_iii(x_s = x_s, m_s = m_s)
head(raw_results)
subtitle <-  "Generalized gamma distribution or chi-squared distribution"
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + ylim(0, 1) +
  ggtitle(label = "Pearson Type III", subtitle = subtitle) +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
