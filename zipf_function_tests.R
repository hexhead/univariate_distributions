# zipf_function_tests.R - Bill White - 2/24/19
# https://www.wikiwand.com/en/Zipf%27s_law
# http://mathworld.wolfram.com/ZipfDistribution.html
# N is the total number of elements to evaluate

library(ggplot2)

source("zipf_function.R")

N <- 5
s_s <- seq(from = 1, to = N, by = 1)
a_s <- 1:4
raw_results <- amstat_zipf(x_s = s_s, a_s = a_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("k") + ylab("PMF") +
  ggtitle(label = "Zipf Distribution", 
          subtitle = "Probability Mass Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
