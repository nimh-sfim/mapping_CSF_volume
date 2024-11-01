#!/bin/bash

#sorting time series of echo times to imeseries of TIs

#only run this ina folder for each specific run
mv *E00_S00_M_e1.nii.gz runx_TI1_TE1.nii.gz
mv *E00_S01_M_e1.nii.gz runx_TI2_TE1.nii.gz
mv *E02_S02_M_e1.nii.gz runx_TI3_TE1.nii.gz
mv *E01_S00_M_e2.nii.gz runx_TI1_TE2.nii.gz
mv *E01_S01_M_e2.nii.gz runx_TI2_TE2.nii.gz
mv *E02_S02_M_e2.nii.gz runx_TI3_TE2.nii.gz
mv *E02_S00_M_e3.nii.gz runx_TI1_TE3.nii.gz
mv *E02_S01_M_e3.nii.gz runx_TI2_TE3.nii.gz
mv *E02_S02_M_e3.nii.gz runx_TI3_TE3.nii.gz
