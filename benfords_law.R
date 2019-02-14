# benfords_law.R - Bill White - 1/19/19

# https://www.wikiwand.com/en/Benford%27s_law
fx_benford <- function(x) {
    log10(1 + 1 / x)
}
