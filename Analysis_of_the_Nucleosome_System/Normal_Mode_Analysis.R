# Normal mode analysis (NMA) was done on the last conformation at 6 𝝁s using Bio3d. The analysis was done on each histone subunit
# NMA generate the fluctuations of each residue.


# Call R and load Bio3d
R
library(bio3d)

# Load pdb structure
pdb <- read.pdb("NMA_WT_24M.pdb")

# Run NMA. Residue number depends on the histone been analyzed
# Histone H3 = 295:429, Histone H4 = 430:531, Histone H2A = 532:659, Histone H2B = 660:781
mode <- nma(pdb, outmodes = atom.select(pdb, "calpha", resno=295:429, verbose=TRUE))

# Write output to csv file
flucts <- fluct.nma(mode, mode.inds=seq(7,9))
write.csv(flucts, file="H3_WT_015M_m79.csv")






