%Ejemplo mixtura gaussiana

datosApr = load('./gaus2D/gauss2Dtr.data','-ascii');
etiquetas = load('./gaus2D/gauss2Dtr.labels','-ascii');

grafo=[ 0 1 ; 0 0];
nodosDiscretos=[1];
tallaNodos=[2 2];
redB=mk_bnet(grafo, tallaNodos, 'discrete', nodosDiscretos);
redB.CPD{1}=tabular_CPD(redB, 1);
redB.CPD{2}=gaussian_CPD(redB,2);

training= cell(2, length(datosApr));
training(2,:)= num2cell(datosApr', 1);
motor= jtree_inf_engine(redB);
maxIter= 15;
epsilon= 1e-100;
[redB2, logVer, motor2] = learn_params_em(motor, training, maxIter, epsilon);

k1=cell(3,1);
k2=k1;
k{1}=1;
k{2}=1;
NM=75;
for i=1:NM
    muestra1=sample_bnet(redB2,'evidence',k1);
    muestra2=sample_bnet(redB2,'evidence',k2);
    muestras(i,:)=muestra1{2};
    muestras(i+NM,:)=muestra2{2};
end

figure
subplot(2,1,1);
plot(datosApr(etiquetas==1,1), datosApr(etiquetas==1,2),'x',datosApr(etiquetas==2,1), datosApr(etiquetas==2,2),'o');
axis([-4 5 -4 4])

