#!/usr/bin/octave -qf

load data/spam/tr.dat ; 
load data/spam/trlabels.dat;
load data/spam/ts.dat ; 
load data/spam/tslabels.dat;


for i=[0,1,2]
	for c=[0.01 0.1 1 10 100]
		i
		c
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
