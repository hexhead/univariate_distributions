# error_function_tests.R - Bill White - 3/11/19

# Parameters:
# x_s - vector of numerics x-axis values  x = [0, inf) 
# n_s - vector of numerics - selects generalized error function E_n(x)

library(ggplot2)

source("error_function.R")

# other attempts:
# Abramowitz and Stegun
#raw_results <- amstat_error_as(z_s = x_s)
# x_s <- seq(from = -3, to = 3, by = 0.1)
#n_s <- 1:4
#
#raw_results <- amstat_error_en_x(x_s = x_s, n_s = n_s)

#raw_results <- amstat_error_erf_x(x_s = x_s)

# https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Error_function.html
x_s <- seq(from = -3, to = 3, by = 0.05)
raw_results <- amstat_error_generalized(x_s = x_s, n_s = c(1:4, 4.25))
head(raw_results)
plot_obj <- ggplot(raw_results, aes(x = x, y = y, colour = Parameters)) + 
  geom_line() +
  xlab("x") + ylab("E_n(x)") + ylim(-3, 3) +
  ggtitle(label = "Generalized Error E_n(x) functions", 
          subtitle = "1 = straight line, 2 = erf(x),... other not characterized") +
  scale_fill_discrete(name = "Parameters")
print(plot_obj)

# y_s <- amstat_error_stackexchange(0.2, 0.25, x_s)
# plot(x_s, y_s, type = 'l')
