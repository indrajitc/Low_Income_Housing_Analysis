/*Low Income Housing Analysis*/
/*Project 2 Objectives 1 and 2*/

/*Creation of Project 2 library*/
libname project2 'C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2';
/*Conversion Rate into Dollars for Housing Value Codes*/
data project2.val;
input value r1 r2;
valuen = (r1+r2)/2.0;
keep value valuen;
cards;
01 0 10000
02 10000 14999
03 15000 19999
04 20000 24999
05 25000 29999
06 30000 34999
07 35000 39999
08 40000 49999
09 50000 59999
10 60000 69999
11 70000 79999
12 80000 89999
13 90000 99999
14 100000 124999
15 125000 149999
16 150000 174999
17 175000 199999
18 200000 249999
19 250000 299999
20 300000 399999
21 400000 499999
22 500000 749999
23 750000 999999
24 1000000 1000000
;
run;
proc sort data=project2.val;
by value;
run;
/*Merging all 3 states into one dataset state*/
data project2.state; set project2.g2wvamar project2.gnj;
run;
proc sort data=project2.state;
by value; run;
/*Creating Dataset b for analysis of income*/
data project2.state; merge project2.state project2.val;
by value;
run;
proc sort; by state;
proc univariate freq data=project2.state noprint;
var lhinc;
by state; 
output out=project2.a  PCTLPRE=p 
PCTLPTS=1 2 3 4 5 7 10 20 30 40 50 60 70 80 90 93 95 96 97 98 99;
run;
proc transpose data=project2.a out=project2.b;
run;
data project2.b; set project2.b ; if _N_> 1;run;
DATA project2.b1;
/* Adjust b so that percentiles are numerical*/ 
	SET project2.b;
	IF (COL1 = 24) THEN DELETE;
	percentile = .;
	Maryland = COL1;
	New_Jersey = COL2;
	West_Virginia = COL3; 
	IF (_NAME_="p1") THEN percentile = 1;
	IF (_NAME_="p2") THEN percentile = 2;
	IF (_NAME_="p3") THEN percentile = 3;
	IF (_NAME_="p4") THEN percentile = 4;
	IF (_NAME_="p5") THEN percentile = 5;
	IF (_NAME_="p7") THEN percentile = 7;
	IF (_NAME_="p10") THEN percentile = 10;
	IF (_NAME_="p20") THEN percentile = 20;
	IF (_NAME_="p30") THEN percentile = 30;
	IF (_NAME_="p40") THEN percentile = 40;
	IF (_NAME_="p50") THEN percentile = 50;
	IF (_NAME_="p60") THEN percentile = 60;
	IF (_NAME_="p70") THEN percentile = 70;
	IF (_NAME_="p80") THEN percentile = 80;
	IF (_NAME_="p90") THEN percentile = 90;
	IF (_NAME_="p93") THEN percentile = 93;
	IF (_NAME_="p95") THEN percentile = 95;
	IF (_NAME_="p96") THEN percentile = 96;
	IF (_NAME_="p97") THEN percentile = 97;
	IF (_NAME_="p98") THEN percentile = 98;
	IF (_NAME_="p99") THEN percentile = 99;
RUN;
/*PROC PRINT DATA = project2.b;
RUN;*/
/*Creating Lineplot of Percentiles for Log of Household Income between MD, NJ and WV*/
TITLE 'Percentile-Percentile Plot For Log of Household Income Between Maryland, New Jersey and West Virginia';
symbol1 color=red
        interpol=join
        value=dot;
symbol2 value=dot
        color=blue
        interpol=join;
symbol3 value=dot
        color=green
        interpol=join;
axis1 label=("Percentile");                                                                                     
axis2 label=(angle = 90 "Log of Income");
legend1 label=none frame position=(top center inside);
PROC GPLOT DATA=project2.b1;
	PLOT Maryland*percentile New_Jersey*percentile West_Virginia*percentile/overlay legend=legend1
	haxis=axis1 vaxis=axis2;
RUN;
/*Household Value*/
DATA project2.state1;
/*Create Log of Household Value (valuen is mean of range)*/ 
	SET project2.state;
	IF (valuen = ".") THEN DELETE;
	lvalue = log(valuen);
