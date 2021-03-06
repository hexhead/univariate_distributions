# beta_binomial_function.R - Bill White - 2/5/19

# Examp[e paramters
# n <- 10
# k <- seq(from = 0, to = n)
# alphas <- c(0.2, 0.7, 2, 60)
# betas <- c(0.25, 2, 2, 40)

source("beta_function.R")
source("gamma_function.R")

amstat_beta_binomial_wiki <- function(k, n, a, b) {
  choose(n, k) * amstat_beta(a + k, n - k + b) / amstat_beta(a, b)
}

# implemented in terms of the beta distribution, and by using the 
# properties of the beta function, we can write the function in 
# terms of gamma functions
amstat_beta_binomial <- function(x, n, a, b) {
  gamma_method = "lanczos"
  fx_num <- 
    amstat_gamma(x + a, method = gamma_method) * 
    amstat_gamma(n - x + b, method = gamma_method) * 
    amstat_gamma(a + b, method = gamma_method) *
    amstat_gamma(n + 2, method = gamma_method)
  fx_den <- 
    (n + 1) * 
    amstat_gamma(x + a, method = gamma_method) * 
    amstat_gamma(a + b + n, method = gamma_method) * 
    amstat_gamma(a, method = gamma_method) * 
    amstat_gamma(b, method = gamma_method) *
    amstat_gamma(x + 1, method = gamma_method) * 
    amstat_gamma(n - x + 1, method = gamma_method)
  # cat(x, n, a, b, "\n", sep = "\t")
  # cat(fx_num, " \ " , fx_den, sep = " ")
  # cat(" = " , (fx_num / fx_den), "\n", sep = " ")
  fx_num / fx_den    
}
