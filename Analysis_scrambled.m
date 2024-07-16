addpath("TVAL\"); % TVAL folder
addpath("TVAL\Fast_Walsh_Hadamard_Transform\"); % TVAL folder
addpath("TVAL\Solver\"); % TVAL folder
addpath("TVAL\Utilities\"); % TVAL folder

opts.mu = 2^8; %default value, suggested by authors 2^8  -> 2^5
opts.beta = 2^5; %default value, suggested by authors 2^5 -> 2^0
opts.maxit = 3000;
opts.tol = 1E-8;
opts.isreal = true;
run('warm_up.m')
K = 32;

load('20240530\fluo_scrambled_02_SPC_raw.mat');
load('20240528\scrambledh_32_Mmatrix.mat');
H = M(1:2:end,:) - M(2:2:end,:);
c = sum(spc,1);
C = c(1:2:end) - c(2:2:end);

nPatt = floor(1024*(10/100));
res = TVAL3(H(1:nPatt,:),C(1:nPatt)',32,32,opts);
figure
imagesc(res)
   %vedo l'immagine
axis image