RUN;
proc univariate freq data=project2.state1 noprint;
var lvalue;
by state; 
output out=project2.a  PCTLPRE=p 
PCTLPTS=1 2 3 4 5 7 10 20 30 40 50 60 70 80 90 93 95 96 97 98 99;
run;
proc transpose data=project2.a out=project2.b;
run;
data project2.b; set project2.b ; if _N_> 1;run;
DATA project2.b1;
/* Adjust b so that percentiles are numerical*/ 
	SET project2.b;
	IF (COL1 = 24) THEN DELETE;
	percentile = .;
	Maryland = COL1;
	New_Jersey = COL2;
	West_Virginia = COL3; 
	IF (_NAME_="p1") THEN percentile = 1;
	IF (_NAME_="p2") THEN percentile = 2;
	IF (_NAME_="p3") THEN percentile = 3;
	IF (_NAME_="p4") THEN percentile = 4;
	IF (_NAME_="p5") THEN percentile = 5;
	IF (_NAME_="p7") THEN percentile = 7;
	IF (_NAME_="p10") THEN percentile = 10;
	IF (_NAME_="p20") THEN percentile = 20;
	IF (_NAME_="p30") THEN percentile = 30;
	IF (_NAME_="p40") THEN percentile = 40;
	IF (_NAME_="p50") THEN percentile = 50;
	IF (_NAME_="p60") THEN percentile = 60;
	IF (_NAME_="p70") THEN percentile = 70;
	IF (_NAME_="p80") THEN percentile = 80;
	IF (_NAME_="p90") THEN percentile = 90;
	IF (_NAME_="p93") THEN percentile = 93;
	IF (_NAME_="p95") THEN percentile = 95;
	IF (_NAME_="p96") THEN percentile = 96;
	IF (_NAME_="p97") THEN percentile = 97;
	IF (_NAME_="p98") THEN percentile = 98;
	IF (_NAME_="p99") THEN percentile = 99;
RUN;
/*Creating Lineplot of Percentiles for Log of Household Value between MD, NJ and WV*/
TITLE 'Percentile-Percentile Plot For Log of Household Value Between Maryland, New Jersey and West Virginia';
symbol1 color=red
        interpol=join
        value=dot;
symbol2 value=dot
        color=blue
        interpol=join;
symbol3 value=dot
        color=green
        interpol=join;
axis1 label=("Percentile");                                                                                     
axis2 label=(angle = 90 "Log of Household Value");
legend1 label=none frame position=(top center inside);
PROC GPLOT DATA=project2.b1;
	PLOT Maryland*percentile New_Jersey*percentile West_Virginia*percentile/overlay legend=legend1
	haxis=axis1 vaxis=axis2;
RUN;
/*Rental Value*/
DATA project2.state2;
/*Create Log of Rental Value(per month) */ 
	SET project2.state;
	IF (valuen ^= ".") THEN DELETE;
	lgrent = log(grent);
RUN;
proc univariate freq data=project2.state2 noprint;
var lgrent;
by state; 
output out=project2.a  PCTLPRE=p 
PCTLPTS=1 2 3 4 5 7 10 20 30 40 50 60 70 80 90 93 95 96 97 98 99;
run;
proc transpose data=project2.a out=project2.b;
run;
data project2.b; set project2.b ; if _N_> 1;run;
DATA project2.b2;
/* Adjust b so that percentiles are numerical*/ 
	SET project2.b;
	IF (COL1 = 24) THEN DELETE;
	percentile = .;
	Maryland = COL1;
	New_Jersey = COL2;
	West_Virginia = COL3; 
	IF (_NAME_="p1") THEN percentile = 1;
	IF (_NAME_="p2") THEN percentile = 2;
	IF (_NAME_="p3") THEN percentile = 3;
	IF (_NAME_="p4") THEN percentile = 4;
	IF (_NAME_="p5") THEN percentile = 5;
	IF (_NAME_="p7") THEN percentile = 7;
	IF (_NAME_="p10") THEN percentile = 10;
	IF (_NAME_="p20") THEN percentile = 20;
	IF (_NAME_="p30") THEN percentile = 30;
	IF (_NAME_="p40") THEN percentile = 40;
	IF (_NAME_="p50") THEN percentile = 50;
	IF (_NAME_="p60") THEN percentile = 60;
	IF (_NAME_="p70") THEN percentile = 70;
	IF (_NAME_="p80") THEN percentile = 80;
	IF (_NAME_="p90") THEN percentile = 90;
	IF (_NAME_="p93") THEN percentile = 93;
	IF (_NAME_="p95") THEN percentile = 95;
	IF (_NAME_="p96") THEN percentile = 96;
	IF (_NAME_="p97") THEN percentile = 97;
	IF (_NAME_="p98") THEN percentile = 98;
	IF (_NAME_="p99") THEN percentile = 99;
