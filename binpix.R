library(shellpipes)
library(ggplot2); theme_set(theme_bw(base_size=18))

dat <- rdsRead()

summary(dat)

print(
	ggplot(dat)
	+ aes(x1, pc)
	+ geom_line()
	+ geom_line(aes(x1, px))
)
