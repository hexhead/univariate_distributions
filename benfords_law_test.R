# benfords_law_test.R - Bill White - 1/19/19

source("benfords_law.R")

x <- seq_len(9)
y <- mapply(x, FUN = fx_benford)
plot(x, y, type = 'h', main = "Benford's Law First Digit Distrubution",
     xlab = 'k', ylab = 'P_k [%]')
