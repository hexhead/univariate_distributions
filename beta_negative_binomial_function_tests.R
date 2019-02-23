# beta_negative_binomial_function_tests.R - Bill White - 2/23/19

library(ggplot2)

source("beta_negative_binomial_function.R")

# positive real numbers
a_s <- c(1, 2)
b_s <- c(1, 2)
r_s <- seq(from = 1, to = 6, by = 1)
x_s <- seq(from = 1, to = 6, by = 0.1)
plot_data <- amstat_beta_negative_binomial(x_values = x_s, 
                                           alphas = a_s, 
                                           betas = b_s, 
                                           r_s = r_s)
head(plot_data, n = 10)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Beta Negative Binomial Distribution", 
          subtitle = "Probability Mass Function")
print(plot_obj)
