#predict using lincs data

args <- commandArgs(trailingOnly=T)

subset_comparison_id <- args[1]
analysis_id <-  args[2]
dz_sig_path <- args[3]
landmark <- args[4] #1 means using landmark gene, 0 means using all genes

if (length(args)<4){
  print ("please input 3 arguments (subset comparision id, analysis id, disease signature path, landmark)")
  q()
}

#compute random scores, used for signficance analysis
cmd <- paste("Rscript ../code/drug_prediction/compute_cmap_randoms_new_set_lincs_all.R", subset_comparison_id, analysis_id, dz_sig_path, landmark)
system(cmd)

#compute cmap scores 
cmd <- paste("Rscript ../code/drug_prediction/compute_connectivity_score_new_set_lincs_all.R", subset_comparison_id, analysis_id, dz_sig_path, landmark)
system(cmd)