RUN;
/*Creating Lineplot of Percentiles for Log of Monthly Rent Value between MD, NJ and WV*/
TITLE 'Percentile-Percentile Plot For Log of Monthly Rent Value Between Maryland, New Jersey and West Virginia';
symbol1 color=red
        interpol=join
        value=dot;
symbol2 value=dot
        color=blue
        interpol=join;
symbol3 value=dot
        color=green
        interpol=join;
axis1 label=("Percentile");                                                                                     
axis2 label=(angle = 90 "Log of Monthly Rent");
legend1 label=none frame position=(top center inside);
PROC GPLOT DATA=project2.b2;
	PLOT Maryland*percentile New_Jersey*percentile West_Virginia*percentile/overlay legend=legend1
	haxis=axis1 vaxis=axis2;
RUN;
/*proc export data=project2.state
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\state.csv'
    dbms=csv
    replace;
run;*/

/*Objective 2: State Basic Statistics*/

/*NJ Basic Statistics*/

/*Splitting State into NJ segment*/
data project2.stateNJ; set project2.state;
if state=34;
run;
proc sort data=project2.stateNJ; by puma1; /*Sorting NJ data by PUMA region*/
data project2.faminc; set project2.stateNJ; /*Splitting NJ Data into only Family household types(107529 obs)*/
if hht=1 or hht=2 or hht=3;
run;
proc means median data=project2.faminc noprint; /*Calculation of Mean Family Income for each Puma region*/
 var finc;
 weight hweight;
 by puma1;
 output out=project2.c median=med;
run;
data project2.c;
  set project2.c;
  keep puma1 med; /*Only keep puma region and median variables in dataset c*/
  run;
data project2.stateNJ; /*Merge median values back into nj state data*/
  merge project2.stateNJ project2.c;
  by puma1;
run; 
data project2.stateNJ; set project2.stateNJ;
m4 = med*0.8;
/* if m4 > 50200 then m4 = 50200; */
hlinc = 0; /*hlinc = 1 specifies low income household*/
 units=1;
 if persons <= 4 and hinc < m4*(1-(4-persons)*0.1) then hlinc = 1;
 if persons > 4 and hinc < m4*(1+(persons-4)*0.08) then hlinc = 1;
/***************
* This calculates the percentage of households
* below the 80pct of median
******************/
/* Crowded */
uncrowd = 0;
if persons <= rooms then uncrowd = 1;
/* new construction */
new = 0;
if yrbuilt=1 or yrbuilt=2 or yrbuilt=3 then new =1;
/* Affordable */
Aff = 0;
if smocapi > 0 then grapi=.;
if grapi > 0 then smocapi=.;
if smocapi ne . and  smocapi <= 30 then Aff=1;
if grapi ne . and grapi <= 30 then Aff=1;
xnum = Aff*uncrowd*new*hlinc;
enum = Aff*new*hlinc;
cnum = uncrowd*new*hlinc;
denom = new;
denom2 = new*hlinc;
tot = 1;
run;
proc means data=project2.stateNJ noprint;
var denom denom2 xnum enum cnum hlinc tot;
by puma1;
weight hweight;
output out = project2.res sum= sdenom sdenom2 snum senum scnum slinc stot;
run;
data project2.res; set project2.res;
rat = snum/sdenom;
rat2 = snum/sdenom2;
rat3 = slinc/stot;
state = 'NJ';
keep puma1 state snum senum scnum sdenom sdenom2 slinc stot rat rat2 rat3;
run;
data project2.res; /*Merge median values back into res data*/
  merge project2.res project2.c;
  by puma1;
run; 
data project2.res1;
	retain state puma1 med rat rat2 rat3;
	set project2.res;
	keep state puma1 med rat rat2 rat3;  
run;
TITLE 'Basic Statistics for NJ';
proc print data = project2.res1;
run;

/*MD Basic Statistics*/

