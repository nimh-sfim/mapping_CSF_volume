set -e

ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

cd ${PRCS_DATA_DIR_THIS_RUN}
pwd
# Copy original data, discarding first two volumes into PrcsData dir
for TI in 'TI1' 'TI2' 'TI3'
do
   # Estimate motion using as reference the first echo (within a given TI)
   3dvolreg -overwrite -verbose -zpad 1 -base 0               \
	          -1Dfile dfile.motion.${TI}.1D                     \
            -prefix pb01.${RUN}_${TI}_TE1.volreg.nii.gz       \
	          -cubic                                            \
	          -1Dmatrix_save mat.${RUN}.motion.${TI}.aff12.1D   \
	           pb00.${RUN}_${TI}_TE1.discard.nii.gz
	 
   # Motion correct the second echo
   3dAllineate -overwrite                               \
	    -prefix pb01.${RUN}_${TI}_TE2.volreg.nii.gz       \
	    -1Dmatrix_apply mat.${RUN}.motion.${TI}.aff12.1D  \
	    -input  pb00.${RUN}_${TI}_TE2.discard.nii.gz      \
	    -master pb01.${RUN}_TI1_TE1.volreg.nii.gz
   
	 # Motion correct the third echo
   3dAllineate -overwrite                               \
	    -prefix pb01.${RUN}_${TI}_TE3.volreg.nii.gz       \
	    -1Dmatrix_apply mat.${RUN}.motion.${TI}.aff12.1D  \
	    -input  pb00.${RUN}_${TI}_TE3.discard.nii.gz      \
	    -master pb01.${RUN}_TI1_TE1.volreg.nii.gz
done
echo "++ Script finished correctly" 
