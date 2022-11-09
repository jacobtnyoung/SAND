rm(list = ls())
library(sna)
library(network)
library(RSiena)

### read in the network data.


# read in the full data file to get the attribute data.
load(url("https://www.jacobtnyoung.com/uploads/2/3/4/5/23459640/crj_605_networks_spring_2019_class_survey_data_w1_w2.rdata"))

# Create the covariate data.
gentrust <- coCovar(trust.net%v%"GenTrustt1")
netknow  <- coCovar(trust.net%v%"KnowNett1")

#Note that we have to treat this as a constant covariate since only have 2 waves of data.
# Let's actually create a difference score for the network knowledge question and plug that into our model.
dnetknow <- coCovar(trust.w2.net%v%"Know_Nett2" - trust.w2.net%v%"KnowNett1")


!!!here with work through




# Now, create the data object.
trust.data <- sienaDataCreate(trust,gentrust)

# Create the effects.
trust.effects <- getEffects(trust.data)
trust.effects <- includeEffects(trust.effects,transTrip,cycle3)
trust.effects <- includeEffects(trust.effects,egoX,interaction1="gentrust")

# Create and estimate the model.
trust.model   <- sienaModelCreate(projname = "Trust", useStdInits=TRUE, seed=605)
trust.results <- siena07(trust.model, data=trust.data, effects=trust.effects)

trust.results