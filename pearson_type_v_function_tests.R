#!/usr/bin/env Rscript
#
# pearson_type_v_function_tests.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson type V distribution is an 
# inverse-gamma distribution.
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# (x ^ -m) * exp(-(x ^ -1)) - support (0 ≤ x < ∞)
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)
# m_s - vector of numerics - m - real > 0

library(ggplot2)

source("pearson_type_v_function.R")

x_s <- seq(from = 0.1, to = 10, by = 0.05)
m_s <- c(1, 1.5, 2, 3)
raw_results <- amstat_pearson_type_v(x_s = x_s, m_s = m_s)
head(raw_results)
subtitle <-  "Generalized gamma distribution or Chi-squared distribution"
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Pearson Type V", subtitle = subtitle) +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
