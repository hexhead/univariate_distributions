# gamma_log_function.R - Bill White - 5/19/19
# 
# https://reference.wolfram.com/language/ref/LogGammaDistribution.html
# 
# * supported over the interval  and parametrized by a non-negative real 
#   number μ (called a "location parameter") and by positive real numbers 
#   α and β (called "shape parameters")
# * either unimodal with a single "peak" (i.e. a global maximum) or monotone 
#   decreasing with a potential singularity approaching the lower boundary of 
#   its domain
# * distribution has tails that are "fat" in the sense that its PDF decreases 
#   algebraically rather than exponentially for large values of x
# * can be used as an approximation tool both to determine the independence of 
#   two sets of normally-distributed random variables as well as to test linear 
#   hypotheses regarding matrix regression coefficients
# * model a variety of phenomena including income distribution and arrival 
#   and departure times in queueing theory, and generalizations thereof have 
#   been used as prior distributions in Bayesian analysis to allow for the 
#   inclusion of prior knowledge regarding correlations between parameters 
#   when likelihood is non-normally distributed
#
# x_s - vector of numerics to evaluate (x values) (mu, inf)
# a_s - vector of numerics - alpha shape > 0
# b_s - vector of numerics - beta shape > 0
# m_s - vector of numerics - mu location > 0

source("gamma_function.R")

# Parameters:
# x_s - vector of numerics to evaluate (x values) (-inf, inf)
# a_s - vector of numerics - a - alpha
# b_s - vector of numerics - b - beta
amstat_gamma_log <- function(x_s, a_s, b_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    a_results <- lapply(a_s, function(a) {
      b_results <- lapply(b_s, function(b) {
        m_results <- lapply(m_s, function(m) {
          if (x < m) {
            y <- 0
          } else {
            n1 <- (b ^ -a)
            n2 <- (1 + x - m) ^ (-((1 + b) / b)) 
            n3 <- log(1 + x - m) ^ (-1 + a)
            den <- amstat_gamma(a)
            y <- (n1 * n2 * n3) / den
          }
          data.frame(x = x, 
                     y = y, 
                     Parameters = sprintf("alpha=%4.2f beta=%4.2f mu=%4.2f", 
                                          a, b, m))
        })
        do.call(rbind, m_results)
      })
      do.call(rbind, b_results)
    })
    do.call(rbind, a_results)
  })
  do.call(rbind, x_results)
}
