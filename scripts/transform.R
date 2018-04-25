args = commandArgs(trailingOnly=TRUE)
range01 <- function(x){(x-min(x))/(max(x)-min(x))}
perc.rank <- function(x) trunc(rank(x))/length(x)

species_quant_file <- args[1]
# basefile <-  unlist(strsplit(species_quant_file, "/"))[-1]
# species <- unlist(strsplit(basefile, "_"))[1]
species_quant_df <- read.table(species_quant_file,header=T)
species_quant_df$norm <- range01(species_quant_df$TPM)
species_quant_df$zscale <- scale(species_quant_df$TPM)
species_quant_df <- within(species_quant_df, TPMpercentile <- perc.rank(TPM))
species_quant_file_transformed <- paste(species_quant_file,".norm.sf",sep="")

write.table(species_quant_df,species_quant_file_transformed,row.names=FALSE,sep="\t", quote = FALSE)
