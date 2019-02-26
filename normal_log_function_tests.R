# normal_log_function_tests.R - Bill White - 2/26/19
# 
# https://www.wikiwand.com/en/Log-normal_distribution
# 
# * continuous probability distribution of a random variable whose logarithm 
#   is normally distributed
# * takes only positive real values
# * occasionally referred to as the Galton distribution
# * distribution is the maximum entropy probability distribution for a 
#   random variate X for which the mean and variance of ln(X) are specified
# * process is the statistical realization of the multiplicative product of 
#   many independent random variables, each of which is positive
# * distribution is the maximum entropy probability distribution for a 
#   random variate X for which the mean and variance of ln(X) are specified
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics for the averages (mu's)
# v_s - vector of numerics for  variances

library(ggplot2)

source("normal_log_function.R")

x_s <- seq(from = 0.1, to = 3, by = 0.05)
m_s <- c(0, 0, 0)
v_s <- c(0.25, 0.5, 1.0) ^ 2
raw_results <- amstat_normal_log(x_s = x_s, m_s = m_s, v_s = v_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_point() + geom_line() + 
  xlab("x") + ylab("PMF") +
  ggtitle(label = "Log-Normal Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")

print(plot_obj)
