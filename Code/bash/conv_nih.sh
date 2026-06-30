#!/bin/bash


echo "fange an"
mkdir ./nii


for dir in ./*/
do
dir=${dir%*/}
cd ./$dir
echo  ${dir##*/}
cd DICOM

dcm2niix_afni -ba y -z y -o ../../nii/ -f S%s_%d_e%e ./

cd ..
cd ..
done


echo "und tschuess"

 
