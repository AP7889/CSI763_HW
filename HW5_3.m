clear;

for i=1:100
x = chi2rnd(10,[1 10]);
y = 3*chi2rnd(10,[1 10]);
[h(i),p(i),ks2stat(i)] = kstest2(x,y);
end

figure(1)
ecdf(x)
hold on
ecdf(y)
title('Empirical Cumulative Distribution Function')
hold off

figure(2)
subplot(3,1,1); hist(h), title('h')
subplot(3,1,2); hist(p), title('p')
subplot(3,1,3); hist(ks2stat), title('ks2stat')

fprintf('mean k-s statistic %.3f \n',mean(ks2stat))
fprintf('Number of tries before you cannot reject null hypothesis: %.f \n',1/mean(p))


kstat = .368;