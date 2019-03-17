# nakagami_function.R - Bill White - 3/16/19
# 
# https://www.wikiwand.com/en/Nakagami_distribution
# https://reference.wolfram.com/language/ref/NakagamiDistribution.html
# 
# * The Nakagami distribution or the Nakagami-m distribution is a probability 
#   distribution related to the gamma distribution. The family of Nakagami 
#   distributions has two parameters: a shape parameter {\displaystyle m\geq 1/2} 
#   and a second parameter controlling spread {\displaystyle \Omega >0}.
# * Restricting m to the unit interval (q = m; 0 < q < 1) defines the Nakagami-
#   q distribution, also known as Hoyt distribution
# * mathematical model for small-scale fading in long-distance high-frequency 
#   radio wave propagation
# * used to model phenomena related to medical ultrasound imaging, 
#   communications engineering, and meteorology
# * also been used in various other fields, including hydrology, multimedia, 
#   and seismology
# 
# Parameters:
# x_s - vector of numerics to evaluate (x values) [0, inf)]
# m_s - vector of numerics mu - shape >= 0.5
# w_s - vector of numerics omega - spread > 0

source("gamma_function.R")

amstat_nakagami <- function(x_s, m_s, w_s) {
  x_results <- lapply(x_s, function(x) {
    m_results <- lapply(seq_along(m_s), function(i) {
      m <- m_s[i]
      w <- w_s[i]
      # t1 <- ((2 * m) ^ m) / (amstat_gamma(m) * (w ^ m))
      # t2 <- x ^ ((2 * m) - 1)
      # t3 <- exp(-((m / w) * (x ^ 2)))
      # https://reference.wolfram.com/language/ref/NakagamiDistribution.html
      t1 <- 2 * exp(-((x ^ 2) * (m / w)))
      t2 <- x^(-1 + (2 * m))
      t3 <- (m / w) ^ m
      y <- (t1 * t2 * t3) / amstat_gamma(m)
      data.frame(x = x, y = y, 
                 Parameters = sprintf("mu=%3.1f omega=%3.1f ", m, w))
    })         
    do.call(rbind, m_results)
  })
  do.call(rbind, x_results)
}
