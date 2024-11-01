#!/bin/bash

echo "fange an"


#generate mask

#3dcalc -prefix bintimecoursemask.nii -a 2_STATS_NEG_TI3_TE2_allruns.nii  -overwrite -expr 'step(abs(a)-2.3)'
#refining mask
3dtstat -tSNR -overwrite -prefix tSNR_TI2_TE2.nii TI2_TE2_run_average.nii
#filtering out veins
3dcalc -a tSNR_TI2_TE2.nii -b bin_timecoursemask_orig2.nii -overwrite -prefix bin_timecoursemask.nii -expr 'step(a-30)*b'
#run_average.nii
#make sure still dividiable by 20 - later want to average durations 
#TR os 3 seconds and stimulation of on/30 30 seconds 
#rest 10, ativation 10
#20TRS before whole cycle repeats 
#make sure still 240 components after run)
3dTcat -prefix time_prep_TI1_TE1.nii -overwrite TI1_TE1_run_average.nii'[3..5]' TI1_TE1_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI1_TE2.nii -overwrite TI1_TE2_run_average.nii'[3..5]' TI1_TE2_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI1_TE3.nii -overwrite TI1_TE3_run_average.nii'[3..5]' TI1_TE3_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI2_TE1.nii -overwrite TI2_TE1_run_average.nii'[3..5]' TI2_TE1_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI2_TE2.nii -overwrite TI2_TE2_run_average.nii'[3..5]' TI2_TE2_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI2_TE3.nii -overwrite TI2_TE3_run_average.nii'[3..5]' TI2_TE3_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI3_TE1.nii -overwrite TI3_TE1_run_average.nii'[3..5]' TI3_TE1_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI3_TE2.nii -overwrite TI3_TE2_run_average.nii'[3..5]' TI3_TE2_run_average.nii'[3..239]'
3dTcat -prefix time_prep_TI3_TE3.nii -overwrite TI3_TE3_run_average.nii'[3..5]' TI3_TE3_run_average.nii'[3..239]'

3dTstat -overwrite -mean -prefix baseline_TI1_TE1.nii time_prep_TI1_TE1.nii
3dTstat -overwrite -mean -prefix baseline_TI1_TE2.nii time_prep_TI1_TE2.nii
3dTstat -overwrite -mean -prefix baseline_TI1_TE3.nii time_prep_TI1_TE3.nii
3dTstat -overwrite -mean -prefix baseline_TI2_TE1.nii time_prep_TI2_TE1.nii
3dTstat -overwrite -mean -prefix baseline_TI2_TE2.nii time_prep_TI2_TE2.nii
3dTstat -overwrite -mean -prefix baseline_TI2_TE3.nii time_prep_TI2_TE3.nii
3dTstat -overwrite -mean -prefix baseline_TI3_TE1.nii time_prep_TI3_TE1.nii
3dTstat -overwrite -mean -prefix baseline_TI3_TE2.nii time_prep_TI3_TE2.nii
3dTstat -overwrite -mean -prefix baseline_TI3_TE3.nii time_prep_TI3_TE3.nii


3dcalc -a time_prep_TI1_TE1.nii -b baseline_TI1_TE1.nii -prefix time_prep_TI1_TE1_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI1_TE2.nii -b baseline_TI1_TE2.nii -prefix time_prep_TI1_TE2_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI1_TE3.nii -b baseline_TI1_TE3.nii -prefix time_prep_TI1_TE3_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI2_TE1.nii -b baseline_TI2_TE1.nii -prefix time_prep_TI2_TE1_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI2_TE2.nii -b baseline_TI2_TE2.nii -prefix time_prep_TI2_TE2_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI2_TE3.nii -b baseline_TI2_TE3.nii -prefix time_prep_TI2_TE3_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI3_TE1.nii -b baseline_TI3_TE1.nii -prefix time_prep_TI3_TE1_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI3_TE2.nii -b baseline_TI3_TE2.nii -prefix time_prep_TI3_TE2_norm.nii -overwrite -expr 'a/b-1'
3dcalc -a time_prep_TI3_TE3.nii -b baseline_TI3_TE3.nii -prefix time_prep_TI3_TE3_norm.nii -overwrite -expr 'a/b-1'


