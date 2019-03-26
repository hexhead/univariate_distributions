# lomax_function_tests.R - Bill White - 3/26/19
# 
library(ggplot2)

source("lomax_function.R")

# AMSTAT 2008:
# x_s - vector of numerics to evaluate (x values) > 0
# k_s - vector of numerics kappas
# l_s - vector of numerics lambdas
x_s <- seq(from = 0, to = 6, by = 0.1)
k_s <- c(2, 2, 1, 1)
l_s <- c(1, 2, 4, 6)
raw_results1 <- amstat_lomax(x_s = x_s, k_s = k_s, l_s = l_s)
raw_results1$Source = "AMSTAT"

# Wikipedia:
# x_s - vector of numerics to evaluate (x values) > 0
# a_s - vector of numerics alphas - shape > 0 (real)
# l_s - vector of numerics lambdas - scale > 0 (real)
raw_results2 <- wiki_lomax(x_s = x_s, a_s = k_s, l_s = l_s)
raw_results2$Source = "Wikipedia"
 
plot_data <- rbind(raw_results1, raw_results2)
head(plot_data)
plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() + xlab("x") + ylab("PDF") +
  ggtitle(label = "Lomax Distribution", 
          subtitle = "Probability Density Function") +
  scale_fill_continuous(name = "Parameters") + 
  facet_wrap(~Source)
print(plot_obj)
