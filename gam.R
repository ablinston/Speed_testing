library(gam)

library(microbenchmark)
#ISLR package contains the 'Wage' Dataset
require(ISLR)

attach(Wage) #Mid-Atlantic Wage Data


gam1 <- gam::gam(wage ~ s(age, df = 6) + s(year, df = 6) + education, data = Wage)
#in the above function s() is the shorthand for fitting smoothing splines 

gc()

microbenchmark(
  predict(gam1, Wage),
  times = 500
)

# Have to load this later because it interferes with the gam function
library(mgcv)

gam2 <- mgcv::gam(wage ~ s(age, k = 6) + s(year, k = 6) + education, data = Wage)

gc()

microbenchmark(
  predict(gam2, Wage),
  times = 500
)
