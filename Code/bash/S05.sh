set -e
  
ml fsl
ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

cd ${PRCS_DATA_DIR_THIS_RUN}
pwd
TR=`3dinfo -tr pb02.${RUN}_TI1_TE1.censor.nii.gz`
melodic -i pb02.${RUN}_TI1_TE1.censor.nii.gz,\
pb02.${RUN}_TI1_TE2.censor.nii.gz,\
pb02.${RUN}_TI1_TE3.censor.nii.gz,\
pb02.${RUN}_TI2_TE1.censor.nii.gz,\
pb02.${RUN}_TI2_TE2.censor.nii.gz,\
pb02.${RUN}_TI2_TE3.censor.nii.gz,\
pb02.${RUN}_TI3_TE1.censor.nii.gz,\
pb02.${RUN}_TI3_TE2.censor.nii.gz,\
pb02.${RUN}_TI3_TE3.censor.nii.gz \
-o melodic_tica --nobet --report --Oall --mmthresh=0.0 --tr=${TR} -v -m pb01.${RUN}_all.FBmask.nii -a tica

ln -s melodic_tica/melodic_IC.nii.gz .

