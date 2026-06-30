set -e
  
ml fsl
ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/New_Sequence'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/New_Sequence'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

# Enter wroking directory for this run
cd ${PRCS_DATA_DIR_THIS_RUN}
pwd

#for SUFFIX in TI1_TE1 TI1_TE2 TI1_TE3 TI2_TE1 TI2_TE2 TI2_TE3 TI3_TE1 TI3_TE2 TI3_TE3
for SUFFIX in TI1_TE2 TI1_TE3 TI2_TE2 TI2_TE3
do
  # Load manually created list of bad components into an enviroment variable
  BAD_COMPONENTS=`cat ${RUN}_bad_ICAs_${SUFFIX}.1D`
  echo "++ Bad Components for ${SUFFIX} = ${BAD_COMPONENTS}"
  fsl_regfilt -v -i pb01.${RUN}_${SUFFIX}.volreg.nii.gz           \
                 -m pb01.${RUN}_all.FBmask.nii                    \
                 -o pb03.${RUN}_${SUFFIX}.perscan_denoised.nii.gz \
                 -d melodic_volreg_${SUFFIX}/melodic_mix          \
                 -f "${BAD_COMPONENTS}"
  # Removing header info due to warning and AFNI not getting the number of sub-brick correctly
  # nifti_tool -overwrite -rm_ext ALL -infile pb03.${RUN}_${SUFFIX}.perscan_denoised.nii.gz -prefix pb03.${RUN}_${SUFFIX}.perscan_denoised.nii.gz
  nifti_tool -overwrite -rm_ext ALL -infile pb03.${RUN}_${SUFFIX}.perscan_denoised.nii.gz
done
