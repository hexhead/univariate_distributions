# skellum_function_tests.R - Bill White - 3/6/19
# 
# Test the skellum implementations by comparing ggplot to web site references.

library(ggplot2)

source("skellum_function.R")

# https://www.vosesoftware.com/riskwiki/skellumdistribution.php
# * The Skellam distribution models the difference between two independent 
#   Poisson distributed variables as follows:
# * Skellam(λ1, λ2) = Poisson(λ1) - Poisson(λ2)
# * has a number of uses, essentially relating to the above formula. For example 
#   the difference in number of accidents (or murders, strikes, catastrophes, 
#   etc. – anything that occurs randomly in time) between, for example, 
#   two cities, two populations, two years, etc – where it is assumed that the 
#   expected rate of occurrence for the two variables are λ1 and λ2
#
# # Parameters:
# x_s - vector of numeric (x values) - -inf <= -..., 1, 0, 1, ... <= inf
# l1_s = vector of numeric - lambda1 > lambda 2
# l2_s - vector of numeric - > 0
x_s <- seq(from = -10, to = 10, by = 1)
l1_s <- c(1, 4, 1)
l2_s <- c(1, 1, 4)
raw_results_vose <- vose_skellum(x_s = x_s, l1_s = l1_s, l2_s = l2_s)
head(raw_results_vose)
plot_obj_vose <- ggplot(raw_results_vose, aes(x = x, y = y, 
                                              colour = Parameters)) + 
  geom_point() + geom_line() +
  xlab("x") + ylab("PMF") +
  ggtitle(label = "Vose Skellum Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj_vose)