/*Splitting State into MD segment*/
data project2.stateMD; set project2.state;
if state=24;
run;
proc sort data=project2.stateMD; by puma1; /*Sorting MD data by PUMA region*/
data project2.faminc; set project2.stateMD; /*Splitting MD Data into only Family household types(96563 obs)*/
if hht=1 or hht=2 or hht=3;
run;
proc means median data=project2.faminc noprint; /*Calculation of Mean Family Income for each Puma region*/
 var finc;
 weight hweight;
 by puma1;
 output out=project2.c median=med;
run;
data project2.c;
  set project2.c;
  keep puma1 med; /*Only keep puma region and median variables in dataset c*/
  run;
data project2.stateMD; /*Merge median values back into MD state data*/
  merge project2.stateMD project2.c;
  by puma1;
run; 
data project2.stateMD; set project2.stateMD;
m4 = med*0.8;
/* if m4 > 50200 then m4 = 50200; */
hlinc = 0;
 units=1;
 if persons <= 4 and hinc < m4*(1-(4-persons)*0.1) then hlinc = 1;
 if persons > 4 and hinc < m4*(1+(persons-4)*0.08) then hlinc = 1;
/***************
* This calculates the percentage of households
* below the 80pct of median
******************/
/* Crowded */
uncrowd = 0;
if persons <= rooms then uncrowd = 1;
/* new construction */
new = 0;
if yrbuilt=1 or yrbuilt=2 or yrbuilt=3 then new =1;
/* Affordable */
Aff = 0;
if smocapi > 0 then grapi=.;
if grapi > 0 then smocapi=.;
if smocapi ne . and  smocapi <= 30 then Aff=1;
if grapi ne . and grapi <= 30 then Aff=1;
xnum = Aff*uncrowd*new*hlinc;
enum = Aff*new*hlinc;
cnum = uncrowd*new*hlinc;
denom = new;
denom2 = new*hlinc;
tot = 1;
run;
proc means data=project2.stateMD noprint;
var denom denom2 xnum enum cnum hlinc tot;
by puma1;
weight hweight;
output out = project2.res sum= sdenom sdenom2 snum senum scnum slinc stot;
run;
data project2.res; set project2.res;
rat = snum/sdenom;
rat2 = snum/sdenom2;
rat3 = slinc/stot;
state = 'MD';
keep puma1 state snum senum scnum sdenom sdenom2 slinc stot rat rat2 rat3;
run;
data project2.res; /*Merge median values back into res data*/
  merge project2.res project2.c;
  by puma1;
run; 
data project2.res1;
	retain state puma1 med rat rat2 rat3;
	set project2.res;
	keep state puma1 med rat rat2 rat3;  
run;
TITLE 'Basic Statistics for MD';
proc print data = project2.res1;
run;

/*WV Basic Statistics*/

/*Splitting State into WV segment*/
data project2.stateWV; set project2.state;
if state=54;
run;
proc sort data=project2.stateWV; by puma1; /*Sorting WV data by PUMA region*/
data project2.faminc; set project2.stateWV; /*Splitting WV Data into only Family household types(24147 obs)*/
if hht=1 or hht=2 or hht=3;
run;
proc means median data=project2.faminc noprint; /*Calculation of Mean Family Income for each Puma region*/
 var finc;
 weight hweight;
 by puma1;
 output out=project2.c median=med;
run;
data project2.c;
  set project2.c;
  keep puma1 med; /*Only keep puma region and median variables in dataset c*/
  run;
data project2.stateWV; /*Merge median values back into WV state data*/
  merge project2.stateWV project2.c;
  by puma1;
run; 
data project2.stateWV; set project2.stateWV;
m4 = med*0.8;
/* if m4 > 50200 then m4 = 50200; */
hlinc = 0;
 units=1;
 if persons <= 4 and hinc < m4*(1-(4-persons)*0.1) then hlinc = 1;
 if persons > 4 and hinc < m4*(1+(persons-4)*0.08) then hlinc = 1;
