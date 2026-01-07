#!/bin/bash

# =============================================================================
# Script 1: generate_swarm.sh
# Generate swarm file for parallel FSL processing with motion correction
# =============================================================================

# Command line arguments for subject and session
SUBJ=$1
SES=$2

# handle directories - make if don't exist 

PRJ_DIR="/data/SFIM_CSF_Volume/Project01"
ORIG_DIR="${PRJ_DIR}/OrigData"
PRCS_DIR="${PRJ_DIR}/PrcsData"

INPUT_DIR="${ORIG_DIR}/$SUBJ/$SES/nii"
SUB_PRCS_DIR="${PRCS_DIR}/$SUBJ"

if [ ! -d ${SUB_PRCS_DIR} ]; then 
    mkdir ${SUB_PRCS_DIR}
fi  

OUT_DIR=${SUB_PRCS_DIR}/${SES}

if [ ! -d ${OUT_DIR} ]; then 
    mkdir ${OUT_DIR}
fi  

LOG_DIR="${PRJ_DIR}/Logs"
SWARM_DIR="${PRJ_DIR}/Swarm"

# Define the ranges for your data
NUM_RUNS=3  # Number of runs (e.g., 1 to NUM_RUNS)
NUM_TIS=3   # Number of TIs (e.g., 1 to NUM_TIS)
NUM_TES=3   # Number of TEs (e.g., 1 to NUM_TES)

# Name of the swarm file to create
SWARM_FILE="${SWARM_DIR}/fsl_processing.swarm"

# Remove existing swarm file if it exists
rm -f "$SWARM_FILE"

# Generate swarm commands
for run in $(seq 1 $NUM_RUNS); do
    for ti in $(seq 1 $NUM_TIS); do
        for te in $(seq 1 $NUM_TES); do
            # Define input/output filenames
            phs_input="${INPUT_DIR}/run${run}_TI${ti}_TE${te}_phs.nii.gz"
            mag_input="${INPUT_DIR}/run${run}_TI${ti}_TE${te}_mag.nii.gz"
            phs_rad="${OUT_DIR}/run${run}_TI${ti}_TE${te}_phs_rad.nii.gz"
            phs_unwrapped="${OUT_DIR}/run${run}_TI${ti}_TE${te}_phs_rad_unwrapped.nii.gz"
            mag_mc="${OUT_DIR}/run${run}_TI${ti}_TE${te}_mag_mc.nii.gz"
            phs_unwrapped_mc="${OUT_DIR}/run${run}_TI${ti}_TE${te}_phs_rad_unwrapped_mc.nii.gz"

            # Check if input files exist before adding to swarm
            if [[ -f "$phs_input" ]] && [[ -f "$mag_input" ]]; then
                # Build the command chain:
                # 1. Convert phase to radians
                # 2. Unwrap phase with prelude
                # 3. Run motion correction on magnitude to get transformation matrices
                # 4. Apply motion correction to magnitude
                # 5. Apply same transformation to unwrapped phase

                cmd="fslmaths $phs_input -mul 3.14159 -div 4096 $phs_rad -odt float && "
                cmd+="prelude -a $mag_input -p $phs_rad -o $phs_unwrapped && "
                cmd+="mcflirt -in $mag_input -out $mag_mc -plots && "
                cmd+="applyxfm4D $phs_unwrapped $mag_input $phs_unwrapped_mc ${mag_mc}.mat -fourdigit"

                # Write command to swarm file
                echo "$cmd" >> "$SWARM_FILE"
            else
                echo "Warning: Skipping run${run}_TI${ti}_TE${te} - input files not found"
            fi
        done
    done
done

# Count number of jobs
NUM_JOBS=$(wc -l < "$SWARM_FILE")
echo "Created $SWARM_FILE with $NUM_JOBS jobs"

# Submit the swarm
# Adjust these parameters based on your needs:
# -g: memory per job (e.g., 4g = 4GB)
# -t: number of threads per job
# --time: max time per job (hours:minutes:seconds)
# --module: load FSL module (adjust module name as needed)

echo "Submitting swarm..."
swarm -f "$SWARM_FILE" \
    -g 64 \
    -t 16 \
    --time 12:00:00 \
    --module fsl \
    --merge-output \
    --job-name fsl_processing \
    --logdir ${LOG_DIR}

echo "Swarm submitted! Check status with: jobload"
echo "View logs in: ${LOG_DIR}"
echo ""
echo "Output files will be:"
echo "  - ${OUT_DIR}/*_mag_mc.nii.gz (motion-corrected magnitude)"
echo "  - ${OUT_DIR}/*_phs_rad_unwrapped_mc.nii.gz (motion-corrected unwrapped phase)"
echo "  - ${OUT_DIR}/*_mag_mc.mat/ (directories containing transformation matrices)"
echo "  - ${OUT_DIR}/*_mag_mc.par (motion parameters for plotting)"
