library(shellpipes)
library(ggplot2); theme_set(theme_bw(base_size=18))

dat <- rdsRead("binEff")
bindat <- rdsRead("binbin")

summary(dat)

print(
	ggplot(dat)
	+ aes(x1, pred, color=method)
	+ geom_line()
	+ geom_point(data=bindat, aes(x=x1, y=y, color="binned"))
)
