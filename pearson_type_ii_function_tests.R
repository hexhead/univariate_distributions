#!/usr/bin/env Rscript
#
# pearson_type_ii_function_tests.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson Type II distribution
# * The Pearson Type II Curve is used in computing the table of significant 
#   correlation coefficients for Spearman's rank correlation coefficient when 
#   the number of items in a series is less than 100 (or 30, depending on some 
#   sources). After that, the distribution mimics a standard Student's 
#   t-distribution. For the table of values, certain values are used
#   as the constants.
# * The Pearson type II distribution is a special case of the Pearson type I 
#   family restricted to symmetric distributions.
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# (1 – x ^ 2) ^ m - support (-1 ≤ x ≤ 1)
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (-1 ≤ x ≤ 1)
# m_s - vector of numerics - m - integers > 0

library(ggplot2)

source("pearson_type_ii_function.R")

x_s <- seq(from = -1, to = 1, by = 0.01)
m_s <- c(1:5, 10, 20, 50, 100)
raw_results <- amstat_pearson_type_ii(x_s = x_s, m_s = m_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type II - Symmetric Type I", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
