# normal_gaussian_function.R - Bill White - 2/24/19

amstat_normal_gaussian <- function(x_s, m_s, s_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(m_s, function(m) {
      s_results <- lapply(s_s, function(s) {
        y <- (1 / sqrt(2 * pi * s) * exp(-1 / 2 * ((x - m) ^ 2)))
        data.frame(x = x, y = y, Parameters = paste("mean =", m, "sd = ", s))
      })         
      do.call(rbind, s_results)
    })
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
