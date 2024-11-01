#!/bin/bash

# FIRST INVERSION TIME
#average across runs 
3dMean -overwrite -prefix runaverage_TI1_TE1.nii S_r*_TE1_TI1.nii

3dcalc -a T2star_TI1_average_r1.nii  -b T2star_TI1_average_r2.nii  -c T2star_TI1_average_r3.nii  \
            -expr '(a+b+c)/3' -prefix t2star_TI1_allruns.nii 



# run 1:

##calculate two t2star values

#1 and 2
3dTstat -overwrite -prefix S_r1_TE1_TI1.nii -mean S1_TI1_TE1.nii.gz 
3dTstat -overwrite -prefix S_r1_TE2_TI1.nii -mean S1_TI1_TE2.nii.gz

#first value:
3dcalc -overwrite -prefix T2star_TI1_r1_1.nii -a S_r1_TE1_TI1.nii -b S_r1_TE2_TI1.nii -expr '19.8/log(a/b)'

#1 and 3
3dTstat -overwrite -prefix S_r1_TE1_TI1.nii -mean S0_run1_TE1_TI1.nii.gz 
3dTstat -overwrite -prefix S_r1_TE3_TI1.nii -mean S0_run1_TE2_TI1.nii.gz

#second value 
3dcalc -overwrite -prefix T2star_TI1_r1_2.nii -a S_r1_TE1_TI1.nii -b S_r1_TE3_TI1.nii -expr '39.6/log(a/b)'

##average them together 
3dcalc -a T2star_TI1_r1_2.nii -b T2star_TI1_r1_1.nii \
            -expr '(a+b)/2' -prefix T2star_TI1_average_r1.nii  

# FIRST INVERSION TIME

# run 2:

##calculate two t2star values

#1 and 2
3dTstat -overwrite -prefix S_r2_TE1_TI1.nii -mean S2_TI1_TE1.nii.gz 
3dTstat -overwrite -prefix S_r2_TE2_TI1.nii -mean S2_TI1_TE2.nii.gz

#first value:
3dcalc -overwrite -prefix T2star_TI1_r2_1.nii -a S_r2_TE1_TI1.nii -b S_r2_TE2_TI1.nii -expr '19.8/log(a/b)'

#1 and 3
3dTstat -overwrite -prefix S_r2_TE1_TI1.nii -mean S2_TI1_TE1.nii.gz 
3dTstat -overwrite -prefix S_r2_TE3_TI1.nii -mean S2_TI1_TE2.nii.gz

#second value 
3dcalc -overwrite -prefix T2star_TI1_r2_2.nii -a S_r2_TE1_TI1.nii -b S_r2_TE3_TI1.nii -expr '39.6/log(a/b)'

##average them together 
3dcalc -a T2star_TI1_r2_2.nii -b T2star_TI1_r2_1.nii \
            -expr '(a+b)/2' -prefix T2star_TI1_average_r2.nii  


# FIRST INVERSION TIME

# run 3:

##calculate two t2star values

#1 and 2
3dTstat -overwrite -prefix S_r3_TE1_TI1.nii -mean S3_TI1_TE1.nii.gz 
3dTstat -overwrite -prefix S_r3_TE2_TI1.nii -mean S3_TI1_E2.nii.gz

#first value:
3dcalc -overwrite -prefix T2star_TI1_r3_1.nii -a S_r3_TE1_TI1.nii -b S_r3_TE2_TI1.nii -expr '19.8/log(a/b)'

#1 and 3
3dTstat -overwrite -prefix S_r3_TE1_TI1.nii -mean S3_TI1_TE1.nii.gz 
3dTstat -overwrite -prefix S_r3_TE3_TI1.nii -mean S3_TI1_TE2.nii.gz

#second value 
3dcalc -overwrite -prefix T2star_TI1_r3_2.nii -a S_r3_TE1_TI1.nii -b S_r3_TE3_TI1.nii -expr '39.6/log(a/b)'

##average them together 
3dcalc -a T2star_TI1_r3_2.nii -b T2star_TI1_r3_1.nii \
            -expr '(a+b)/2' -prefix T2star_TI1_average_r3.nii  

#average all the runs together for the first inversion time

3dcalc -a T2star_TI1_average_r1.nii  -b T2star_TI1_average_r2.nii  -c T2star_TI1_average_r3.nii  \
            -expr '(a+b+c)/3' -prefix t2star_TI1_allruns.nii                    


