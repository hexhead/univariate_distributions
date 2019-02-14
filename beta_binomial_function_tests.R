# beta_binomial_function_tests.R - Bill White - 2/5/19

source("beta_binomial_function.R")

# ----------------------------------------------------------------------------
n <- 10
k <- seq(from = 0, to = n)
alphas <- c(0.2, 0.7, 2, 60)
betas <- c(0.25, 2, 2, 40)

plot_lists <- lapply(seq_len(length(alphas)), function(param_idx) {
  unlist(lapply(k, function(k_i) { 
    amstat_beta_binomial_wiki(k_i, n, alphas[param_idx], betas[param_idx])
  }))
})

series_labels <- c(paste('params', seq_len(length(alphas)), sep = ""))
series_colors <- rainbow(length(alphas))
series_pchs <- rep(16, length(alphas))
series_types <- rep('l', length(alphas))

x_vals <- seq_along(plot_lists[[1]])
plot(x_vals, plot_lists[[1]], 
     xlab = 'Domain Values k', 
     ylab = 'Beta-Binomial Distribution Value for Input k',
     ylim = c(0, 0.4),
     main = 'Beta-Binomial\nProbability Density Function', 
     type = series_types[1], pch = series_pchs[1], col = series_colors[1])
legend("topright", title = "alpha, beta",
       legend = unlist(lapply(seq_len(length(alphas)), FUN = function(idx) {
         sprintf("%3.1f, %3.1f", alphas[idx], betas[idx])
       })), 
       col = series_colors, 
       pch = series_pchs)
points(x_vals, plot_lists[[2]], 
       type = series_types[2], 
       pch = series_pchs[2], 
       col = series_colors[2])
points(x_vals, plot_lists[[3]], 
       type = series_types[3], 
       pch = series_pchs[3], 
       col = series_colors[3])
points(x_vals, plot_lists[[4]], 
       type = series_types[4], 
       pch = series_pchs[4], 
       col = series_colors[4])
