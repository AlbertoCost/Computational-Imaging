y = sum(spc,2);
y = y/max(y);
y = y(656:3277,:);
t = TimeVectorTCSPC(4096);
t = t(656:3277)-t(656);
F = fit(t',y,'exp2');