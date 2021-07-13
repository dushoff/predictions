library(shellpipes)
library(dplyr)

bins <- 50

bindat <- (rdsRead()
	%>% arrange(x1)
	%>% mutate(NULL
		, bin=ceiling(row_number()*bins/nrow(.))
	)
	%>% group_by(bin)
	%>% summarize(NULL
		, x1=mean(x1)
		, x2=mean(x2)
		, y=mean(y)
	)
)

rdsSave(bindat)
