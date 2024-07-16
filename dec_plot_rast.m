flag = 0; % mettere la flag a 0 per vedere il quadrato, a 1 per il cerchio
          % e a 2 per l'ondina
%square = squeeze(sum(sum(xyt(7:12,7:11,:),1),2));
%circle = squeeze(sum(sum(xyt(9:12,20:24,:),1),2));
%wave = squeeze(sum(sum(xyt(23:25,7:11,:),1),2));

square = squeeze(sum(sum(xyt(7:11,7:12,:),1),2));
circle = squeeze(sum(sum(xyt(20:24,9:12,:),1),2));
wave = squeeze(sum(sum(xyt(7:11,23:25,:),1),2));


square = square/max(square);
circle = circle/max(circle);
wave = wave/max(wave);

if flag == 0
    plot(square);
elseif flag == 1
    plot(circle);
elseif flag == 2 
    plot(wave);
end

clear flag;