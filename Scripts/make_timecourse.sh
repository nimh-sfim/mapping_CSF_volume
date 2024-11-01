#!/bin/bash

echo "fange an"


#generate mask

3dcalc -prefix timecoursemask.nii -a 2_STATS_NEG_TI3_TE2_allruns.nii  -overwrite -expr 'step(abs(a)-2.3)'


3dTcat -prefix time_prep_TI3_TE2.nii -overwrite TI3_TE2_allruns.nii'[0..95]'



