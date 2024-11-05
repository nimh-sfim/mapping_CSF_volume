#!/bin/bash

echo "fange an"

for filename in moco_Basis_bold_*.nii
do

echo  ${filename}

cp /Users/sweglesm/Documents/nordic_files/NORDIC_wrapper.m ./
cp /Users/sweglesm/Documents/nordic_files/NIFTI_NORDIC.m ./


/Applications/MATLAB_R2024a.app/bin/matlab  -nodesktop -nosplash -r  "NORDIC_wrapper ${filename}"


echo "und tschuess:  expects: phase_eval.sh "

 
done 
