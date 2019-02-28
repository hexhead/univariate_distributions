# generalized_extreme_value_function.R - Bill White - 2/27/19
# 
# https://www.wikiwand.com/en/Generalized_extreme_value_distribution
#   
# Parameters:
# x_s - vector of numerics to evaluate (x values)
# m_s - vector of numerics -location - real
# s_s - vector of numerics - scale > 0
# xi_s - vector of numerics - shape - real
# * a family of continuous probability distributions developed within 
#   extreme value theory to combine the Gumbel, Fréchet and Weibull families 
#   also known as type I, II and III extreme value distributions
# * often used as an approximation to model the maxima of long (finite) 
#   sequences of random variables
# * known as the Fisher–Tippett distribution

# t(x) function needed by amstat_generalized_extreme_value
t_f <- function(x, m, s, xi) {
  result <- 0
  std_x <- (x - m) / s
  if (xi == 0) {
    result <- exp(-std_x)
  } else {
    result <- (1 + ((xi * std_x))) ^ (-1 / xi)
  }
  result
}

amstat_generalized_extreme_value <- function(x_s, m_s, s_s, xi_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      s_results <- lapply(s_s, function(s) {
        xi_results <- lapply(xi_s, function(xi) {
          valid_x <- TRUE
          cutoff <- (m - s) / xi
          valid_x_value <- x
          if (xi > 0) {
            if (x <= cutoff) {
              valid_x <- FALSE
              valid_x_value <- cutoff
            }
          } else {
            if (xi < 0) {
              if (x >= cutoff) {
                valid_x <- FALSE
                valid_x_value <- cutoff
              }
            }
          }
          # was a new x needed to deal with the constraints?
          if (valid_x) {
            y <- (1 / s) * 
              (t_f(valid_x_value, m, s, xi) ^ (xi + 1)) * 
              exp(-t_f(valid_x_value, m, s, xi))
          } else {
            valid_x_value <- cutoff
            y <- 0
          }
          data.frame(x = valid_x_value, y = y, 
                     Parameters = 
                       sprintf("m=%4.2f s=%4.2f xi=%4.2f", 
                               m, s, xi))
        })
        do.call(rbind, xi_results)
      })
      do.call(rbind, s_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
