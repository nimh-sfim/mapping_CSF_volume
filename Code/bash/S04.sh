#!/bin/bash
set -e

ml afni

# Check necessary environment variables exits
if [[ -v INPUT_FILE ]]; then
    echo "++ INFO: Input Dataset is: ${INPUT_FILE}"
else
    echo "++ ERROR: Input Dataset [INPUT_FILE] is not set. Exiting now."
    exit
fi
if [[ -v BAD_VOLS_FILE ]]; then
    echo "++ INFO: Bad volumes listed in: ${BAD_VOLS_FILE}"
else
    echo "++ ERROR: Bad Volumes Path [BAD_VOLS_FILE] is not set. Exiting now."
    exit
fi
if [[ -v OUTPUT_FILE ]]; then
    echo "++ INFO: Output Dataset is: ${OUTPUT_FILE}"
else
    echo "++ ERROR: Output Dataset [OUTPUT_FILE] is not set. Exiting now."
    exit
fi

# Check in necessary files exist
if [ ! -f "$INPUT_FILE" ]; then
   echo "++ ERROR: Input File ${INPUT_FILE} not available. Exiting now."
fi

WORKING_DIR=`dirname ${INPUT_FILE}`
cd ${WORKING_DIR}
pwd
if [ ! -f "$BAD_VOLS_FILE" ]; then
   echo "++ --------------------------------------------------------------"
   echo "++ WARNING: BAD_VOLS_FILE not available."
   echo "++          Assuming there is no volumes to be censor."
   echo "++          Making a copy"
   3dcopy -overwrite ${INPUT_FILE} ${OUTPUT_FILE}
   exit
fi

# Extract number of acquisitions in input
nt=$(3dinfo -nt "$INPUT_FILE")  # number of timepoints/sub-bricks
PREFIX_FOR_KEEP=`basename ${INPUT_FILE} .nii.gz`
KEEP_FILE=`echo ${PREFIX_FOR_KEEP}_keep.1D`
# build keep-list (space-separated indices) into keep.1D
python3 - <<'PY' "$nt" "$BAD_VOLS_FILE" > $KEEP_FILE
import sys

nt = int(sys.argv[1])
txt = open(sys.argv[2]).read().strip()

bad = set()
if txt:
    for t in txt.replace('\n', ',').split(','):
        t = t.strip()
        if t:
            bad.add(int(t))

keep = [str(i) for i in range(nt) if i not in bad]
print(" ".join(keep))
PY

# extract only the kept volumes
3dTcat -overwrite -prefix $OUTPUT_FILE "$INPUT_FILE""[1dcat $KEEP_FILE]"

