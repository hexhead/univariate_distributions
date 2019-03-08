# pearson_type_vii_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Pearson_distribution
# Case 1, negative discriminant: The Pearson type VII distribution
# Pearson type VII distribution subsumes the standard Student's t-distribution
# and also the standard Cauchy distribution.
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# l_s - vector of numerics - lambda - location - mean
# s_s - vector of numerics - sigma - scale - standard deviation
# Parameter m in Type IV skewness, here == 0
# g2_s - vector of numerics - gamma_2 - excess kurtosis
#
# Changes from Type IV
# v_s - vector of numerics - v - shape - skewness SET TO ZERO!
# m_s - vector of numerics - v - shape - kurtosis - 
#       has computed value in function,see wiki > 3/2

library(ggplot2)

source("pearson_type_vii_function.R")

x_s <- seq(from = -8, to = 8, by = 0.1)
l_s <- c(0)
s_s <- c(1, 2, 3)
g2_s <- c(4, 16, 64)
raw_results <- amstat_pearson_type_vii(x_s = x_s, l_s = l_s, s_s = s_s, g2_s = g2_s)
head(raw_results)
# NOTE: ylim(0, 0.5) used below to match Wikipedia plot, 
# so we get get some ggplot warnings; increase ylim's second value
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() +   xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type VII", subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters") + 
  geom_vline(xintercept = l_s, lty = 2)
print(plot_obj)
