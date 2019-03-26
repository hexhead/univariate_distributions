# makeham_function.R - Bill White - 3/26/19
#
# https://reference.wolfram.com/language/ref/GompertzMakehamDistribution.html
#
# [λ,ξ,θ,α] represents a continuous statistical distribution defined over the
# interval  and parametrized by two non-negative real numbers θ and α and two
# positive real numbers λ and ξ called a "scale parameter" and a "frailty
# parameter", respectively. The overall behavior of the probability density
# function (PDF) of a Gompertz–Makeham distribution is determined by the values
# of the parameters λ, ξ, θ, and α, and in particular the PDF may be either
# monotonically decreasing with a potential singularity approaching the lower
# boundary of its domain or unimodal. In addition, depending on its parameters,
# the tails of the PDF may be either "fat" or "thin", in the sense that the PDF
# may decrease either algebraically or exponentially for large values of . (This
# behavior can be made quantitatively precise by analyzing the SurvivalFunction
# of the distribution.) The two-parameter version of the distribution
# GompertzMakehamDistribution[λ,ξ] is often referred to as the Gompertz
# distribution and is equivalent to GompertzMakehamDistribution[λ,ξ,0,0].
#
# Parameters:
# x_s - vector of numerics to evaluate (x values) > 0
# l_s - vector of numerics - lambda
# xi_s -vector of numerics - xi
# t_s - vector of numerics - theta
# a_s - vector of numerics - alpha
amstat_makeham <- function(x_s, l_s, xi_s, t_s, a_s) {
  x_results <- lapply(x_s, function(x) {
    l_results <- lapply(l_s, function(l) {
      xi_results <- lapply(xi_s, function(xi) {
        t_results <- lapply(t_s, function(t) {
          a_results <- lapply(a_s, function(a) {
            t1 <- exp(-(-1 + exp(x * l) + x * t * l + x ^ 2 * l ^ 2)) * xi
            t2 <- l * (exp(x * l) + t + 2 * x * a * l) * xi
            y <- t1 * t2
            data.frame(x = x, y = y, 
                       Parameters = sprintf("lambda=%5.2f xi=%5.2f theta=%5.2f alpha=%5.2f", 
                                            l, xi, t, a))
          })
          do.call(rbind, a_results)
        })
        do.call(rbind, t_results)
      })
      do.call(rbind, xi_results)
    })
    do.call(rbind, l_results)
  })
  do.call(rbind, x_results)
}
