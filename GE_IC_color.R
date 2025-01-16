# Trophic Mode Palette
trophic_colors <- read_excel("./GE_IC_clarence_colors.xlsx", sheet="trophic")
trophicPalette<-as.vector(trophic_colors$color_code)
names(trophicPalette)<-trophic_colors$trophic_mode
trophicMode <- trophic_colors$trophic_mode

# Division Palette
treeColors <- read_excel("./GE_IC_clarence_colors.xlsx", sheet = "division") %>% select(division,color_hex)
treePalette<-as.vector(treeColors$color_hex)
names(treePalette)<-treeColors$division

# NMDS Palette
nmds_colors <- read_excel("./GE_IC_clarence_colors.xlsx", sheet="nmds")
nmdsPalette<-as.vector(nmds_colors$color_code)
names(nmdsPalette)<-nmds_colors$cluster

#Functional Palette
functionalTraits <- read_excel("./GE_IC_clarence_colors.xlsx", sheet="functional")
functionalPalette<- as.vector(functionalTraits$color_code)
names(functionalPalette) <- functionalTraits$functional_trait
functionalTraits <- functionalTraits$functional_trait

#substrate origin palette
originPalette <- c("#033f63","#fedc97","darkgrey")
originList <-  c("ice","water","non_specific")
names(originPalette) <- c("ice","water","non_specific")

#network edge palette
edgeRange <- read_excel("./GE_IC_clarence_colors.xlsx", sheet="edge")
edgePalette<- as.vector(edgeRange$color_code)
names(edgePalette) <- edgeRange$pos_bin