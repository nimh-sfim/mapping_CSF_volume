## DOCUMENTATION FOR SWEGLE ET AL., TOWARDS MAPPING CSF VOLUME CHANGE AT 7T, 2026

Project updated in June 2026. Processing pipelines can be found in ```Code/bash```. 

Steps:

1) Upload data from XNAT as zip 

2) Unzip the data, rename the folder “Data”

3) Inside of “Data” run the conv_nih.sh script 

4) Once conv_nih.sh has finished running, take the “nii” folder that has been created inside of the “Data” folder and do the following:
- Starting from the first run (so after localizers and mprage), take the first nine files that are 1) Magnitude data (so have an “M” instead of a “P” in the name) AND 2) end in .nii.gz
- Put these nine files in a new folder named “run1”
- Continue on this way, dragging files by 9’s into folders labeled with the run numbers until you hit the end of the nii folder 

5) Original file names (out of conv_nih.sh) have information about the task that was completed (inhold, exhold, fixation, etc) and the scan parameters (ex: resolution).  Take note of all of the info in the names of the runs and put all of the info into “scan_info.csv” **(it will go away with the rename_contrasts.sh script)**. 

6) Check the number of volumes that the files in each of the run folders has. If there is not a reasonable number of volumes, for example if there are only 5 volumes, then do not continue forward with that specific run
- To check the number of volumes: 3dinfo -header_line -header_name -nt *.nii.gz

7) Run the script “rename_contrasts.sh” on each of the run folders. **NOTE: This will remove information about task and parameters from filenames** (and add information about TE/TI combination) 

8) Once the script has run, manually fill in the run numbers on each file, since the script just names them “runx” 

9) Transfer all of the data (all of the run folders) into biowulf 

10)  Once in biowulf, the first thing to do is to make sure that the TR is correct in the files. With this sequence, the TR is often not correct. To find the correct TR, go to the parameter pdf for that specific scan and find the value under “TR 2”
- To check the TR (using run3 as an example): 3dinfo -tr run3_TI*
- To change the TR to the correct TR (using run 3 and correct TR = 3.4 as an example): 3drefit -TR 3.4 run3_TI*

11) Now, you can begin with running S01
- To do this, first open S01.CreateSwarm.sh and look to make sure that it is going to create swarm jobs for the runs, sessions, etc that you want it to. Check S01.sh as well.  
- Then, sh S01.CreateSwarm.sh
- Then, go into the “Swarm” folder and open up the swarm file you just created. Copy the command at the top that is commented out and run that in biowulf
- After S01, run S02
- After S02, run S03

12) After S03, pause and do the following:
- Manually edit the mask that SO3 creates - when manually editing the mask, make sure to include all of the CSF area (so expand the mask to include CSF areas around the brain) 
- Also, create a file called “pb01.${RUN}_bad_volumes_manual.1D” for example: pb01.run1_bad_volumes_manual.1D - if there are motion artifacts or just data looks junky in any given TR. 

13) Then, run S04, S05 and S06

14) After S06, you will have ICAs for each of the 9 echo times and inversion times per run. Go through each of the separate ICAs and write down each of the bad ICA components. Put the bad ICA components in a file called “${RUN}_bad_ICAs_${SUFFIX}.1D” for example, “run1_bad_ICAs_TI1_TE1.1D”
- Make sure when writing the list of bad ICA components that you use the numbers from melodic, not the afni numbers 

15) Code for additional data processing/analysis steps:

- DETREND:
3dDetrend -polort 5 -prefix pb03.run7_TI1_TE1.perscan_denoised.detrend.nii pb03.run7_TI1_TE1.perscan_denoised.nii
3dDetrend -polort 5 -prefix pb03.run7_TI2_TE1.perscan_denoised.detrend.nii pb03.run7_TI2_TE1.perscan_denoised.nii

- BANDPASS:
3dBandpass -prefix pb03.run7_TI1_TE1.perscan_denoised.detrend.bpf.nii -band 0.0 0.1 -input pb03.run7_TI1_TE1.perscan_denoised.detrend.nii
3dBandpass -prefix pb03.run7_TI2_TE1.perscan_denoised.detrend.bpf.nii -band 0.0 0.1 -input pb03.run7_TI2_TE1.perscan_denoised.detrend.nii 

- CORR:
3dTcorrelate -pearson -prefix CSF_corr_with_CBV.nii pb03.run7_TI1_TE1.perscan_denoised.detrend.bpf.nii pb03.run7_TI2_TE1.perscan_denoised.detrend.bpf.nii

- MASK:
3dcalc -a CSF_corr_with_CBV.nii -b pb01.run7_all.FBmask.nii -expr 'a*b' -prefix CSF_corr_with_CBV_masked.nii

14) Additional code: subtraction_division_getting_CSF_alone.sh
- This script attempts to separate CSF from CBV and BOLD 


Notes about folders:
- inside of the folder File_Information, the file scan_info.csv contains all of the information about scan parameters, tasks, etc for each run
- inside the folder Scan_Parameters, the scan parameters can be found, labeled with information about if they are for the new sequence, old sequences, high resolution or low resolution
- the task folder contains the parameters for the breathing task, both exhold and inhold
- OrigData contains the original data
- PrcsData contains the processed data
- Swarm contains the swarm files
- Code/bash contains all of the current script 
- Code/notebooks contains notebooks that can be used to create visualizations







