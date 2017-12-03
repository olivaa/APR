#!/usr/bin/octave -qf

load data/usps/tr.dat ; 
load data/usps/trlabels.dat;
load data/usps/ts.dat ; 
load data/usps/tslabels.dat;


for i=[0,1,2]
	for c=[0.01 0.1 1 10 100]
		if(i==1)
			kk=['-t ' num2str(i) ' -c ' num2str(c) ' -d 2 '];
			res = svmtrain(trlabels, tr, kk);
			svmpredict(tslabels,ts, res,' ');
        endif
		kk= ['-t ' num2str(i) ' -c ' num2str(c)];
		res = svmtrain(trlabels, tr,kk);
		svmpredict(tslabels,ts, res,' ');
	endfor	
endfor
