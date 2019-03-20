# von_mises_function.R - Bill White - 5/20/19
# 
# https://www.wikiwand.com/en/Von_Mises_distribution
#
# * In directional statistics, the von Mises–Fisher distribution (named after
#   Ronald Fisher and Richard von Mises), is a probability distribution on the
#   (p-1)-dimensional sphere in \mathbb {R} ^{p}. If p=2 the distribution 
#   reduces to the von Mises distribution on the circle.
# * also known as the circular normal distribution or Tikhonov distribution
# * continuous probability distribution on the circle
# * the stationary distribution of a drift and diffusion process on the circle 
#   in a harmonic potential, i.e. with a preferred orientation
# * the maximum entropy distribution for circular data when the real and 
#   imaginary parts of the first circular moment are specified
# * special case of von Mises–Fisher distribution on the N-dimensional sphere
# * μ is a measure of location (the distribution is clustered around μ)
# * \kappa  is a measure of concentration (a reciprocal measure of dispersion, 
#   so 1/\kappa is analogous to σ2
# * probability density can be expressed as a series of Bessel functions
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) (0, 2*pi)
# m_s - vector of numerics - mu location - real
# k_s - vector of numerics - sigma scale > 0

amstat_von_mises <- function(x_s, m_s, k_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      k_results <- lapply(k_s, function(k) {
        y <- exp(k * cos(x - m)) / (2 * pi * besselI(k, 0))
        data.frame(x = x, 
                   y = y, 
                   Parameters = sprintf("mu=%4.2f kappa=%4.2f", m, k))
      })
      do.call(rbind, k_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
