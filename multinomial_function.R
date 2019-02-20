# multinomial_function.R - Bill White - 2/18/19

amstat_multinomial <- function(x_counts = c(0, 1),
                               n_trials = 1,
                               p_k = c(0.5, 0.5)) {
  n_fact <- factorial(n_trials)
  (n_fact / factorial(x_counts)) * p_k
}
