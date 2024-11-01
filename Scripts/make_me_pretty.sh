#!/bin/bash

echo "fange an"
3dAutomask -prefix mask.nii -peels 3 -dilate 2 TI3_TE2_allruns.nii

N4BiasFieldCorrection -d 3 -i TI1_TE1_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI1_TE1_run1.nii
N4BiasFieldCorrection -d 3 -i TI1_TE2_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI1_TE2_run1.nii
N4BiasFieldCorrection -d 3 -i TI1_TE3_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI1_TE3_run1.nii
N4BiasFieldCorrection -d 3 -i TI2_TE1_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI2_TE1_run1.nii
N4BiasFieldCorrection -d 3 -i TI2_TE2_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI2_TE2_run1.nii
N4BiasFieldCorrection -d 3 -i TI2_TE3_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI2_TE3_run1.nii
N4BiasFieldCorrection -d 3 -i TI3_TE1_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI3_TE1_run1.nii
N4BiasFieldCorrection -d 3 -i TI3_TE2_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI3_TE2_run1.nii
N4BiasFieldCorrection -d 3 -i TI3_TE3_run1.nii -r 1 -s 1 -x mask.nii -o bico_TI3_TE3_run1.nii
echo "und tschuess"


3dclust -prefix clustermask_2_STATS_NEG_TI3_TE2_allruns.nii -1clip 1.6 0.81 14 2_STATS_NEG_TI3_TE2_allruns.nii -overwrite


3dcalc -a clustermask.nii -b 2_STATS_NEG_TI1_TE1_allruns.nii -prefix clust_TI1_TE1.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI1_TE2_allruns.nii -prefix clust_TI1_TE2.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI1_TE3_allruns.nii -prefix clust_TI1_TE3.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI2_TE1_allruns.nii -prefix clust_TI2_TE1.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI2_TE2_allruns.nii -prefix clust_TI2_TE2.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI2_TE3_allruns.nii -prefix clust_TI2_TE3.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI3_TE1_allruns.nii -prefix clust_TI3_TE1.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI3_TE2_allruns.nii -prefix clust_TI3_TE2.nii -overwrite -expr 'step(abs(a)-2.3)*b'
3dcalc -a clustermask.nii -b 2_STATS_NEG_TI3_TE3_allruns.nii -prefix clust_TI3_TE3.nii -overwrite -expr 'step(abs(a)-2.3)*b'


