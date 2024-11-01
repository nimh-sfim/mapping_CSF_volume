#!/bin/bash



# run 3:

3dTcat -overwrite -prefix S0_run3_TE2_TI3.nii  TI3_TE1_moco_run2.nii'[0..26]'
3dTcat -overwrite -prefix S0_run3_TE2_TI3.nii  TI3_TE2_moco_run2.nii'[0..26]'

3dTstat -overwrite -prefix S_r3_TE1_TI3.nii -mean S0_run3_TE1_TI3.nii.gz
3dTstat -overwrite -prefix S_r3_TE2_TI3.nii -mean S0_run3_TE2_TI3.nii.gz

3dTstat -overwrite -prefix S_TE1_TI3.nii -mean S0_run3_TE1_TI3.nii.gz
3dTstat -overwrite -prefix S_TE2_TI3.nii -mean S0_run3_TE3_TI3.nii.gz

3dcalc -overwrite -prefix T2star_TI3.nii -a S_TE1_TI3.nii -b S_TE2_TI3.nii -expr '19.8/log(a/b)'
#change the 19 number for the second one (80 ish for second)
#twice 

#average t2stars