/***************
* This calculates the percentage of households
* below the 80pct of median
******************/
/* Crowded */
uncrowd = 0;
if persons <= rooms then uncrowd = 1;
/* new construction */
new = 0;
if yrbuilt=1 or yrbuilt=2 or yrbuilt=3 then new =1;
/* Affordable */
Aff = 0;
if smocapi > 0 then grapi=.;
if grapi > 0 then smocapi=.;
if smocapi ne . and  smocapi <= 30 then Aff=1;
if grapi ne . and grapi <= 30 then Aff=1;
xnum = Aff*uncrowd*new*hlinc;
enum = Aff*new*hlinc;
cnum = uncrowd*new*hlinc;
denom = new;
denom2 = new*hlinc;
tot = 1;
run;
proc means data=project2.stateWV noprint;
var denom denom2 xnum enum cnum hlinc tot;
by puma1;
weight hweight;
output out = project2.res sum= sdenom sdenom2 snum senum scnum slinc stot;
run;
data project2.res; set project2.res;
rat = snum/sdenom;
rat2 = snum/sdenom2;
rat3 = slinc/stot;
state = 'WV';
keep puma1 state snum senum scnum sdenom sdenom2 slinc stot rat rat2 rat3;
run;
data project2.res; /*Merge median values back into res data*/
  merge project2.res project2.c;
  by puma1;
run; 
data project2.res1;
	retain state puma1 med rat rat2 rat3;
	set project2.res;
	keep state puma1 med rat rat2 rat3;  
run;
TITLE 'Basic Statistics for WV';
proc print data = project2.res1;
run;

/*Objective 3: Logistic Regression Models*/

/*Create variable to specify households that fall less than 50% of median income*/
/*We call this Super Low Income hslinc*/
data project2.stateNJ; set project2.stateNJ;
m5 = med*0.5;
hslinc = 0; /*hslinc = 1 specifies super low income household*/
 if persons <= 4 and hinc < m5*(1-(4-persons)*0.1) then hslinc = 1;
 if persons > 4 and hinc < m5*(1+(persons-4)*0.08) then hslinc = 1;
run;
data project2.stateMD; set project2.stateMD;
m5 = med*0.5;
hslinc = 0; /*hslinc = 1 specifies super low income household*/
 if persons <= 4 and hinc < m5*(1-(4-persons)*0.1) then hslinc = 1;
 if persons > 4 and hinc < m5*(1+(persons-4)*0.08) then hslinc = 1;
run;
data project2.stateWV; set project2.stateWV;
m5 = med*0.5;
hslinc = 0; /*hslinc = 1 specifies super low income household*/
 if persons <= 4 and hinc < m5*(1-(4-persons)*0.1) then hslinc = 1;
 if persons > 4 and hinc < m5*(1+(persons-4)*0.08) then hslinc = 1;
run;
/*Objective 3: Logistic Regression Models*/
/*Creation/Accessing of Project 2 library*/
libname project2 'C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2';
/*NJ (State 34)*/
/*NJ Low Income*/
/*NJ Low Income Homeowners*/
data project2.ownerNJ;  set project2.stateNJ; if smocapi > 0 and smocapi <= 99 and hlinc=1;
/*Create Subset of NJ households that are low-income home owners*/
/*27671 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
sm = log( smocapi+2/(102-smocapi)); /*Remove skewness from percentage of income going to house*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;  
run;
/*Exporting of ownerNJ into csv format for analysis in R*/
proc export data=project2.ownerNJ
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\ownerNJ.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Low-Income Homeowner Families in NJ';
proc logistic data= project2.ownerNJ;
	weight hweight;
	model Aff =persons vehicl sex age uncrowd new No_Vehicle Young_Head Young_Female_Head Partner_Household 
	Family_Household Female_Led_Family Old_head HS_Degree College_Degree Female_No_College;
 run;
 /*Re-run Logistic Regression after removing non-significant variables*/
TITLE 'Logistic Regression for Affordability for Low-Income Homeowner Families in NJ';
proc logistic data= project2.ownerNJ;
	weight hweight;
	model Aff =persons age uncrowd new No_Vehicle Young_Head Young_Female_Head Partner_Household 
	Family_Household Female_Led_Family Old_head HS_Degree College_Degree Female_No_College;
 run;
/*NJ Low Income Renters*/
data project2.rentalNJ;  set project2.stateNJ; if grapi > 0 and grapi <= 99 and hlinc=1;
/*Create Subset of NJ rentals that are low-income renters*/
/*24505 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
gra = log( grapi+2/(102-grapi)); /*Remove skewness from percentage of income going to rent*/;
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of rentalNJ into csv format for analysis in R*/
proc export data=project2.rentalNJ
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\rentalNJ.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Low-Income Renter Families in NJ';
proc logistic data= project2.rentalNJ;
	weight hweight;
	model Aff = persons vehicl sex trvtime uncrowd new Female_No_College;
