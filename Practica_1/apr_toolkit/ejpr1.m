#!/usr/bin/octave -qf

##########EJERCICO 3.1################3

load data/mini/tr.dat ; 
load data/mini/trlabels.dat;
res = svmtrain(trlabels, tr, '-t 0 -c 1000');

load data/mini/trSep.dat
load data/mini/trSeplabels.dat
resSep=svmtrain(trlabels, tr, '-t 0 -c 1000');

resSep.sv_indices;
resSep.sv_coef;
O=resSep.sv_coef' * resSep.SVs ;
O_0=-resSep.rho;

##########EJERCICO 3.2################
x=[1:1:];
y=(-O(1)/O(2))*x-O_0/O(2);
y_1=(-O(1)/O(2))*x-(O_0-1)/-O(2);
y_2=(-O(1)/O(2))*x-(O_0+1)/-O(2);

plot(tr(trlabels==1,1),tr(trlabels==1,2),"x",tr(trlabels==2,1),
tr(trlabels==2,2),"s",x,y,x,y_1,x,y_2);
