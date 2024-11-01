#!/bin/bash

# run 1:

# 1st inversion time

#calculate two t2star values


#1 and 2
3dTstat -overwrite -prefix S_r1_TE1_TI1.nii -mean S0_run1_TE1_TI1.nii.gz 
3dTstat -overwrite -prefix S_r1_TE2_TI1.nii -mean S0_run1_TE2_TI1.nii.gz

#first value:
3dcalc -overwrite -prefix T2star_TI1_1.nii -a S_r1_TE1_TI1.nii -b S_r1_TE2_TI1.nii -expr '19.8/log(a/b)'

#1 and 3
3dTstat -overwrite -prefix S_r1_TE1_TI1.nii -mean S0_run1_TE1_TI1.nii.gz 
3dTstat -overwrite -prefix S_r1_TE3_TI1.nii -mean S0_run1_TE2_TI1.nii.gz

#second value 
3dcalc -overwrite -prefix T2star_TI1_2.nii -a S_r1_TE1_TI1.nii -b S_r1_TE3_TI1.nii -expr '39.6/log(a/b)'

#average them together 
3dcalc -a T2star_TI1_2.nii -b T2star_TI1_1.nii \
            -expr '(a+b)/2' -prefix T2star_TI1_average.nii  


# 2nd inversion time

3dTstat -overwrite -prefix S_r2_TE1_TI2.nii -mean S0_run1_TE1_TI2.nii.gz
3dTstat -overwrite -prefix S_TE2_TI2.nii -mean S0_run1_TE2_TI2.nii.gz

3dcalc -overwrite -prefix T2star_TI2.nii -a S_TE1_TI2.nii -b S_TE2_TI2.nii -expr '19.8/log(a/b)'

# 3rd inversion time 

3dTstat -overwrite -prefix S_TE1_TI3.nii -mean S0_run2_TE1_TI3.nii.gz
3dTstat -overwrite -prefix S_TE2_TI3.nii -mean S0_run2_TE2_TI3.nii.gz

3dcalc -overwrite -prefix T2star_TI3.nii -a S_TE1_TI3.nii -b S_TE2_TI3.nii -expr '19.8/log(a/b)'

# run 2:

# 1st inversion time

3dTstat -overwrite -prefix S_TE1_TI1.nii -mean S0_run2_TE1_TI1.nii.gz
3dTstat -overwrite -prefix S_TE2_TI1.nii -mean S0_run2_TE2_TI1.nii.gz

3dcalc -overwrite -prefix T2star_TI1.nii -a S_TE1_TI1.nii -b S_TE2_TI1.nii -expr '19.8/log(a/b)'

# 2nd inversion time

3dTstat -overwrite -prefix S_TE1_TI2.nii -mean S0_run2_TE1_TI2.nii.gz
3dTstat -overwrite -prefix S_TE2_TI2.nii -mean S0_run2_TE2_TI2.nii.gz

3dcalc -overwrite -prefix T2star_TI2.nii -a S_TE1_TI2.nii -b S_TE2_TI2.nii -expr '19.8/log(a/b)'

# 3rd inversion time

3dTstat -overwrite -prefix S_TE1_TI3.nii -mean S0_run2_TE1_TI3.nii.gz
3dTstat -overwrite -prefix S_TE2_TI3.nii -mean S0_run2_TE2_TI3.nii.gz

3dcalc -overwrite -prefix T2star_TI3.nii -a S_TE1_TI3.nii -b S_TE2_TI3.nii -expr '19.8/log(a/b)'

# run 3:

# 1st inversion time 

3dTstat -overwrite -prefix S_TE1_TI1.nii -mean S0_run3_TE1_TI1.nii.gz
3dTstat -overwrite -prefix S_TE2_TI1.nii -mean S0_run3_TE2_TI1.nii.gz

3dcalc -overwrite -prefix T2star_TI1.nii -a S_TE1_TI1.nii -b S_TE2_TI1.nii -expr '19.8/log(a/b)'

# 2nd inversion time

3dTstat -overwrite -prefix S_TE1_TI2.nii -mean S0_run3_TE1_TI2.nii.gz
3dTstat -overwrite -prefix S_TE2_TI2.nii -mean S0_run3_TE2_TI2.nii.gz

3dcalc -overwrite -prefix T2star_TI2.nii -a S_TE1_TI2.nii -b S_TE2_TI2.nii -expr '19.8/log(a/b)'

# 3rd inversion time

3dTstat -overwrite -prefix S_TE1_TI3.nii -mean S0_run3_TE1_TI3.nii.gz
3dTstat -overwrite -prefix S_TE2_TI3.nii -mean S0_run3_TE2_TI3.nii.gz

3dcalc -overwrite -prefix T2star_TI3.nii -a S_TE1_TI3.nii -b S_TE2_TI3.nii -expr '19.8/log(a/b)'

