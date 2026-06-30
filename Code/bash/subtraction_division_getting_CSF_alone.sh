#!/bin/bash

#getting rid of BOLD contamination for CSF
#TI1_TE1/TI3_TE1

3dcalc -a TI1_TE1_moco_Basis_bold_1.nii -b TI3_TE1_moco_Basis_bold_1.nii -expr '(a/b)' -prefix CSF_without_BOLD.nii -datum float

#getting rid of BOLD contamination for CBV
#TI2_TE1/TI3_TE1

3dcalc -a TI2_TE1_moco_Basis_bold_1.nii -b TI3_TE1_moco_Basis_bold_1.nii -expr '(a/b)' -prefix CBV_without_BOLD.nii -datum float

#subtracting the CBV out of the CSF
#CSF_without_BOLD.nii - CBV_without_BOLD.nii = CSF_without_BOLD_or_CBV.nii

3dcalc -a CSF_without_BOLD.nii -b CBV_without_BOLD.nii -expr '(0.7*a) - (0.3*b)' -prefix CSF_without_BOLD_or_CBV.nii -datum float
