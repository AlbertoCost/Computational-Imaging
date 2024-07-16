% sistemo l'immagine, ridimensiono, la porto in scala di grigi
% e la casto a matrice di double
N = 128;
immagine = imresize(immagine,[N N]);
immagine = rgb2gray(immagine);
immagine = im2double(immagine);

% srotolo l'immagine in un vettorone
X = reshape(immagine,[N^2,1]);

% creo la matrice della base di Hadamard e la separo in 
% Hpos e Hneg

H = hadamard(N^2);
Hpos = H;
Hneg = H;

for r = 1:N^2
    for c = 1:N^2
        if Hpos(r,c) == -1
            Hpos(r,c) = 0;
        end
    end
end

for r = 1:N^2
    for c = 1:N^2
        if Hneg(r,c) == 1
            Hneg(r,c) = 0;
        else
            Hneg(r,c) = 1;

        end
    end
end

% creo la matrice Hposneg a partire da Hpos e Hneg

Hposneg = ones(2*(N^2),N^2);
contapos = 1;
contaneg = 1;
for r = 1:2*(N^2)
    for c = 1:N^2
        if mod(r,2) == 1
            Hposneg(r,c) = Hpos(contapos,c);
            if c == N^2
                contapos = contapos + 1;
            end
        else
            Hposneg(r,c) = Hneg(contaneg,c);
            if c == N^2
                contaneg = contaneg + 1;
            end
        end
    end
end


contapos = 0;
contaneg = 0;

% calcolo il vettore Cposneg che contine i coeff seprati della misura
% positiva e di quella negativa, aggiungo poi il rumore gaussiano 
% di ampiezza 10percento
Cposneg = Hposneg * X;
Cposneg = awgn(Cposneg,10);

% separiamo i coeff Cpos dai Cneg
Cpos = ones(N^2,1);
Cneg = ones(N^2,1);

for i = 1:2*(N^2)
    if mod(i,2) == 1
        contapos = contapos +1;
        Cpos(contapos) = Cposneg(i);
    else
        contaneg = contaneg + 1;
        Cneg(contaneg) = Cposneg(i);
    end
end

clear i;
clear c;
clear r;
clear contaneg;
clear contapos;

% Troviamo il vettore dei coefficienti reali e computiamo l'immagine
% attraverso la matrice delle basi di hadamard
coef = Cpos - Cneg;
IM = H\coef;
IM = reshape(IM,[N,N]);
