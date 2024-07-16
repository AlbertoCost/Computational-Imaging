load("Pinguino_04_SPC_raw.mat");      % per ogni misurazione salvo il valore 
A = sum(sum(spc));                    % dell'intensità totale misurata
load("Pinguino_01_SPC_raw.mat");
B = sum(sum(spc));
load("Pinguino_02_SPC_raw.mat");
C = sum(sum(spc));
load("Pinguino_00_SPC_raw.mat");
D = sum(sum(spc));
load("Pinguino_03_SPC_raw.mat");
E = sum(sum(spc));
Y = [A,B,C,D,E];                       % plotto i valori di intensità misurata 
X = [1,10,50,100,500];                 % rispetto ai tempi di esposizione per 
figure;
plot(X,Y,"Marker","o");                             % verificare la linearità
xlabel("Tempo di Esposizione (ms)");
ylabel("Intensità totale misurata");
