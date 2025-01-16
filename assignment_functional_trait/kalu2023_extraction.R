setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

kalu <- read_excel("./kalu2023_raw.xlsx", skip=1) %>%
  select(PR2_database_taxonomy,Trophic_functional_subgroup) %>%
  filter(Trophic_functional_subgroup!="Phototroph") %>%
  distinct()

taxon <- sapply(kalu$PR2_database_taxonomy,function(x) tail(strsplit(x, ";")[[1]], n = 1))
kalu$taxon<-taxon

kalu$taxon_level <- substr(kalu$taxon, 2, 2)
kalu$taxon <- substr(kalu$taxon, 5,100)


taxon_level <- c("d", "c", "o", "f","g","s")
taxon_level_functional <- c("division", "class", "order", "family","genus","species")
taxonomic_levels <- data.frame(taxon_level,taxon_level_functional)

kalu <- kalu %>% 
  left_join(taxonomic_levels, by="taxon_level") %>%
  rename(functional_trait = Trophic_functional_subgroup) %>%
  select(taxon,taxon_level_functional,functional_trait)

kalu$source <- "Kalu2023"

kalu$taxon_level_functional<- ifelse(endsWith(kalu$taxon,"_sp.")==TRUE, "genus",
                              ifelse(endsWith(kalu$taxon,"_X_sp.")==TRUE, "family",
                              ifelse(endsWith(kalu$taxon,"_XX_sp.")==TRUE, "order",
                              ifelse(endsWith(kalu$taxon,"_XXX_sp.")==TRUE, "class", kalu$taxon_level_functional))))

kalu$taxon <- gsub("_sp.","",kalu$taxon)
kalu$taxon <- gsub("_X_sp.","",kalu$taxon)
kalu$taxon <- gsub("_XX_sp.","",kalu$taxon)
kalu$taxon <- gsub("_XXX_sp.","",kalu$taxon)

kalu$functional_trait <- gsub(" ","_",kalu$functional_trait)

kalu <- kalu %>%
  distinct() %>%
  filter(functional_trait != "Unknown_nutrition")


write.csv(kalu,"./Kalu2023.csv")
