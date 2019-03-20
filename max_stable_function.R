# max_stable_function.R - Bill White - 5/19/19
# 
# https://reference.wolfram.com/language/ref/MaxStableDistribution.html
# 
# also known as Fisher–Tippet distribution
#
# represents a generalized maximum extreme value distribution with 
# location parameter μ, scale parameter σ, and shape parameter ξ
#
# MaxStableDistribution[μ,σ,ξ] represents a continuous statistical distribution
# supported on the set of real numbers  satisfying  and parametrized by a
# positive real number σ (a "scale parameter") and real numbers μ and ξ (a
# "location parameter" and a "shape parameter", respectively). Together, these
# parameters determine the overall behavior of its probability density function
# (PDF). In general, the PDF of a max-stable distribution is unimodal with a
# single "peak" (i.e. a global maximum), with its overall shape (height, spread,
# and horizontal location of its maximum) determined by the values of μ, σ, and
# ξ. In addition, the tails of the PDF are "fat" in the sense that the PDF
# decreases non-exponentially for large values . (This behavior can be made
# quantitatively precise by analyzing the SurvivalFunction of the distribution.)
# Along with the min-stable distribution, the max-stable distribution is a
# so-called "extreme value distribution" and may be referred to as the
# generalized maximum extreme value distribution, a type-1 extreme value
# distribution (not to be confused with ExtremeValueDistribution), a Gumbel
# maximum distribution (not to be confused with GumbelDistribution), and a
# Fisher–Tippet distribution.
#
# x_s - vector of numerics to evaluate (x values) (mu, inf)
# m_s - vector of numerics - mu location > 0
# s_s - vector of numerics - sigma scale > 0
# e_s - vector of numerics - xi shape > 0

amstat_max_stable <- function(x_s, m_s, s_s, e_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      s_results <- lapply(s_s, function(s) {
        e_results <- lapply(e_s, function(e) {
          z <- (x - m) / s
          if (e == 0) {
            y <- (exp(-(exp(-z)) - z)) / s
          } else {
            z_scaled <- z <- ((x - m) * e) / s
            if ((1 + z_scaled) > 0) {
              t1 <- exp(-((1 + z_scaled)) ^ (-1 / e))
              t2 <- (1 + z_scaled) ^ (-1 - (1 / e))
              y <- (t1 * t2) / s
            } else {
              y <- 0
            }
          }
          data.frame(x = x, 
                     y = y, 
                     Parameters = sprintf("mu=%4.2f sigma=%4.2f xi=%4.2f", 
                                          m, s, e))
        })
        do.call(rbind, e_results)
      })
      do.call(rbind, s_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
