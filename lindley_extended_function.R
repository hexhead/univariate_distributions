# lindley_extended_function.R - Bill White - 3/1/19
# 
# https://pdfs.semanticscholar.org/8d93/16b4c6e0531691bfbd0d2ff64171e1338927.pdf?_ga=2.145618035.671455799.1551491570-1893639000.1551491570# 
# 
# extended Lindley distribution (EL)
# Parameters: 
# x_s - vector of numerics to evaluate (x values)
# a_s - vector of numerics - alpha (0, 1)
# b_s - vector of numerics - beta >= 0
# l_s - vector of numerics - lambda > 0
# EL, a == b == 1 => EL => standard Lindley distribution
amstat_lindley_extended <- function(x_s, a_s, b_s, l_s) {
  x_results <- lapply(x_s, function(x) {
    abl_results <- lapply(1:length(a_s), function(i) {
    a <- a_s[i]
    b <- b_s[i]
    l <- l_s[i]
      t1 <- (l * (1 + l + (l * x)) ^ (a - 1)) / ((1 + l) ^ a)
      t2 <- (b * (1 + l + (l * x)) * ((l * x) ^ (b - 1)) - a)
      t3 <- exp(-((l * x) ^ b))
      y <- t1 * t2 * t3
      #print(sprintf("t1=%f t2=%f t3=%f y=%f", a, b, l, y))
      data.frame(x = x, y = y, 
                 Parameters = sprintf("a=%4.2f b=%4.2f l=%4.2f", 
                                      a, b, l))
    })
    do.call(rbind, abl_results)
  })
  do.call(rbind, x_results)
}
