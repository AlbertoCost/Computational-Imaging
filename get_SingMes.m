fondo = double(f_read_sdt_01('C:\Users\alby1\OneDrive\Documenti\MATLAB\20240528\fluo_fondo.sdt'));
cerchio = double(f_read_sdt_01('C:\Users\alby1\OneDrive\Documenti\MATLAB\20240528\fluo_cerchio.sdt'));
onda = double(f_read_sdt_01('C:\Users\alby1\OneDrive\Documenti\MATLAB\20240528\fluo_onda.sdt'));
quadrato = double(f_read_sdt_01('C:\Users\alby1\OneDrive\Documenti\MATLAB\20240528\fluo_quadrato.sdt'));

onda = onda - fondo;
cerchio = cerchio - fondo;
quadrato = quadrato - fondo;

onda = onda/max(onda);
cerchio = cerchio/max(cerchio);
quadrato = quadrato/max(quadrato);

onda = onda(656:3277,:);
cerchio = cerchio(656:3277,:);
quadrato = quadrato(656:3277,:);

t = TimeVectorTCSPC(4096);
t = t(656:3277)-t(656); 

clear fondo;