3dBandpass -input time_prep_TI1_TE1_norm.nii -band 0.01 1 -prefix time_prep_TI1_TE1_norm.nii -overwrite 
3dBandpass -input time_prep_TI1_TE2_norm.nii -band 0.01 1 -prefix time_prep_TI1_TE2_norm.nii -overwrite 
3dBandpass -input time_prep_TI1_TE3_norm.nii -band 0.01 1 -prefix time_prep_TI1_TE3_norm.nii -overwrite 
3dBandpass -input time_prep_TI2_TE1_norm.nii -band 0.01 1 -prefix time_prep_TI2_TE1_norm.nii -overwrite 
3dBandpass -input time_prep_TI2_TE2_norm.nii -band 0.01 1 -prefix time_prep_TI2_TE2_norm.nii -overwrite 
3dBandpass -input time_prep_TI2_TE3_norm.nii -band 0.01 1 -prefix time_prep_TI2_TE3_norm.nii -overwrite 
3dBandpass -input time_prep_TI3_TE1_norm.nii -band 0.01 1 -prefix time_prep_TI3_TE1_norm.nii -overwrite 
3dBandpass -input time_prep_TI3_TE2_norm.nii -band 0.01 1 -prefix time_prep_TI3_TE2_norm.nii -overwrite 
3dBandpass -input time_prep_TI3_TE3_norm.nii -band 0.01 1 -prefix time_prep_TI3_TE3_norm.nii -overwrite 

LN_TRIAL -input time_prep_TI1_TE1_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI1_TE2_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI1_TE3_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI2_TE1_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI2_TE2_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI2_TE3_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI3_TE1_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI3_TE2_norm.nii -trialdur 60
LN_TRIAL -input time_prep_TI3_TE3_norm.nii -trialdur 60


#make sure its the correct (edited) time course mask 
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI1_TE1_norm_TrialAverage.nii > timecourse_TI1_TE1.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI1_TE2_norm_TrialAverage.nii > timecourse_TI1_TE2.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI1_TE3_norm_TrialAverage.nii > timecourse_TI1_TE3.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI2_TE1_norm_TrialAverage.nii > timecourse_TI2_TE1.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI2_TE2_norm_TrialAverage.nii > timecourse_TI2_TE2.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI2_TE3_norm_TrialAverage.nii > timecourse_TI2_TE3.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI3_TE1_norm_TrialAverage.nii > timecourse_TI3_TE1.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI3_TE2_norm_TrialAverage.nii > timecourse_TI3_TE2.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet time_prep_TI3_TE3_norm_TrialAverage.nii > timecourse_TI3_TE3.dat


1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI1_TE1 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI1_TE1.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI1_TE2 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI1_TE2.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI1_TE3 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI1_TE3.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI2_TE1 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI2_TE1.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI2_TE2 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI2_TE2.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI2_TE3 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI2_TE3.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI3_TE1 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI3_TE1.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI3_TE2 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI3_TE2.dat 
1dplot -sepscl -yaxis -0.03:0.03:5:20  -png TI3_TE3 -overwrite -aspect 1 -line 0 0 59 0 'black' 2 timecourse_TI3_TE3.dat 

#####3
###### extracting response magnitude
#####


LN_TRIAL -input time_prep_TI1_TE1_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI1_TE2_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI1_TE3_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI2_TE1_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI2_TE2_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI2_TE3_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI3_TE1_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI3_TE2_norm.nii -trialdur 20
LN_TRIAL -input time_prep_TI3_TE3_norm.nii -trialdur 20


