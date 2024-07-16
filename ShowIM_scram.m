load('20240530\fluo_scrambled_02_SPC_raw.mat');  %carica misure
N = 32; % dimensione immagine
npatt = 256+512;
C = squeeze(sum(spc,1));     %somma sul tempo
load('20240528\scrambledh_32_Mmatrix.mat');  %crea hadamard
Mpos = M(1:2:2*N^2,:);
Mneg = M(2:2:2*N^2,:);
M = (Mpos - Mneg);
Cpos = C(1:2:2*N^2);
Cneg = C(2:2:2*N^2);
C = (Cpos - Cneg)'; %ottengo il vettore finale dei coefficienti
immagine = lsqr(M(100:npatt+100,:),C(100:npatt+100,:));
immagine = reshape(immagine, [N,N]); %ricompongo l'immagine
figure
imagesc(immagine)   %vedo l'immagine
axis image

% mostra l'immagine ottenuta proiettando le hadamard scrambled 