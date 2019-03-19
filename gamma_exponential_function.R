# gamma_exponential_function.R - Bill White - 3/18/19

source("gamma_function.R")

# ttps://reference.wolfram.com/language/ref/ExpGammaDistribution.html
#
# * also known as generalized extreme value distribution 
# * the tails of the PDF are "fat", in the sense that the PDF decreases 
#   algebraically rather than decreasing exponentially for large values of x 
# * also significant because of the so-called (statistical) extreme value 
#   theorem, which states that the maximum of a sample of independent and 
#   identically distributed random variables can only converge in distribution 
#   to one of three possible distributions (GumbelDistribution, 
#   FrechetDistribution, and WeibullDistribution), all of which are special 
#   cases of ExpGammaDistribution
# * has been used in various branches of science to model a number of
#   phenomena, including wind speeds in meteorology and ocean current speeds 
#   in ocean engineering
#
# Parameters: x_s - vector of numerics to evaluate (x values) - defined on the
# set of real numbers k_s - vector of numerics - kappa -shape real > 0 height
# t_s - vector of numerics - theta -scale > 0 steepness m_s - vector of numerics
# - mu - horizontal location of the "peak" (i.e. absolute maximum)
amstat_gamma_exponential <- function(x_s, k_s, t_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    k_results <- lapply(1:length(k_s), function(i) {
      k <- k_s[i]
      t <- t_s[i]
      m <- m_s[i]
      num <- exp(-exp((x - m) / t) + ((k * (x - m)) / t))
      den <- t * amstat_gamma(k)
      y <- num / den
      data.frame(x = x, y = y, 
                 Parameters = sprintf("kappa=%4.2f theta=%4.2f mu=%4.2f", 
                                      k, t, m))
    })
    do.call(rbind, k_results)
  })
  do.call(rbind, x_results)
}
