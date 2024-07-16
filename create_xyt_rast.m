load("20240530\fluo_ruster_04_SPC_raw.mat");  %carica misure
n = 32; % dimensione immagini
N = 10; % canali per finestra
k = floor((3200-700)/N);
xyt = ones(n,n,k);
time = ones(k,1);
for i = 0:(k-1)
    C = squeeze(sum(spc(700+(1+i*N):700+((i+1)*N),:),1));     %somma sul tempo
    immagine = reshape(C, [n,n]); %ricompongo l'immagine
    xyt(:,:,i+1) = immagine;
    time(i+1)=i*(N/(4096/25))+(N/(4096/25))/2 ;
end
clear i k C N spc immagine n;