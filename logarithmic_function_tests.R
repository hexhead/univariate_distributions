# logarithmic_function_tests.R - Bill White - 2/23/19

library(ggplot2)

source("logarithmic_function.R")

# positive real numbers
p_s <- c(0.33, 0.69, 0.99)
k_s <- seq(from = 1, to = 6, by = 1)
plot_data <- amstat_logarithmic(p_s = p_s, k_s = k_s)
head(plot_data, n = 10)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PMF") +
  ggtitle(label = "Logarithmic Distribution", 
          subtitle = "Probability Mass Function")
print(plot_obj)
