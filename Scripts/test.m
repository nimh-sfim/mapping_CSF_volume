
%CSF
T2star = 4000 ; 
T1 = 4000 ; 
TE1 = 9.42 ; 
TE2 = 29.22 ; 
TE3 = 49.02 ; 
TI1 = 731.2 ; 
TI2 = 1573.6 ; 
TI3 = 2416 ;
inve_efficienty = -0.2; 

disp('CSF TE1 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE1/T2star)
disp('CSF TE2 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE2/T2star)
disp('CSF TE3 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE3/T2star)
disp('CSF TE1 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE1/T2star)
disp('CSF TE2 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE2/T2star)
disp('CSF TE3 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE3/T2star)
disp('CSF TE1 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE1/T2star)
disp('CSF TE2 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE2/T2star)
disp('CSF TE3 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE3/T2star)



%GM
T2star = 25.1 ; 
T1 = 1950 ; 
inve_efficienty = -0.30; 

disp('GM TE1 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE1/T2star)
disp('GM TE2 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE2/T2star)
disp('GM TE3 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE3/T2star)
disp('GM TE1 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE1/T2star)
disp('GM TE2 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE2/T2star)
disp('GM TE3 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE3/T2star)
disp('GM TE1 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE1/T2star)
disp('GM TE2 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE2/T2star)
disp('GM TE3 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE3/T2star)


%blood
T2star = 37.5 ; 
T1 = 2100 ; 
inve_efficienty = -0.25; 

disp('blood TE1 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE1/T2star)
disp('blood TE2 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE2/T2star)
disp('blood TE3 TI1') 
(1-(1-inve_efficienty )*exp(-TI1/T1))*exp(-TE3/T2star)
disp('blood TE1 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE1/T2star)
disp('blood TE2 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE2/T2star)
disp('blood TE3 TI2') 
(1-(1-inve_efficienty )*exp(-TI2/T1))*exp(-TE3/T2star)
disp('blood TE1 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE1/T2star)
disp('blood TE2 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE2/T2star)
disp('blood TE3 TI3') 
(1-(1-inve_efficienty )*exp(-TI3/T1))*exp(-TE3/T2star)