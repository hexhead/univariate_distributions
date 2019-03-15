# IDB_function_tests.R - Bill White - 3/13/19
# 
# http://www.math.wm.edu/~leemis/chart/UDR/PDFs/IDB.pdf
#
# A distribution with one scale and two shape parameters is studied. The 
# distribution can describe increasing (I), decreasing (D), constant and 
# bathtub-shaped (B) failure rates. This motivates the working name, IDB 
# distribution.
# #
# Parameters:
# x_s - vector of numerics to evaluate (x values) > 0
# d_s = vector of numeric delta - scale parameter > 0
# k_s = vector of numeric kappa - shape parameter > 0
# g_s = vector of numeric gamma - shape parameter >= 0

library(ggplot2)

source("IDB_function.R")

x_s <- seq(from = 0.1 , to = 3, by = 0.1)
d_s <- c(2, 2, 1)
k_s <- c(1, 1, 10)
g_s <- c(5, 0, 2)
plot_data <- amstat_IDB(x_s = x_s, d_s = d_s, k_s = k_s, g_s = g_s)
print(head(plot_data, n = 10))

plot_obj <- ggplot(plot_data, aes(x = x, y = y, colour = Parameters)) + 
  geom_point() + geom_line() + xlab("x") + ylab("PDF - P(x;d,k,g") +
  ggtitle(label = "IDB Distribution", 
          subtitle = "Probability Density Function")
print(plot_obj)
