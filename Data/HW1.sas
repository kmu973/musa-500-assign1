libname hwone 'C:\Users\eugeneby\Dropbox\Documents\Work and School\Teaching\CPLN 671 - Statistics and Data Mining\Homework Assignments\HW 1';
PROC IMPORT OUT= HWONE.hw1raw 
            DATAFILE= "C:\Users\eugeneby\Dropbox\Documents\Work and Scho
ol\Teaching\CPLN 671 - Statistics and Data Mining\Homework Assignments\H
W 1\RegressionData.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

data hwone.hw1cleaned;
	set hwone.hw1raw;

	lnmedhval = log(medhval + 1);
	lnmedhhinc = log(medhhinc + 1);
	lnnbelpov = log(nbelpov100 + 1);
run;

ods html file = "Results.html";
proc reg data=hwone.hw1cleaned;
	model lnmedhval = lnnbelpov: pctvacant pctsingl: pctbach:/ss1 ss3;
run;
ods html close;
