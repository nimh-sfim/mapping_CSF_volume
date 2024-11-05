#!/bin/bash

#TI1_TE1
3dTstat -prefix TI1_TE1_run1.nii -mean -overwrite TI1_TE1/moco_Basis_bold_1.nii 
3dTstat -prefix TI1_TE1_run2.nii -mean -overwrite TI1_TE1/moco_Basis_bold_2.nii 
3dTstat -prefix TI1_TE1_run3.nii -mean -overwrite TI1_TE1/moco_Basis_bold_3.nii 

3dMean -prefix TI1_TE1_allruns.nii -overwrite TI1_TE1/moco_Basis_bold_1.nii TI1_TE1/moco_Basis_bold_2.nii TI1_TE1/moco_Basis_bold_3.nii
3dRefit -TR 10 TI1_TE1_allruns.nii
afni_GLM.sh TI1_TE1_allruns.nii

#TI1_TE2
3dTstat -prefix TI1_TE2_run1.nii -mean -overwrite TI1_TE2/moco_Basis_bold_1.nii 
3dTstat -prefix TI1_TE2_run2.nii -mean -overwrite TI1_TE2/moco_Basis_bold_2.nii 
3dTstat -prefix TI1_TE2_run3.nii -mean -overwrite TI1_TE2/moco_Basis_bold_3.nii 

3dMean -prefix TI1_TE2_allruns.nii -overwrite TI1_TE2/moco_Basis_bold_1.nii TI1_TE2/moco_Basis_bold_2.nii TI1_TE2/moco_Basis_bold_3.nii 
3dRefit -TR 10 TI1_TE2_allruns.nii
afni_GLM.sh TI1_TE2_allruns.nii

#TI1_TE3
3dTstat -prefix TI1_TE3_run1.nii -mean -overwrite TI1_TE3/moco_Basis_bold_1.nii 
3dTstat -prefix TI1_TE3_run2.nii -mean -overwrite TI1_TE3/moco_Basis_bold_2.nii 
3dTstat -prefix TI1_TE3_run3.nii -mean -overwrite TI1_TE3/moco_Basis_bold_3.nii 

3dMean -prefix TI1_TE3_allruns.nii -overwrite TI1_TE3/moco_Basis_bold_1.nii TI1_TE3/moco_Basis_bold_2.nii TI1_TE3/moco_Basis_bold_3.nii 
3dRefit -TR 10 TI1_TE3_allruns.nii
afni_GLM.sh TI1_TE3_allruns.nii


#TI2_TE1
3dTstat -prefix TI2_TE1_run1.nii -mean -overwrite TI2_TE1/moco_Basis_bold_1.nii 
3dTstat -prefix TI2_TE1_run2.nii -mean -overwrite TI2_TE1/moco_Basis_bold_2.nii 
3dTstat -prefix TI2_TE1_run3.nii -mean -overwrite TI2_TE1/moco_Basis_bold_3.nii 

3dMean -prefix TI2_TE1_allruns.nii -overwrite TI2_TE1/moco_Basis_bold_1.nii TI2_TE1/moco_Basis_bold_2.nii TI2_TE1/moco_Basis_bold_3.nii 
3dRefit -TR 10 TI2_TE1_allruns.nii
afni_GLM.sh TI2_TE1_allruns.nii

#TI2_TE2
3dTstat -prefix TI2_TE2_run1.nii -mean -overwrite TI2_TE2/moco_Basis_bold_1.nii 
3dTstat -prefix TI2_TE2_run2.nii -mean -overwrite TI2_TE2/moco_Basis_bold_2.nii 
3dTstat -prefix TI2_TE2_run3.nii -mean -overwrite TI2_TE2/moco_Basis_bold_3.nii 

3dMean -prefix TI2_TE2_allruns.nii -overwrite TI2_TE2/moco_Basis_bold_1.nii TI2_TE2/moco_Basis_bold_2.nii TI2_TE2/moco_Basis_bold_3.nii
3dRefit -TR 10 TI2_TE2_allruns.nii
afni_GLM.sh TI2_TE2_allruns.nii

#TI2_TE3
3dTstat -prefix TI2_TE3_run1.nii -mean -overwrite TI2_TE3/moco_Basis_bold_1.nii 
3dTstat -prefix TI2_TE3_run2.nii -mean -overwrite TI2_TE3/moco_Basis_bold_2.nii 
3dTstat -prefix TI2_TE3_run3.nii -mean -overwrite TI2_TE3/moco_Basis_bold_3.nii 

3dMean -prefix TI2_TE3_allruns.nii -overwrite TI2_TE3/moco_Basis_bold_1.nii TI2_TE3/moco_Basis_bold_2.nii TI2_TE3/moco_Basis_bold_3.nii 
3dRefit -TR 10 TI2_TE3_allruns.nii
afni_GLM.sh TI2_TE3_allruns.nii

#TI3_TE1
3dTstat -prefix TI3_TE1_run1.nii -mean -overwrite TI3_TE1/moco_Basis_bold_1.nii 
3dTstat -prefix TI3_TE1_run2.nii -mean -overwrite TI3_TE1/moco_Basis_bold_2.nii 
3dTstat -prefix TI3_TE1_run3.nii -mean -overwrite TI3_TE1/moco_Basis_bold_3.nii 

3dMean -prefix TI3_TE1_allruns.nii -overwrite TI3_TE1/moco_Basis_bold_1.nii TI3_TE1/moco_Basis_bold_2.nii TI3_TE1/moco_Basis_bold_3.nii 
3dRefit -TR 10 TI3_TE1_allruns.nii
afni_GLM.sh TI3_TE1_allruns.nii

#TI3_TE2
3dTstat -prefix TI3_TE2_run1.nii -mean -overwrite TI3_TE2/moco_Basis_bold_1.nii 
3dTstat -prefix TI3_TE2_run2.nii -mean -overwrite TI3_TE2/moco_Basis_bold_2.nii 
3dTstat -prefix TI3_TE2_run3.nii -mean -overwrite TI3_TE2/moco_Basis_bold_3.nii  

3dMean -prefix TI3_TE2_allruns.nii -overwrite TI3_TE2/moco_Basis_bold_1.nii TI3_TE2/moco_Basis_bold_2.nii TI3_TE2/moco_Basis_bold_3.nii 
3dRefit -TR 10 TI3_TE2_allruns.nii
afni_GLM.sh TI3_TE2_allruns.nii

#TI3_TE3
3dTstat -prefix TI3_TE3_run1.nii -mean -overwrite TI3_TE3/moco_Basis_bold_1.nii 
3dTstat -prefix TI3_TE3_run2.nii -mean -overwrite TI3_TE3/moco_Basis_bold_2.nii 
3dTstat -prefix TI3_TE3_run3.nii -mean -overwrite TI3_TE3/moco_Basis_bold_3.nii  

3dMean -prefix TI3_TE3_allruns.nii -overwrite TI3_TE3/moco_Basis_bold_1.nii TI3_TE3/moco_Basis_bold_2.nii TI3_TE3/moco_Basis_bold_3.nii
3dRefit -TR 10 TI3_TE3_allruns.nii
afni_GLM.sh TI3_TE3_allruns.nii

fslmaths multi_echo_average.nii  -s 2 smoothed_multiecho_Average.nii

