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
			[predic_label,accuracy,prob_stimates]=svmpredict(tslabels,ts, res,' ');
                        [nrows,ncols]=size(prob_stimates);
			%Calculamos el intervalo de confianza para la prob de error
			i
			c
			err=(1-accuracy(1)/100)
			intsupe=err+1.96*(sqrt(err*(1-err)/nrows))*100
			intinfe=err-1.96*(sqrt(err*(1-err)/nrows))*100


        endif
		kk= ['-t ' num2str(i) ' -c ' num2str(c)];
		res = svmtrain(trlabels, tr,kk);
	        [predic_label,accuracy,prob_stimates]=svmpredict(tslabels,ts, res,' ');
                [nrows,ncols]=size(prob_stimates);
		%Calculamos el intervalo de confianza para la prob de error
		i
		c
		err=(1-accuracy(1)/100)
		intsupe=err+1.96*(sqrt(err*(1-err)/nrows))*100
		intinfe=err-1.96*(sqrt(err*(1-err)/nrows))*100

	
	endfor	
endfor
