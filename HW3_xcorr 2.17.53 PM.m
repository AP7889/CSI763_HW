clear;

load lew.m;
x=lew(:,1);
y=[3 5];

[r,lags] = xcorr(x,1,'coeff');
d = xcorr(x);