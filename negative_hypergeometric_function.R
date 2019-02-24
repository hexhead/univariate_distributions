# negative_hypergeometric_function.R - Bill White - 2/19/19
# https://www.wikiwand.com/en/Negative_hypergeometric_distribution
# k is the number of successes when experiment is stopped
# N is the total number of elements {0, 1, 2, ...}
# K is total number of 'success' elements {0, 1, 2, ..., N}
# r is the number of failures when experiment is stopped {0, ..., K}
# analogous to the Negative Binomial distribution for the binomial 
# process and the Gamma distribution for the Poisson process. 
amstat_negative_hypergeometric <- function(ks, Ns, Ks, rs) {
  k_results <- lapply(ks, function(k) {
    N_results <- lapply(Ns, function(N) {
      K_results <- lapply(Ks, function(K) {
          r_results <- lapply(rs, function(r) {
            f_x_params <- 
              (choose(k + r - 1, k) * choose(N - r - k, K - k)) / 
              choose(N, K)
            data.frame(x = k,
                       y = f_x_params,
                       Parameters = paste("N =", N, "K =", K, "r =", r))
          })
          do.call(rbind, r_results)
        })
      do.call(rbind, K_results)
    })
    do.call(rbind, N_results)
  })
  do.call(rbind, k_results)
}
