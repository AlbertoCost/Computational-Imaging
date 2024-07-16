load("20240523\Pinguino_05_SPC_raw.mat");  %carica misure
N = 64;
C = squeeze(sum(spc,1));    %somma sul tempo
H = hadamard(N^2);   %crea hadamard
H(H(1:end,1:end) < 0 ) = 0;
%immagine = H\C';
immagine = lsqr(H,C');
immagine = reshape(immagine, [N,N]); %ricompongo l'immagine
immagine(1,1) = immagine(1,1)/4096;
immagine(immagine(1:end,1:end) < 0 ) = 0;


figure
imagesc(immagine)   %vedo l'immagine
axis image