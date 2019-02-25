# normal_gaussian_function.R - Bill White - 2/25/19
# https://www.wikiwand.com/en/Normal_distribution

amstat_normal_gaussian <- function(x_s, m_s, s_s) {
  x_results <- lapply(x_s, function(x) {
    m_s_results <- lapply(seq_along(m_s), function(i) {
        y <- (1 / sqrt(2 * pi * s_s[i]) * exp(-1 / 2 * ((x - m_s[i]) ^ 2)))
        data.frame(x = x, 
                   y = y, 
                   Parameters = paste("mu", m_s[i], " sd=", s_s[i]))
      })         
      do.call(rbind, m_s_results)
  })
  do.call(rbind, x_results)
}
