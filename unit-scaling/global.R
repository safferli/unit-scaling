# dashboard
library(shiny)
library(shinydashboard)
# unit conversion
library(birk)

# birk::conv_unit(x, from, to)
# Length: angstrom, nm, um, mm, cm, dm, m, km, inch, ft, yd, fathom, mi, naut_mi, au, light_yr, parsec, point

l.units <- c("mm", "cm", "m", "inch", "ft", "yd") 

from.units <- l.units
to.units <- l.units
