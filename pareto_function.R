# pareto_function.R - Bill White - 2/28/19
# 
# https://www.wikiwand.com/en/Pareto_distribution

# If X is a random variable with a Pareto (Type I) distribution, 
# then the probability that X is greater than some number x, i.e. 
# the survival function (also called tail function), is given by
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics - xm_s
# a_s - vector of numerics - alphas
amstat_pareto_typeI <- function(x_s, m_s, a_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      a_results <- lapply(a_s, function(a) {
        if (x < m) {
          y <- 0
        } else {
          y <- (a * (m ^ a)) / (x ^ (a + 1))  
        }
        data.frame(x = x, y = y, 
                   Parameters = sprintf("a=%4.2f", a),
                   facet = sprintf("m=%4.2f", m))
      })
      do.call(rbind, a_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
