# uniform_function_tests.R - Bill White - 2/18/19
# https://en.wikipedia.org/wiki/Discrete_uniform_distribution

library(ggplot2)

source("uniform_function.R")

raw_results <- amstat_uniform(2, 4)

plot_data <- raw_results
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y)) + 
  geom_pointrange(size = 1, shape = 22, ymin = 0, ymax = plot_data$y) + 
  xlab("k") + ylab(expression("1 / n")) +
  ggtitle(label = "Uniform Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
