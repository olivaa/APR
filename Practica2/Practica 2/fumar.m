N = 5; 
P= 1;%Polucion
F=2;%Fumador
C = 3;%Cancer 
RX = 4;%Rayos X
D=5;%Disnea
grafo=zeros(N, N);
grafo(P,C)=1;
grafo(F,C)=1;
grafo(C,[RX D])=1;

nodosDiscretos = 1:N;
tallaNodos= 2*ones(1,N);
%rayos x tiene una talla de 3
tallaNodos(4)=3;

%Create bayesian net
redB = mk_bnet(grafo, tallaNodos,'discrete', nodosDiscretos);
redB.CPD{C} = tabular_CPD(redB, C, [0.08 0.05 0.03 0.001 0.92 0.95 0.97 0.999]);
redB.CPD{P} = tabular_CPD(redB, P, [0.1 0.9]);
redB.CPD{F} = tabular_CPD(redB, F, [0.3 0.7]);
redB.CPD{RX} = tabular_CPD(redB, RX, [0.7 0.1 0.2 0.1 0.1 0.8]);
redB.CPD{D} = tabular_CPD(redB, D, [0.65 0.3 0.35 0.7]);


%Ejercicio 1
motor = jtree_inf_engine(redB);
evidencia= cell(1, N);
%Evidencia datos conocidos
evidencia{F} = 2 ;%No fumador
evidencia{RX}= 3 ;%Rayos x negativos
evidencia{D}= 1;%Sufre disnea

[motor, logVerosim] = enter_evidence(motor, evidencia);
m = marginal_nodes(motor, C);
m.T

%Ejercicio2 ¿Cuál es la explicación más probable de que un paciente sufra cáncer de
%pulmón?
evidencia = cell(1,N);
[explMaxProb, logVerosim] = calc_mpe(motor, evidencia)


