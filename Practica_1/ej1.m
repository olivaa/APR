#!/usr/bin/octave -qf

load data/mini/trSep.dat
load data/mini/trSeplabels.dat
resSep=svmtrain(trlabels, tr, '-t 0 -c 1000');

resSep.sv_indices
resSep.SVs
resSep.sv_coef
O=resSep.sv_coef' * resSep.SVs 
O_0=-resSep.rho

x=[1:1:7];
#Calculo de la recta
y=(-O(1)/O(2))*x - O_0/O(2);
#calculo de los margenes de la frontera
y_1=(-O(1)/O(2))*x - (O_0-1)/O(2);
y_2=(-O(1)/O(2))*x - (O_0+1)/O(2);


#Representacion gráfica
plot(tr(trlabels==1,1),tr(trlabels==1,2),"o"
,tr(trlabels==2,1),tr(trlabels==2,2),"s",
x,y,x,y_1,x,y_2,resSep.SVs(:,1),resSep.SVs(:,2),"+k");


