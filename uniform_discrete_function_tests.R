# uniform_discrete_function_tests.R - Bill White - 2/18/19
# https://en.wikipedia.org/wiki/Discrete_uniform_distribution

library(ggplot2)

source("uniform_discrete_function.R")

a <- 2
b <- 4
raw_results <- amstat_uniform_discrete(a, b)

plot_data <- raw_results
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y)) + 
  geom_pointrange(size = 1, shape = 22, ymin = 0, ymax = plot_data$y) + 
  xlab("k") + ylab(expression("1 / n")) +
  ggtitle(label = 
            sprintf("Uniform Discrete Distribution, Parameters: a = %2.0f,  b = %2.0f", 
                    a, b), 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
