

library(NISTunits)

NISTunits::NISTyardTOmeter(100)

a <- data.frame(a = 5, b = 4, f = "sum", stringsAsFactors=F)
get(a$f)(a$a, a$b)
