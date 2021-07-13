library(shellpipes)
library(tibble)
library(dplyr)

set.seed(2121)

n <- 1e5
beta0 <- 1.5
beta1 <- 1
beta2 <- 2

pop <- tibble(NULL
	, x1 = rnorm(n)
	, x2 = rnorm(n)
	, lp = beta0 + beta1*x1 + beta2*x2
	, prob = plogis(lp)
	, y = rbinom(n, 1, prob)
)

dat <- (pop
	%>% select(x1, x2, y)
)

summary(dat)

rdsSave(dat)
