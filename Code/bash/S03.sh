set -e
  
ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

cd ${PRCS_DATA_DIR_THIS_RUN}
pwd

for SUFFIX in TI1_TE1 TI1_TE2 TI1_TE3 TI2_TE1 TI2_TE2 TI2_TE3 TI3_TE1 TI3_TE2 TI3_TE3
do
   3dAutomask -overwrite -prefix pb01.${RUN}_${SUFFIX}.volreg.mask.nii.gz pb01.${RUN}_${SUFFIX}.volreg.nii.gz 
done  

3dMean -prefix pb01.${RUN}_all.FBmask_mean.nii pb01.${RUN}_TI?_TE?.volreg.mask.nii.gz 
3dcalc -overwrite -a pb01.${RUN}_all.FBmask_mean.nii -expr 'step(a)' -prefix pb01.${RUN}_all.FBmask_step.nii 
3dmask_tool -overwrite -input pb01.${RUN}_all.FBmask_step.nii -dilate_inputs 3 -prefix pb01.${RUN}_all.FBmask.nii

echo "++ Make sure to check and manually correct the mask located at: ${PRCS_DATA_DIR_THIS_RUN}pb01.${RUN}_all.FBmask.nii
echo "++ Also create a list of volumes to be censored for this run at: ${PRCS_DATA_DIR_THIS_RUN}${RUN}_bad_volumes_manual.1D"
echo "   this will be a file with a single line that contains the ids to bad volumes separated by commas"
echo "   use AFNI indexing (starting at zero)"
echo "   You need to complete these steps, prior to moving to the next script"
