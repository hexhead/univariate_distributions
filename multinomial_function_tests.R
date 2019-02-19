# multinomial_function_tests.R - Bill White - 2/18/19

library(ggplot2)

source("multinomial_function.R")
amstat_multinomial()

event_probs <- c(0.25, 0.5, 0.25)
x_counts <- seq_along(event_probs) - 1
raw_results <- amstat_multinomial(x_counts = x_counts,
                                  p_k = event_probs, 
                                  n_trials = 1)
plot_data <- data.frame(x = x_counts, y = raw_results)
print(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y)) +
  geom_point(size = 2)
print(plot_obj)
