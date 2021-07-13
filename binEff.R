library(shellpipes)
library(tibble)
library(dplyr)
library(tidyr)

dat <- rdsRead()
quant <- seq(0.01, 0.99, by=0.01)
print(quant)

mod <- glm(y ~ x1 + x2, family="binomial", data=dat)
summary(mod)

qdat <- (dat
	%>% summarise(NULL
		, x1 = quantile(x1, quant)
		, x2 = quantile(x2, quant)
	)
)

cent <- qdat %>% mutate(x2 = mean(x2))
cent <- (cent
	%>% mutate(pred = , lc = predict(mod, newdata=cent)
	STOP!!
)
pred <- tibble(NULL
	, x = pull(qdat, x1)
	, lc = predict(mod, newdata=cent)
	, pc = plogis(lc)
	, lx = predict(mod, newdata=cross)
	, px = plogis(lx)
)

cross <- qdat %>% expand(x1, x2)

rdsSave(qdat)
