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
	%>% mutate(NULL
		, pred = predict(mod, newdata=., type="response")
	)
	%>% select(-x2)
)

cross <- (qdat
	%>% expand(x1, x2)
	%>% mutate(NULL
		, pred = predict(mod, newdata=., type="response")
	)
	%>% group_by(x1)
	%>% summarize(pred=mean(pred))
)

pred <- bind_rows(centered=cent, crossed=cross, .id="method")

summary(pred)

rdsSave(pred)
