#!/usr/bin/env Rscript
#
## pearson_type_i_function_tests.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson type I distribution
# The Pearson type I distribution (a generalization of the beta distribution) 
# arises when the roots of the quadratic equation (2) are of opposite sign, 
# that is, a_{1} < 0 < a_{2}. Then the solution p is supported on the 
# interval (a_{1}, a_{2}).
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# Type I => Beta-distribution of the first kind.
# (1 + x)^m1 * (1 – x)^m2
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (-1 ≤ x ≤ 1)
# m1_s - vector of numerics - m1 - shape similar to Beta(a, b)
# m1_s - vector of numerics - m2 - shape similar to Beta(a, b)

library(ggplot2)

source("pearson_type_i_function.R")

x_s <- seq(from = -1, to = 1, by = 0.05)
# negative pair gives "crooked" plots
# Are these in the domain of m1 and m2?
m1_s <- c(1, 2, 1, 1, 0.5, 0.5, 1)
m2_s <- c(1, 1, 2, 0.5, 1, 0.5, 3)
raw_results <- amstat_pearson_type_i(x_s = x_s, m1_s = m1_s, m2_s = m2_s)
head(raw_results)
# NOTE: ylim(0, 0.5) used below to match Wikipedia plot, 
# so we get get some ggplot warnings; increase ylim's second value
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type I", subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
