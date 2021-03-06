# weibull_function.R - Bill White - 2/22/19

# http://mathworld.wolfram.com/WeibullDistribution.html
# represents a Weibull distribution with shape parameter α, scale 
# parameter β, and location parameter μ.
amstat_discrete_weibull_wolfram <- function(x_values, 
                                            alphas = 1, 
                                            betas = 0, 
                                            mu = 0) {
  x_results <- lapply(x_values, function(x) {
    a_results <- lapply(alphas, function(a) {
      b_results <- lapply(betas, function(b) {
        if (x <= mu) {
          f_x_alpha_beta <- 0
        } else {
          # x > mu
          f_x_alpha_beta <- 
            ((x - mu) ^ (a - 1)) * 
            (exp(-((x - mu) / b) ^ a))
        }
        data.frame(x = x,
                   y = f_x_alpha_beta,
                   Parameters = paste("a =", a, ", b = ", b, "u =", mu))
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}

# https://www.wikiwand.com/en/Discrete_Weibull_distribution
# first described by Nakagawa and Osaki in 1975
# x_values - numeric vector of x vaklues to evalute
# alphas - scale - numeric vector greater tha zero
# betas - shape - numeric vector greater tha zero
amstat_discrete_weibull_first <- function(x_values, alphas = 1, betas = 0, mu = 0) {
  x_results <- lapply(x_values, function(x) {
    a_results <- lapply(alphas, function(a) {
      b_results <- lapply(betas, function(b) {
        f_x_alpha_beta <- 
          (a * b ^ -a * 
             (x - mu) ^ (a - 1) * 
             exp(-(((x - mu) / b) ^ a))) /
          b
        data.frame(x = x,
                   y = f_x_alpha_beta,
                   Parameters = paste("a =", a, ", b = ", b, "u =", mu))
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}

# https://en.wikipedia.org/wiki/Weibell_distribution
# where k > 0 is the shape parameter, λ > 0 is the scale parameter.
# interpolates between the exponential distribution (k = 1) and 
# the Rayleigh distribution (k = 2 and \lambda = \sqrt{2}\sigma [2]).
