#!/usr/bin/octave -qf

load data/usps/tr.dat ; 
load data/usps/trlabels.dat;
load data/usps/ts.dat ; 
load data/usps/tslabels.dat;


	res = svmtrain(trlabels, tr, '-t 2 -c 10 -d 2');
	res.sv_indices;
	res.sv_coef;
	O=res.sv_coef' * res.SVs;
	O_0=-res.rho;

	x=[1:1:7];
	#Calculo de la recta
	y=(-O(1)/O(2))*x - O_0/O(2);
	#calculo de los margenes de la frontera
	y_1=(-O(1)/O(2))*x - (O_0-1)/O(2);
	y_2=(-O(1)/O(2))*x - (O_0+1)/O(2);

	vectores = res.SVs;
	for i = vectores'
		x=reshape(i,16,16);
		imshow(x')
		pause()
	endfor	

pause()
