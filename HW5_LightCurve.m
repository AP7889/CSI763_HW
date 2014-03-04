clear;
clf;
load 'HD189733b.txt';
t = HD189733b(:,1);
f = HD189733b(:,2);

figure(1)
plot(t,f,'*');
title('Transit of HD189733b')
xtitle('Julian Date')
ytitle('Relative Flux')

