set -e

ml afni

ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/'

PRCS_DATA_DIR_THIS_RUN=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/`
ORIG_DATA_DIR_THIS_RUN=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/`

# If folder for this run does not exists in PRCS_DATA, we will create it
if [ ! -d ${PRCS_DATA_DIR_THIS_RUN} ]; then
	mkdir -p ${PRCS_DATA_DIR_THIS_RUN}
fi

cd ${PRCS_DATA_DIR_THIS_RUN}

# Copy original data, discarding first two volumes into PrcsData dir
for TI_ID in 1 2 3
do
	for TE_ID in 1 2 3
	do
		3dcalc -overwrite -a ${ORIG_DATA_DIR_THIS_RUN}/${RUN}_TI${TI_ID}_TE${TE_ID}.nii.gz'[3..$]' -expr 'a' -prefix ${PRCS_DATA_DIR_THIS_RUN}/pb00.${RUN}_TI${TI_ID}_TE${TE_ID}.discard.nii.gz

	done
done

