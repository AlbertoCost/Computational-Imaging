load("20240523\fluo_03_SPC_raw.mat");  %carica misure
n = 32; % dimensione immagini
N = 10; % canali per finestra

k = floor((3200-700)/N);
xyt = ones(n,n,k);
time = ones(k,1);
for i = 0:(k-1)
    C = squeeze(sum(spc(700+(1+i*N):700+((i+1)*N),:),1));     %somma sul tempo
    H = hadamard(n^2);   %crea hadamard
    Cpos = C([1:2:2*n^2]);
    Cneg = C([2:2:2*n^2]);
    C = (Cpos - Cneg)'; %ottengo il vettore finale dei coefficienti
    immagine = H\C;
    immagine = reshape(immagine, [n,n]); %ricompongo l'immagine
    xyt(:,:,i+1) = immagine;
    time(i+1)=i*(N/(4096/25))+(N/(4096/25))/2 ;
end
clear i k C N Cpos Cneg H spc immagine n;

% crea matrice 3D con una immagine per ogni finestra temporale
% crea anche il vettore coi tempi