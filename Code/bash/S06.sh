set -e
  
ml fsl
ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/New_Sequence'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/New_Sequence'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

cd ${PRCS_DATA_DIR_THIS_RUN}
pwd
TR=`3dinfo -tr pb02.${RUN}_TI1_TE1.censor.nii.gz`
for SUFFIX in TI1_TE1 TI1_TE2 TI1_TE3 TI2_TE1 TI2_TE2 TI2_TE3 TI3_TE1 TI3_TE2 TI3_TE3
do
    echo "++ Running melodic on ${SUFFIX}:  "
    echo "++ =============================  "
    melodic -i pb01.${RUN}_${SUFFIX}.volreg.nii.gz \
            --nobet \
            --report \
            --Oall \
            --mmthresh=0.0 \
            --tr=${TR} \
            -v \
            -m pb01.${RUN}_all.FBmask.nii \
            -o melodic_volreg_${SUFFIX}
done