#may need to change when see the results 
#average of activity and average of rest 
#c and d were activity and a and b were rest 
#abcde as one and subtract 
#4-10 is rest
#14-20 is activity 
3dcalc -overwrite  -prefix delta_TI1_TE1.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI1_TE1_norm_TrialAverage.nii'[3]' -b time_prep_TI1_TE1_norm_TrialAverage.nii'[4]' -c time_prep_TI1_TE1_norm_TrialAverage.nii'[5]' -d time_prep_TI1_TE1_norm_TrialAverage.nii'[6]' -e time_prep_TI1_TE1_norm_TrialAverage.nii'[7]' -f time_prep_TI1_TE1_norm_TrialAverage.nii'[8]' -g time_prep_TI1_TE1_norm_TrialAverage.nii'[9]' -h time_prep_TI1_TE1_norm_TrialAverage.nii'[13]' -i time_prep_TI1_TE1_norm_TrialAverage.nii'[14]' -j time_prep_TI1_TE1_norm_TrialAverage.nii'[15]' -k time_prep_TI1_TE1_norm_TrialAverage.nii'[16]' -l time_prep_TI1_TE1_norm_TrialAverage.nii'[17]' -m time_prep_TI1_TE1_norm_TrialAverage.nii'[18]' -n time_prep_TI1_TE1_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI1_TE2.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI1_TE2_norm_TrialAverage.nii'[3]' -b time_prep_TI1_TE2_norm_TrialAverage.nii'[4]' -c time_prep_TI1_TE2_norm_TrialAverage.nii'[5]' -d time_prep_TI1_TE2_norm_TrialAverage.nii'[6]' -e time_prep_TI1_TE2_norm_TrialAverage.nii'[7]' -f time_prep_TI1_TE2_norm_TrialAverage.nii'[8]' -g time_prep_TI1_TE2_norm_TrialAverage.nii'[9]' -h time_prep_TI1_TE2_norm_TrialAverage.nii'[13]' -i time_prep_TI1_TE2_norm_TrialAverage.nii'[14]' -j time_prep_TI1_TE2_norm_TrialAverage.nii'[15]' -k time_prep_TI1_TE2_norm_TrialAverage.nii'[16]' -l time_prep_TI1_TE2_norm_TrialAverage.nii'[17]' -m time_prep_TI1_TE2_norm_TrialAverage.nii'[18]' -n time_prep_TI1_TE2_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI1_TE3.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI1_TE3_norm_TrialAverage.nii'[3]' -b time_prep_TI1_TE3_norm_TrialAverage.nii'[4]' -c time_prep_TI1_TE3_norm_TrialAverage.nii'[5]' -d time_prep_TI1_TE3_norm_TrialAverage.nii'[6]' -e time_prep_TI1_TE3_norm_TrialAverage.nii'[7]' -f time_prep_TI1_TE3_norm_TrialAverage.nii'[8]' -g time_prep_TI1_TE3_norm_TrialAverage.nii'[9]' -h time_prep_TI1_TE3_norm_TrialAverage.nii'[13]' -i time_prep_TI1_TE3_norm_TrialAverage.nii'[14]' -j time_prep_TI1_TE3_norm_TrialAverage.nii'[15]' -k time_prep_TI1_TE3_norm_TrialAverage.nii'[16]' -l time_prep_TI1_TE3_norm_TrialAverage.nii'[17]' -m time_prep_TI1_TE3_norm_TrialAverage.nii'[18]' -n time_prep_TI1_TE3_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI2_TE1.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI2_TE1_norm_TrialAverage.nii'[3]' -b time_prep_TI2_TE1_norm_TrialAverage.nii'[4]' -c time_prep_TI2_TE1_norm_TrialAverage.nii'[5]' -d time_prep_TI2_TE1_norm_TrialAverage.nii'[6]' -e time_prep_TI2_TE1_norm_TrialAverage.nii'[7]' -f time_prep_TI2_TE1_norm_TrialAverage.nii'[8]' -g time_prep_TI2_TE1_norm_TrialAverage.nii'[9]' -h time_prep_TI2_TE1_norm_TrialAverage.nii'[13]' -i time_prep_TI2_TE1_norm_TrialAverage.nii'[14]' -j time_prep_TI2_TE1_norm_TrialAverage.nii'[15]' -k time_prep_TI2_TE1_norm_TrialAverage.nii'[16]' -l time_prep_TI2_TE1_norm_TrialAverage.nii'[17]' -m time_prep_TI2_TE1_norm_TrialAverage.nii'[18]' -n time_prep_TI2_TE1_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI2_TE2.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI2_TE2_norm_TrialAverage.nii'[3]' -b time_prep_TI2_TE2_norm_TrialAverage.nii'[4]' -c time_prep_TI2_TE2_norm_TrialAverage.nii'[5]' -d time_prep_TI2_TE2_norm_TrialAverage.nii'[6]' -e time_prep_TI2_TE2_norm_TrialAverage.nii'[7]' -f time_prep_TI2_TE2_norm_TrialAverage.nii'[8]' -g time_prep_TI2_TE2_norm_TrialAverage.nii'[9]' -h time_prep_TI2_TE2_norm_TrialAverage.nii'[13]' -i time_prep_TI2_TE2_norm_TrialAverage.nii'[14]' -j time_prep_TI2_TE2_norm_TrialAverage.nii'[15]' -k time_prep_TI2_TE2_norm_TrialAverage.nii'[16]' -l time_prep_TI2_TE2_norm_TrialAverage.nii'[17]' -m time_prep_TI2_TE2_norm_TrialAverage.nii'[18]' -n time_prep_TI2_TE2_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI2_TE3.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI2_TE3_norm_TrialAverage.nii'[3]' -b time_prep_TI2_TE3_norm_TrialAverage.nii'[4]' -c time_prep_TI2_TE3_norm_TrialAverage.nii'[5]' -d time_prep_TI2_TE3_norm_TrialAverage.nii'[6]' -e time_prep_TI2_TE3_norm_TrialAverage.nii'[7]' -f time_prep_TI2_TE3_norm_TrialAverage.nii'[8]' -g time_prep_TI2_TE3_norm_TrialAverage.nii'[9]' -h time_prep_TI2_TE3_norm_TrialAverage.nii'[13]' -i time_prep_TI2_TE3_norm_TrialAverage.nii'[14]' -j time_prep_TI2_TE3_norm_TrialAverage.nii'[15]' -k time_prep_TI2_TE3_norm_TrialAverage.nii'[16]' -l time_prep_TI2_TE3_norm_TrialAverage.nii'[17]' -m time_prep_TI2_TE3_norm_TrialAverage.nii'[18]' -n time_prep_TI2_TE3_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI3_TE1.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI3_TE1_norm_TrialAverage.nii'[3]' -b time_prep_TI3_TE1_norm_TrialAverage.nii'[4]' -c time_prep_TI3_TE1_norm_TrialAverage.nii'[5]' -d time_prep_TI3_TE1_norm_TrialAverage.nii'[6]' -e time_prep_TI3_TE1_norm_TrialAverage.nii'[7]' -f time_prep_TI3_TE1_norm_TrialAverage.nii'[8]' -g time_prep_TI3_TE1_norm_TrialAverage.nii'[9]' -h time_prep_TI3_TE1_norm_TrialAverage.nii'[13]' -i time_prep_TI3_TE1_norm_TrialAverage.nii'[14]' -j time_prep_TI3_TE1_norm_TrialAverage.nii'[15]' -k time_prep_TI3_TE1_norm_TrialAverage.nii'[16]' -l time_prep_TI3_TE1_norm_TrialAverage.nii'[17]' -m time_prep_TI3_TE1_norm_TrialAverage.nii'[18]' -n time_prep_TI3_TE1_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI3_TE2.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI3_TE2_norm_TrialAverage.nii'[3]' -b time_prep_TI3_TE2_norm_TrialAverage.nii'[4]' -c time_prep_TI3_TE2_norm_TrialAverage.nii'[5]' -d time_prep_TI3_TE2_norm_TrialAverage.nii'[6]' -e time_prep_TI3_TE2_norm_TrialAverage.nii'[7]' -f time_prep_TI3_TE2_norm_TrialAverage.nii'[8]' -g time_prep_TI3_TE2_norm_TrialAverage.nii'[9]' -h time_prep_TI3_TE2_norm_TrialAverage.nii'[13]' -i time_prep_TI3_TE2_norm_TrialAverage.nii'[14]' -j time_prep_TI3_TE2_norm_TrialAverage.nii'[15]' -k time_prep_TI3_TE2_norm_TrialAverage.nii'[16]' -l time_prep_TI3_TE2_norm_TrialAverage.nii'[17]' -m time_prep_TI3_TE2_norm_TrialAverage.nii'[18]' -n time_prep_TI3_TE2_norm_TrialAverage.nii'[19]'
3dcalc -overwrite  -prefix delta_TI3_TE3.nii -expr '(h+i+j+k+l+m+n-a-b-c-d-e-f-g)/7' -a time_prep_TI3_TE3_norm_TrialAverage.nii'[3]' -b time_prep_TI3_TE3_norm_TrialAverage.nii'[4]' -c time_prep_TI3_TE3_norm_TrialAverage.nii'[5]' -d time_prep_TI3_TE3_norm_TrialAverage.nii'[6]' -e time_prep_TI3_TE3_norm_TrialAverage.nii'[7]' -f time_prep_TI3_TE3_norm_TrialAverage.nii'[8]' -g time_prep_TI3_TE3_norm_TrialAverage.nii'[9]' -h time_prep_TI3_TE3_norm_TrialAverage.nii'[13]' -i time_prep_TI3_TE3_norm_TrialAverage.nii'[14]' -j time_prep_TI3_TE3_norm_TrialAverage.nii'[15]' -k time_prep_TI3_TE3_norm_TrialAverage.nii'[16]' -l time_prep_TI3_TE3_norm_TrialAverage.nii'[17]' -m time_prep_TI3_TE3_norm_TrialAverage.nii'[18]' -n time_prep_TI3_TE3_norm_TrialAverage.nii'[19]'



3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI1_TE1.nii > deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI1_TE2.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI1_TE3.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI2_TE1.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI2_TE2.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI2_TE3.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI3_TE1.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI3_TE2.nii >> deltas.dat
3dROIstats -mask bin_timecoursemask.nii -1DRformat -overwrite -quiet delta_TI3_TE3.nii >> deltas.dat


