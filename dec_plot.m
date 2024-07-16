flag = 5; % mettere la flag a 0 per vedere il quadrato, a 1 per il cerchio
          % e a 2 per l'ondina
%square = squeeze(sum(sum(xyt(7:11,7:11,:),1),2));
%circle = squeeze(sum(sum(xyt(8:11,21:25,:),1),2));
%wave = squeeze(sum(sum(xyt(22:24,5:15,:),1),2));

square = squeeze(sum(sum(xyt(7:11,7:11,:),1),2));
circle = squeeze(sum(sum(xyt(21:25,8:11,:),1),2));
wave = squeeze(sum(sum(xyt(5:15,22:24,:),1),2));


square = square/max(square);
circle = circle/max(circle);
wave = wave/max(wave);


if flag == 0
    figure
    plot(square);
elseif flag == 1
    figure
    plot(circle);
elseif flag == 2 
    figure
    plot(wave);
end

clear flag;