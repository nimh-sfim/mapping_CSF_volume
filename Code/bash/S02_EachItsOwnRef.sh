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
  3dvolreg -overwrite -verbose -zpad 1 -base 0                  \
    	   -1Dfile dfile.motion.${SUFFIX}.1D                    \
	   -prefix pb02.${RUN}_${SUFFIX}.volreg.per_file.nii.gz \
	   -cubic                                               \
	   -1Dmatrix_save mat.${RUN}.motion.${SUFFIX}.aff12.1D  \
	    pb00.${RUN}_${SUFFIX}.discard.nii.gz
done
