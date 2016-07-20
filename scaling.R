
library(dplyr)
library(NISTunits)

library(birk)

# NISTunits::NISTyardTOmeter()
# birk::conv_unit(x, from, to)
# Length: angstrom, nm, um, mm, cm, dm, m, km, inch, ft, yd, fathom, mi, naut_mi, au, light_yr, parsec, point

from = c("mm", "cm", "m", "inch", "ft", "yd") 
to = c("mm", "cm", "m", "inch", "ft", "yd")

cnvrt <- expand.grid(from = from, to = to, 
                     KEEP.OUT.ATTRS = FALSE, 
                     stringsAsFactors = FALSE) %>% 
  # non-standard evaluation: https://cran.r-project.org/web/packages/dplyr/vignettes/nse.html
  # remove equal units
  filter_(~!from == to)


a <- data.frame(a = 5, b = 4, f = "sum", stringsAsFactors=F)
get(a$f)(a$a, a$b)
