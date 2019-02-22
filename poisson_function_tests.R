# poisson_function_tests.R - Bill White - 2/18/19
# https://en.wikipedia.org/wiki/Poisson_distribution

library(ggplot2)

source("poisson_function.R")

# k is the number of occurrences (support)
# r rate λ is the expected number of occurrences, which need not be an integer
k_s <- seq.int(from = 0, to = 20, by = 1)
r_s <- c(1, 4, 10)
raw_results <- amstat_poisson(k = k_s, r = r_s)
plot_data <- do.call(rbind, raw_results)
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("k") + ylab("P(X=k)") +
  ggtitle(label = "Poisson Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
