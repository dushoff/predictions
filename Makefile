## This is predictions

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.R)

autopipeR = defined

## Simulate binomial data with two fixed effects
binSim.Rout: binSim.R

## bin the data to get points for comparison
binbin.Rout: binbin.R binSim.rds

binEff.Rout: binEff.R binSim.rds

binpix.Rout: binpix.R binEff.rds binbin.rds

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff

## Want to chain and make makestuff if it doesn't exist
## Compress this ¶ to choose default makestuff route
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls makestuff/Makefile

-include makestuff/os.mk

-include makestuff/pipeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
