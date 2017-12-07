datosApr = load('./spam/tr.dat','-ascii');
etiquetas = load('./spam/trlabels.dat','-ascii');

%normalizar datos
data=zscore(datosApr);
etiq=etiquetas+1;

[numVec dim]=size(data);
numClas=max(etiq);

