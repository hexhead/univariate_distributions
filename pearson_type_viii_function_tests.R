# pearson_type_viii_function_tests.R - Bill White - 2/26/19
# 
# https://www.statisticshowto.datasciencecentral.com/pearson-distribution/
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) - 0 <= x <= 1
# m_s - vector of numerics - m

library(ggplot2)

source("pearson_type_viii_function.R")

x_s <- seq(from = 0, to = 1, by = 0.1)
m_s <- c(2, 3, 4)
raw_results <- amstat_pearson_type_viii(x_s = x_s, m_s = m_s)
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, 
                                    y = y, 
                                    colour = Parameters)) + 
  geom_line() +   xlab("x") + ylab("PDF") + 
  ggtitle(label = "Pearson Type VIII", 
          subtitle = "Probability Density Function") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)
