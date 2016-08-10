# dashboard
library(shiny)
library(shinydashboard)
# unit conversion
library(measurements)
# datatable
library(DT)

# birk::conv_unit(x, from, to)
# Length: angstrom, nm, um, mm, cm, dm, m, km, inch, ft, yd, fathom, mi, naut_mi, au, light_yr, parsec, point

l.units <- c("mm", "cm", "m", "inch", "ft", "yd") 

from.units <- l.units
to.units <- l.units

# dta <- data.frame(
#   from_unit = vector("character", length = 1),
#   to_unit = vector("character", length = 1),
#   scale_factor = vector("character", length = 1), 
#   from_length = vector("numeric", length = 1), 
#   to_length = vector("numeric", length = 1),
#   stringsAsFactors = FALSE
# )

dta <- data.frame(
  from_unit = NULL,
  to_unit = NULL,
  scale_factor = NULL, 
  from_length = NULL, 
  to_length = NULL,
  stringsAsFactors = FALSE
)