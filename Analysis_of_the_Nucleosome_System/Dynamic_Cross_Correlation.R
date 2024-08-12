# This R code was used on Bio3d to compute the dynamic cross correlation of Histone H4 and H2B in the wild-type and mutant systems.

# Call R and load Bio3d
R
library(bio3d)

# Specify path to the dcd trajectory and reference pdb structure to be analyzed
mydcdfile <- "DCCM_WT.dcd"
mypdbfile <- "DCCM_WT.pdb"

# Load trajectory and reference pdb structure
dcd <- read.dcd(mydcdfile)
pdb <- read.pdb(mypdbfile)

# Select the alpha carbons (C𝛂) for analysis. aligned each frame of the trajectory to the reference pdb specifying C𝛂 as fixed and the rest atoms as mobile.
ca.inds <- atom.select(pdb, resno=c(430:531,660:781), elety='CA')
xyz <- fit.xyz(fixed=pdb$xyz, mobile=dcd, fixed.inds=ca.inds$xyz, mobile.inds=ca.inds$xyz)

# Do the dynamic cross correlation
cij <- dccm(xyz)

#plot results
plot(cij)


# Repeat same analysis for all systems