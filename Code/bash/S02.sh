set -e

ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/'
SBJ='SBJ05'
SES='SES01'
RUN='run1'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

cd ${PRCS_DATA_DIR_THIS_RUN}
pwd
# Copy original data, discarding first two volumes into PrcsData dir
3dvolreg -overwrite -verbose -zpad 1 -base 0 \
	 -1Dfile dfile.motion.1D -prefix pb01.${RUN}_TI2_TE1.volreg.nii.gz \
	 -cubic \
	 -1Dmatrix_save mat.${RUN}.motion.aff12.1D \
	 pb00.${RUN}_TI2_TE1.discard.nii.gz

for SUFFIX in TI1_TE1 TI1_TE2 TI1_TE3 TI2_TE2 TI2_TE3 TI3_TE1 TI3_TE2 TI3_TE3
do
3dAllineate -overwrite                                   \
	    -prefix pb01.${RUN}_${SUFFIX}.volreg.nii.gz  \
	    -1Dmatrix_apply mat.${RUN}.motion.aff12.1D   \
	    -input  pb00.${RUN}_${SUFFIX}.discard.nii.gz \
	    -master pb01.${RUN}_TI2_TE1.volreg.nii.gz

done
