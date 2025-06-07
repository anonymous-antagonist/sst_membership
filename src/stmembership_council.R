library(sf)
library(tidyverse)
library(mapview)
library(RColorBrewer)

#read in council shapefile
ccs<-st_read("data/Council_Districts.shp")

#create datframe with council districts and membership 
#(could be replaced with datafile)
stm <- data.frame(c(as.character(seq(1:8))),c(24,14,28,288,30,54,79,2))

#change column names of membership df
colnames(stm) <- c("DISTNUM","members")

#merge council sf with membership df
ccs_stm <- merge(ccs,stm,by="DISTNUM")                    

#mapview
mapview(ccs_stm, zcol="members",col.regions=brewer.pal(10,"YlOrRd"),
        layer.name="Number of Members - 205 Outside Sac")


