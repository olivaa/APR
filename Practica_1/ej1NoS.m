#!/usr/bin/octave -qf

##########EJERCICO 3.1################3

load data/mini/tr.dat ; 
load data/mini/trlabels.dat;
for c=[0.01 0.1 1 10 100 1000]
	kk=['-t 0 -c ' num2str(c)]
	res = svmtrain(trlabels, tr, kk);
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

	#Representacion gráfica
	
	plot(tr(trlabels==1,1),tr(trlabels==1,2),"o"
	,tr(trlabels==2,1),tr(trlabels==2,2),"s",
	x,y,x,y_1,x,y_2,res.SVs(:,1),res.SVs(:,2),"+k");
	xSVs=res.SVs(:,1);
	ySVs=res.SVs(:,2);
	etiquetas=res.sv_indices;
	[r,c]=size(etiquetas);
	
	for i=[1:r]
	   if trlabels(res.sv_indices(i))==1
		t=1-1*(O*res.SVs(i,:)'+O_0)
	   else
		t=1+1*(O*res.SVs(i,:)'+O_0)
	   endif
	endfor
endfor
