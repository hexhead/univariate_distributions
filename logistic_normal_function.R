# logistic_normal_function.R - Bill White - 3/17/19
#
# https://www.wikiwand.com/en/Logit-normal_distribution
# 
# In probability theory, a logit-normal distribution is a probability
# distribution of a random variable whose logit has a normal 
# distribution. If Y is a random variable with a normal distribution, 
# and P is the standard logistic function, then X = P(Y) has a logit-
# normal distribution; likewise, if X is logit-normally distributed, 
# then Y = logit(X)= log (X/(1-X)) is normally distributed. It is also
# known as the logistic normal distribution,[1] which often refers to
# a multinomial logit version 

# used in the function below
logit <- function(x) {
  log(x / (1 - x))
}

# Parameters: 
# x_s - vector of numerics to evaluate (x values) - (0, 1)
# s_s - vector of numerics - squared scale - real > 0
# m_s - vector of numerics - location - real
amstat_logistic_normal <- function(x_s, s_s, m_s) {
  x_results <- lapply(x_s, function(x) {
    ss_results <- lapply(1:length(s_s), function(i) {
      s <- s_s[i]
      m <- m_s[i]
      t1 <- 1 / (s * sqrt(2 * pi))
      t2 <- 1 / (x * (1 - x))
      t3 <- exp(-((((logit(x) - m) ^ 2)) / (2 * (s ^ 2)))) 
      y <- t1 * t2 * t3
      data.frame(x = x, y = y, 
                 Parameters = sprintf("sigma=%3.1f mu=%3.1f", s, m))
    })
    do.call(rbind, ss_results)
  })
  do.call(rbind, x_results)
}
