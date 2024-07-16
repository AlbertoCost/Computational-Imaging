load('20240530\fluo_scrambled_02_SPC_raw.mat');  %carica misure
load('20240528\scrambledh_32_Mmatrix.mat')  %crea hadamard
Mpos = M(1:2:2048,:);
Mneg = M(2:2:2048,:);
M = (Mpos - Mneg);
N = 100; % canali per finestra
k = floor((3200-700)/N);
xyt = ones(32,32,k);
time = ones(k,1);
for i = 0:(k-1)
    C = squeeze(sum(spc(700+(1+i*N):700+((i+1)*N),:),1));     %somma sul tempo
    Cpos = C([1:2:2048]);
    Cneg = C([2:2:2048]);
    C = (Cpos - Cneg)'; %ottengo il vettore finale dei coefficienti
    immagine = lsqr(M,C);
    immagine = reshape(immagine, [32,32]); %ricompongo l'immagine
    xyt(:,:,i+1) = immagine;
    time(i+1)=i*(N/(4096/25))+(N/(4096/25))/2 ;
end
clear i k C N Cpos Cneg M spc immagine Mpos Mneg seed;