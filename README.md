# GreenEdge Ice Camp Protist Interactions

Scripts and data for:  
  
Sim C.W.H., Ribeiro C.G., Probert I., Gourvil P., Vaulot D. & Lopes dos Santos, A. (2025). Functional succession and interactions of protists during the under-ice Arctic phytoplankton spring bloom (In Prep).
  
List of packages used across all R files are listed in GE_IC_functional_read_phyloseq.R. Please make sure to install packages before running. Scripts are written using relative file paths, no changes any file paths are required upon cloning this repository.

## R_ice_camp
All files involved in generating figures and data used in this study.

* Main script for figures - GE_IC_functional_paper.Rmd
     * GE_IC_functional_read_phyloseq.R | Sub-script for loading libraries and reading phyloseq file
     * GE_IC_functional_data_organisation.R | Sub-script for organising data structures and assigning various properties to taxa
     * GE_IC_functions.R | Sub-script for creating functions 
     * GE_IC_color.R | Sub-script for creating color palettes for plots
     * GE_IC_clarence_colors.xlsx | Color palettes for plots
     
###[Metabarcoding Folder
Metabarcoding data generated from Green Edge Ice Camp Campaign (datasets 21, 22 downloaded from metaPR2 with PR2 5.0 annotation)
This study only involves dataset 21 - the filtered DNA samples, excluding light stress experiments.
* bootstrap_cleaning.R | Code to process ASV table with dada2 assignTaxonomy boostrap values. This ensures taxa are only confidently assigned at taxonomic levels with >= 80% boostrap values. 
* phyloseq.rds | Phyloseq file for the GE_IC campaign
* samples.xlsx | Sample metadata table that reflects all samples in GE_IC
* asv.xlsx | ASV occurrence across all GE_IC samples
* asv_cleaned.xlsx | ASV occurrence across all GE_IC samples after bootstrap cleaning.
 
### Trophic mode assignment Folder
Data and scripts used to assign all PR2 taxa with a trophic mode
* schneider2020.csv | databse of trophic mode assigned to taxa. Retrieved from Schneider et al. (2020) doi: 10.3897/bdj.8.e56648
* GE_IC_schneider_majority_rule.R | script to generate SchneiderMajorityRules.csv
* trophic_mode_updated.xlsx | Manually curated trophic mode assignment, including data from SchneiderMajorityRules.csv

### Functional trait assignment Folder
Data and scripts used to assign all PR2 taxa with a functional trait
* kalu2023.csv | self-curated database of known functional traits

## Figures folder
* All main and supplementary figures


