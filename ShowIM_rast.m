load("20240530\fluo_ruster_04_SPC_raw.mat");  %carica misure
N = 32; % dimensione immagine 
C = squeeze(sum(spc,1));     %somma sul tempo
immagine = reshape(C, [N,N]); %ricompongo l'immagine

figure
imagesc(immagine)   %vedo l'immagine
axis image