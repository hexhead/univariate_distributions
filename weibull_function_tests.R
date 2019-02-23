# weibull_function_tests.R - Bill White - 2/22/19
# https://www.wikiwand.com/en/Discrete_Weibull_distribution
# x_values - numeric vector of x vaklues to evalute
# alphas - scale - numeric vector greater tha zero
# betas - shape - numeric vector greater tha zero
# mu - location - numeric value
# https://reference.wolfram.com/language/ref/WeibullDistribution.html
# u - locations  - numeric vector
library(ggplot2)

source("weibull_function.R")

# positive real numbers
a_s <- c(1, 2)
b_s <- c(1, 2)
# any real numbers
# u_s <- c(-1.5, 1, 2)
u_s <- c(0)
x_s <- seq(from = u_s[1], to = 6, by = 0.1)
plot_data <- amstat_discrete_weibull_wolfram(x_values = x_s, 
                                             alphas = a_s, 
                                             betas = b_s, 
                                             mu = u_s)
head(plot_data, n = 10)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Discrete Weibull Distribution", 
          subtitle = "Probability Mass Function")
print(plot_obj)
