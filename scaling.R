
library(dplyr)
#library(NISTunits)

library(birk)

# birk::conv_unit(x, from, to)
# Length: angstrom, nm, um, mm, cm, dm, m, km, inch, ft, yd, fathom, mi, naut_mi, au, light_yr, parsec, point

from = c("mm", "cm", "m", "inch", "ft", "yd") 
to = c("mm", "cm", "m", "inch", "ft", "yd")

birk::conv_unit(10, "m", "yd")


