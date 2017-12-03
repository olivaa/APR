#!/usr/bin/octave -qf

load data/usps/tr.dat ; 
load data/usps/trlabels.dat;

load data/usps/ts.dat ; 
load data/usps/tslabels.dat;

#datos test
tslabBin=find(tslabels<4);
tsBin=ts(tslabBin);

vot_i=[0 0];
vot_j=[0 0];
vect=[0 1 2 3]
[r,col]=size(vect)

while(col>1)
        #obtenemos el par de clases
        trlBin=union(find(trlabels==0),find(trlabels==col));
		trB=tr(trlBin);
		vot_i=[vect(1,[1]) 0]
		vot_j=[vect(1,[col]) 0]
		%entrenamos el clasificador de la clases i j
		res=svmtrain(trlabels(trlBin),trB,'-t 0 -c 1000');
		[predict_label,accuracy,prob]=svmpredict(tslabels(tslabBin),tsBin, res,' ');
		for x=[1:size(predict_label)]
			if(predict_label(x)==vect(1,[1]))
			   vot_i(1,[2])= vot_i(1,[2])+1;
			else
			   vot_j(1,[2])=vot_j(1,[2])+1;
			endif
		endfor
	
		ganador=max(vot_i(1,[2]),vot_j(1,[2]));

		if(ganador==vot_i(1,[2]))
			printf("Clase %i vs %i, gana-> %i ",vot_i(1,[1]),vot_j(1,[1]),vot_i(1,[1]));
			vect=vect(1:col-1)
		else
			printf("Clase %i vs %i, gana-> %i ",vot_i(1,[1]),vot_j(1,[1]),vot_j(1,[1]));
			vect=vect(2:col)
		endif
	col=col-1;			
endwhile


