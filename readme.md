## DOCUMENTATION FOR SWEGLE ET AL., TOWARDS MAPPING CSF VOLUME CHANGE AT HIGH RESOLUTIONS AT 7T, 2024

Project updated in December 2025. Scripts below moved into ```Scripts_old``` and new processing pipelines can be found in ```Code/bash```. 

#### Scripts:

This folder contains the scripts used to process the imaging data. 

Here is information on how to run these scripts:

1) Run conv_nih.sh on all files
1) The following step was done because file names were wrong: 
    - Sort files into folders by run, examples: run1, run2, run3
    - Run rename_constrasts.sh on each run folder
1) Sort by TI and TE combinations, so make nine folders total, examples: TI1_TE1, TI2_TE3, TI3_TE1
    - Make sure each file contains its correct run number before moving the files out of the run folders
1) Run either SPM motion correction or AFNI motion correction 
    - SPM motion correction:
        - Run SPM_moco_bold.sh on each of the nine folders
        - Run mocobatch_bold.m on each of the nine folders
    - Or, AFNI motion correction:
        - Run AFNI_moco_bold_nii.sh in each of the 9 folders 
1) If doing NORDIC: 
    - Run NORDIC_wrapper_edited.sh
1) Combine runs:
    - If NORDIC run: combine_NORDIC_runs_3TI_3TE_SPM.sh
    - If not NORDIC run: combine_runs_3TI_3TE_SPM.sh
1) To make time course maps:
    - Run make_timecourse_edited copy_final.sh
  
#### Scan Parameters:

This folder contains information about the scan parameters generally used for the scans in this project.

