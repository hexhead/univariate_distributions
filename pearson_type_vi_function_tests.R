#!/usr/bin/env Rscript
#
# pearson_type_vi_function_tests.R - Bill White - 3/8/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 2, non-negative discriminant: The Pearson type VI distribution is 
# a beta prime distribution or F-distribution.
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# x ^ -m * exp(x ^ -1) - support (0 ≤ x < ∞)
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) - (0 ≤ x < ∞)
# m_s - vector of numerics - m - real > 0

library(ggplot2)

source("pearson_type_vi_function.R")

x_s <- seq(from = 0, to = 10, by = 0.1)
m1_s <- c(2, 3, 4, 2, 3, 4)
m2_s <- c(0.5, 0.5, 0.5, 0.25, 0.25, 0.25)
raw_results <- amstat_pearson_type_vi(x_s = x_s, m1_s = m1_s, m2_s = m2_s)
head(raw_results)
subtitle <-  "Beta prime distribution or F-distribution"
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Pearson Type VI", subtitle = subtitle) +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
