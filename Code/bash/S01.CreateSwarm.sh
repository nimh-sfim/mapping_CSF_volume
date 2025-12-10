set -e

SWARM_FILE='/data/SFIM_CSF_Volume/Project01/Swarm/S01.SWWARM.sh'
LOGS_DIR='/data/SFIM_CSF_Volume/Project01/Logs'
ORIG_DATA_DIR='/data/SFIM_CSF_Volume/Project01/OrigData/'

echo "#Create Date: `date`" > ${SWARM_FILE}
echo "# swarm -f ${SWARM_FILE} -g 24 -t 16 -b 3 --time 00:30:00 --module afni --partition quick,norm --logdir ${LOGS_DIR}" >> ${SWARM_FILE}
for SBJ in SBJ01 SBJ02 SBJ03 SBJ04 SBJ05 SBJ06
do
	for SES in SES01 SES02
	do
		for RUN in run1 run2 run3 run4 run5 run6
		do
			INPUT_FILE=`echo ${ORIG_DATA_DIR}/${SBJ}/${SES}/${RUN}/${RUN}_TI1_TE1.nii.gz`
			if [ -f ${INPUT_FILE} ]; then
					echo "export SBJ=${SBJ} SES=${SES} RUN=${RUN};sh /data/SFIM_CSF_Volume/Project01/Code/bash/S01.sh" >> ${SWARM_FILE}
			fi
		done
	done
done
