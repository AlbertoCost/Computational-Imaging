load("20240523\fluo_03_SPC_raw.mat");  %carica misure
N = 32; % dimensione immagine
C = squeeze(sum(spc,1));     %somma sul tempo
H = hadamard(N^2);   %crea hadamard
Cpos = C([1:2:2*N^2]);
Cneg = C([2:2:2*N^2]);
C = (Cpos - Cneg)'; %ottengo il vettore finale dei coefficienti
immagine = H\C;
immagine = reshape(immagine, [N,N]); %ricompongo l'immagine
figure
imagesc(immagine)   %vedo l'immagine
axis image


% mostra l'immagine ottenuta proiettando le hadamard normali