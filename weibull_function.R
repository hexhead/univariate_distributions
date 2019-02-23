# weibull_function.R - Bill White - 2/22/19

# https://en.wikipedia.org/wiki/Weibell_distribution
# where k > 0 is the shape parameter, λ > 0 is the scale parameter.
# interpolates between the exponential distribution (k = 1) and 
# the Rayleigh distribution (k = 2 and \lambda = \sqrt{2}\sigma [2]).

# https://www.wikiwand.com/en/Discrete_Weibull_distribution
# first described by Nakagawa and Osaki in 1975
# x_values - numeric vector of x vaklues to evalute
# alphas - scale - numeric vector greater tha zero
# betas - shape - numeric vector greater tha zero
# http://mathworld.wolfram.com/WeibullDistribution.html
amstat_discrete_weibull <- function(x_values, alphas = 1, betas = 0,
                                    mu = 0) {
  x_results <- lapply(x_values, function(x) {
    a_results <- lapply(alphas, function(a) {
      b_results <- lapply(betas, function(b) {
        f_x_alpha_beta <- 
          a * b ^ -a * 
          (x - mu) ^ (a - 1) * 
          exp(-(((x - mu) / b) ^ a))
        data.frame(x = x,
                   y = f_x_alpha_beta,
                   Parameters = paste("a =", a, ", b = ", b))
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