run;
/*NJ Super Low Income*/
/*NJ Super Low Income Homeowners*/
data project2.ownerNJ_superlow;  set project2.stateNJ; if smocapi > 0 and smocapi <= 99 and hslinc=1;
/*Create Subset of NJ households that are super low-income home owners*/
/*11356 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
sm = log( smocapi+2/(102-smocapi)); /*Remove skewness from percentage of income going to house*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of ownerNJ_superlow into csv format for analysis in R*/
proc export data=project2.ownerNJ_superlow
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\ownerNJ_superlow.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Homeowner Families in NJ';
proc logistic data= project2.ownerNJ;
	weight hweight;
	model Aff = sex age uncrowd Partner_Household Old_Head;
run;
/*NJ Super Low Income Renters*/
data project2.rentalNJ_superlow;  set project2.stateNJ; if grapi > 0 and grapi <= 99 and hslinc=1;
/*Create Subset of NJ rentals that are super low-income home owners*/
/*14204 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
gra = log( grapi+2/(102-grapi)); /*Remove skewness from percentage of income going to rent*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of rentalNJ_superlow into csv format for analysis in R*/
proc export data=project2.rentalNJ_superlow
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\rentalNJ_superlow.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Renter Families in NJ';
proc logistic data= project2.rentalNJ_superlow;
	weight hweight;
	model Aff = age educ trvtime uncrowd No_Vehicle Old_Head HS_Degree;
 run;
/*MD (State 24)*/
/*MD Low Income Homeowners*/
data project2.ownerMD;  set project2.stateMD; if smocapi > 0 and smocapi <= 99 and hlinc=1;
/*Create Subset of MD households that are low-income home owners*/
/*17591 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
sm = log( smocapi+2/(102-smocapi)); /*Remove skewness from percentage of income going to house*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;  
run;
/*Exporting of ownerMD into csv format for analysis in R*/
proc export data=project2.ownerMD
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\ownerMD.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Low-Income Homeowner Families in MD';
proc logistic data= project2.ownerMD;
	weight hweight;
	model Aff = persons vehicl sex age uncrowd new No_Vehicle Young_Head Partner_Household Old_Head College_Degree;
 run;
/*MD Low Income Renters*/
data project2.rentalMD;  set project2.stateMD; if grapi > 0 and grapi <= 99 and hlinc=1;
/*Create Subset of MD rentals that are low-income renters*/
/*14902 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
gra = log( grapi+2/(102-grapi)); /*Remove skewness from percentage of income going to rent*/;
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of rentalMD into csv format for analysis in R*/
proc export data=project2.rentalMD
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\rentalMD.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Low-Income Renter Families in MD';
proc logistic data= project2.rentalMD;
	weight hweight;
	model Aff = persons vehicl sex educ trvtime uncrowd new short_commute;
run;
/*MD Super Low Income*/
/*MD Super Low Income Homeowners*/
data project2.ownerMD_superlow;  set project2.stateMD; if smocapi > 0 and smocapi <= 99 and hslinc=1;
/*Create Subset of MD households that are super low-income home owners*/
/*6996 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
sm = log( smocapi+2/(102-smocapi)); /*Remove skewness from percentage of income going to house*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of ownerMD_superlow into csv format for analysis in R*/
proc export data=project2.ownerMD_superlow
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\ownerMD_superlow.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Homeowner Families in MD';
proc logistic data= project2.ownerMD;
	weight hweight;
	model Aff = age educ Short_Commute Partner_Household Old_head  College_Degree;
run;
/*Logistic Regression re-run after removing non-significant terms*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Homeowner Families in MD';
proc logistic data= project2.ownerMD;
	weight hweight;
	model Aff = age Partner_Household Old_head  College_Degree;
run;
/*MD Super Low Income Renters*/
data project2.rentalMD_superlow;  set project2.stateMD; if grapi > 0 and grapi <= 99 and hslinc=1;
/*Create Subset of MD rentals that are super low-income home owners*/
/*8147 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
gra = log( grapi+2/(102-grapi)); /*Remove skewness from percentage of income going to rent*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of rentalMD_superlow into csv format for analysis in R*/
proc export data=project2.rentalMD_superlow
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\rentalMD_superlow.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Renter Families in MD';
proc logistic data= project2.rentalMD_superlow;
	weight hweight;
	model Aff = persons age educ trvtime No_Vehicle Old_Head;
 run;
