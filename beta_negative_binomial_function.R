# beta_negative_binomial_function.R - Bill White - 2/23/19

source("beta_function.R")
source("gamma_function.R")

# Parameters	
# \alpha >0 shape (real)
# \beta >0 shape (real)
# r > 0 — number of failures until the experiment is stopped
# https://www.wikiwand.com/en/Beta_negative_binomial_distribution
# Support	k ∈ {0, 1, 2, 3, ...}
amstat_beta_negative_binomial <- function(x_values, 
                                          alphas = 1, 
                                          betas = 0, 
                                          r_s = 0) {
  x_results <- lapply(x_values, function(k) {
    a_results <- lapply(alphas, function(a) {
      b_results <- lapply(betas, function(b) {
        r_results <- lapply(r_s, function(r) {
          part1 <- amstat_gamma(r + k) / (factorial(k) * amstat_gamma(r))
          
          part2 <-  amstat_beta(a + r, b + k) / amstat_beta(a, b)
          f_x_alpha_beta_r <- part1 * part2
          data.frame(x = k,
                     y = f_x_alpha_beta_r,
                     Parameters = paste("a =", a, ", b = ", b, "r =", r))
        })
        do.call(rbind, r_results)
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
