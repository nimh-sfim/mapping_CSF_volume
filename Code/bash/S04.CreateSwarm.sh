set -e

SWARM_FILE='/data/SFIM_CSF_Volume/Project01/Swarm/S04.SWWARM.sh'
LOGS_DIR='/data/SFIM_CSF_Volume/Project01/Logs'
PRCS_DATA_DIR='/data/SFIM_CSF_Volume/Project01/PrcsData/'

echo "#Create Date: `date`" > ${SWARM_FILE}
echo "# swarm -f ${SWARM_FILE} -g 24 -t 16 -b 3 --time 00:30:00 --module afni --partition quick,norm --logdir ${LOGS_DIR}" >> ${SWARM_FILE}
for SBJ in SBJ01 SBJ02 SBJ03 SBJ04 SBJ05 SBJ06
do
	for SES in SES01 SES02
	do
		for RUN in run1 run2 run3 run4 run5 run6
		do
      for SUFFIX in TI1_TE1 TI1_TE2 TI1_TE3 TI2_TE1 TI2_TE2 TI2_TE3 TI3_TE1 TI3_TE2 TI3_TE3
      do
			    INPUT_FILE=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/pb01.${RUN}_${SUFFIX}.volreg.nii.gz`
			    OUTPUT_FILE=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/pb02.${RUN}_${SUFFIX}.censor.nii.gz`
          BAD_VOLS_FILE=`echo ${PRCS_DATA_DIR}/${SBJ}/${SES}/${RUN}/${RUN}_bad_volumes_manual.1D`
			    if [ -f ${INPUT_FILE} ]; then
					     echo "export INPUT_FILE=${INPUT_FILE} OUTPUT_FILE=${OUTPUT_FILE} BAD_VOLS_FILE=${BAD_VOLS_FILE};sh /data/SFIM_CSF_Volume/Project01/Code/bash/S04.sh" >> ${SWARM_FILE}
			    fi
      done
		done
	done
done
echo ${SWARM_FILE}