/*WV (State 54)*/
/*WV Low Income Homeowners*/
data project2.ownerWV;  set project2.stateWV; if smocapi > 0 and smocapi <= 99 and hlinc=1;
/*Create Subset of WV households that are low-income home owners*/
/*9071 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
sm = log( smocapi+2/(102-smocapi)); /*Remove skewness from percentage of income going to house*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;  
run;
/*Exporting of ownerWV into csv format for analysis in R*/
proc export data=project2.ownerWV
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\ownerWV.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Low-Income Homeowner Families in WV';
proc logistic data= project2.ownerWV;
	weight hweight;
	model Aff = vehicl sex age uncrowd new No_Vehicle Old_Head;
run;
/*WV Low Income Renters*/
data project2.rentalWV;  set project2.stateWV; if grapi > 0 and grapi <= 99 and hlinc=1;
/*Create Subset of WV rentals that are low-income renters*/
/*4272 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
gra = log( grapi+2/(102-grapi)); /*Remove skewness from percentage of income going to rent*/;
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of rentalWV into csv format for analysis in R*/
proc export data=project2.rentalWV
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\rentalWV.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Low-Income Renter Families in WV';
proc logistic data= project2.rentalWV;
	weight hweight;
	model Aff = persons sex age educ trvtime uncrowd Young_Female_Head Family_Household Old_Head;
run;
/*WV Super Low Income Homeowners*/
data project2.ownerWV_superlow;  set project2.stateWV; if smocapi > 0 and smocapi <= 99 and hslinc=1;
/*Create Subset of WV homeowners that are super low-income home owners*/
/* 4394 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
sm = log( smocapi+2/(102-smocapi));/*Remove skewness from percentage of income going to house*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of ownerWV_superlow into csv format for analysis in R*/
proc export data=project2.ownerWV_superlow
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\ownerWV_superlow.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Homeowner Families in WV';
proc logistic data= project2.ownerWV_superlow;
	weight hweight;
	model Aff = sex age educ new Short_Commute Female_Led_Family Old_Head;
 run;
 /*Re-Run Logistic Regression after removing non-significant terms*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Homeowner Families in WV';
proc logistic data= project2.ownerWV_superlow;
	weight hweight;
	model Aff = sex age educ new Short_Commute Old_Head;
 run;
/*WV Super Low Income Renters*/
data project2.rentalWV_superlow;  set project2.stateWV; if grapi > 0 and grapi <= 99 and hslinc=1;
/*Create Subset of WV rentals that are super low-income home owners*/
/*2896 Observations*/
lhinc = log(1+hinc); /*Remove skewness from household income*/ 
gra = log( grapi+2/(102-grapi)); /*Remove skewness from percentage of income going to rent*/
No_Vehicle = 0; Young_Head = 0; Young_Female_Head=0; Short_Commute = 0;
Partner_Household = 0; Family_Household = 0; Female_Led_Family = 0; Old_Head = 0; HS_Degree = 0; 
College_Degree = 0; Female_No_College = 0;  
if VEHICL < 1 then No_Vehicle = 1;
if AGE < 30 then Young_Head = 1; 
if SEX = 2 and Young_Head = 1 then Young_Female_Head = 1; 
if TRVTIME < 30 then Short_Commute = 1;
if PERSONS = 2 then Partner_Household = 1; 
if PERSONS > 2 then Family_Household = 1;
if Family_Household = 1 and SEX = 2 then Female_Led_Family = 1; 
if AGE > 64 then Old_Head = 1;
if educ > 8 then HS_Degree = 1; 
if educ > 11 then College_Degree = 1; 
if SEX = 2 and College_Degree = 0 then Female_No_College = 1;    
run;
/*Exporting of rentalWV_superlow into csv format for analysis in R*/
proc export data=project2.rentalWV_superlow
    outfile='C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 2\Project_2\rentalWV_superlow.csv'
    dbms=csv
    replace;
run;
/*Logistic Regression using variables specified by glmnet in R*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Renter Families in WV';
proc logistic data= project2.rentalWV_superlow;
	weight hweight;
	model Aff = age educ Old_Head;
 run;
/*Re-run Logistic Regression using only significant variables*/
TITLE 'Logistic Regression for Affordability for Super Low-Income Renter Families in WV';
proc logistic data= project2.rentalWV_superlow;
	weight hweight;
	model Aff = age educ;
 run;
