#!/usr/bin/octave -qf

##########EJERCICO 3.1################3

load data/mini/trSep.dat
load data/mini/trSeplabels.dat
resSep=svmtrain(trlabels, tr, '-t 0 -c 1000');

##########EJERCICO 3.2################
#Calculo de los indices vectores soporte
resSep.sv_indices;
#Vectores soporte
resSep.SVs;
#Caluclo multiplicadores de lagrange
resSep.sv_coef;
#Vector de pesos
O=resSep.sv_coef' * resSep.SVs ;
#Umbral
O_0=-resSep.rho;

##########EJERCICO 3.3################

x=[1:1:7];
#Calculo de la recta
y=(-O(1)/O(2))*x - O_0/O(2);


#calculo de los margenes de la frontera
y_1=(-O(1)/O(2))*x - (O_0-1)/O(2);
y_2=(-O(1)/O(2))*x - (O_0+1)/O(2);

##########EJERCICO 3.4################
#Representacion gráfica
plot(tr(trlabels==1,1),tr(trlabels==1,2),"o"
,tr(trlabels==2,1),tr(trlabels==2,2),"s",
x,y,x,y_1,x,y_2,res.SVs(:,1),res.SVs(:,2),"+k");


