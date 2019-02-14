# beta_function.R - Bill White - 2/1/19

source("gamma_function.R")

# ----------------------------------------------------------------------------
# the beta distribution is a family of continuous probability distributions 
# defined on the interval [0, 1] parametrized by two positive shape parameters, 
# denoted by α and β, that appear as exponents of the random variable and 
# control the shape of the distribution. 
amstat_beta <- function(a, b) {
  (amstat_gamma(a) * amstat_gamma(b)) / amstat_gamma(a + b)
}

amstat_beta_pdf <- function(x, a, b) {
  abd <- amstat_beta(a, b)
  (x^(a - 1) * (1 - x) ^ (b - 1)) / abd
}
