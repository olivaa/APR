#!/usr/bin/octave -qf

load data/usps/tr.dat ; 
load data/usps/trlabels.dat;

load data/usps/ts.dat ; 
load data/usps/tslabels.dat;

#datos test
tslabBin=find(tslabels<4);
tsBin=ts(tslabBin);
#votos=zeros(size(tslabels),4);
vot_i=[0 0];
vot_j=[0 0];
vot_total=[0 0 0 0]


for i=[0:3]
    for j=[i+1:3]
        #obtenemos el par de clases
        trlBin=union(find(trlabels==i),find(trlabels==j));
	    trB=tr(trlBin);
        vot_i=[i 0];
        vot_j=[j 0];

		%entrenamos el clasificador de la clases i j
	    res=svmtrain(trlabels(trlBin),trB,'-t 0 -c 1000');
		[predict_label,accuracy,prob]=svmpredict(tslabels(tslabBin),tsBin, res,' ');
			
		 for x=[1:size(predict_label)]
			if(predict_label(x)==i)
				vot_i(1,[2])= vot_i(1,[2])+1;
			else
				vot_j(1,[2])=vot_j(1,[2])+1;
			endif
		endfor
		
		ganador=max(vot_i(1,[2]),vot_j(1,[2]));
		if(ganador==vot_i(1,[2]))
			printf("Clase %i vs %i, gana-> %i",i,j,i);
			vot_total(1,[i+1])=vot_total(1,[i+1])+1
		else
			printf("Clase %i vs %i, gana-> %i",i,j,j);
			vot_total(1,[j+1])=vot_total(1,[j+1])+1
		endif			
    endfor
endfor

printf("Votos totales por clase");
vot_total

