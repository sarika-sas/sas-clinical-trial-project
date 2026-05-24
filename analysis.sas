proc import datafile='/home/u64112666/clinical trial data.csv'
out=bpdata
dbms=csv replace;
getnames=YES; run;

proc print data=bpdata; run;

data bpdata2; 
set bpdata;
BP_Reduction = BP_Before - BP_After;
run;

proc means data=bpdata2 mean min max;
VAR Age BP_Before BP_After 
BP_Reduction; run;

proc means data=bpdata2 mean;
class Treatment;
var BP_Reduction;
run;

proc freq data=bpdata2;
tables Gender Treatment;
run;

proc SGPLOT data=bpdata2;
Vbar Treatment / 
response=BP_Reduction stat=mean;
run;




















