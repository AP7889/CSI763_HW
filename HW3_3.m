clear;

y1=randn(100,1);
y2=randn(100,1);

m1=mean(y1);
m2=mean(y2);

fprintf('Sample means of y1=%.3f and y2=%.3f\n',m1,m2)

s1=sqrt((1/100)*sum((y1-mean(y1)).^2));
s2=sqrt((1/100)*sum((y2-mean(y2)).^2));

fprintf('Unbiased standard deviation of s1=%.3f and s2=%.3f\n',s1,s2)

D=y2-y1;
Dm = m2-m1;

fprintf('Statistic D=%.3f\n',Dm)

N1=length(y1);
N2=length(y2);
sd2 = (1/(N1+N2-2))*((N2*s2^2)+(N1*s1^2));

fprintf('Variance of unbiased D=%.3f\n',sd2)

Dx=zeros(1000,100);
Cx=zeros(100,1);
z=zeros(100,1);
for i=1:1000
    x1=randn(100,1);
    x2=randn(100,1);
    sx1(i)=sqrt((1/100)*sum((x1-mean(x1)).^2));
    sx2(i)=sqrt((1/100)*sum((x2-mean(x2)).^2));
    Dx(i,1:100)=mean(x1)-mean(x2);
    Cx(i)=sum(Dx(i,1:100)>2);
    z(i) = (2)/sqrt(((sx1(i)^2)/length(x1))+((sx2(i)^2)/length(x2)));
end

fprintf('D was > 2 on average %.3f times out of 100 \n',mean(Cx))
fprintf('Z-score for D > 2 = 14.2235 which gives a p-value of 3.275e-46 \n')

figure(1)
hist(z)
title('Distrubtion of Z Scores when D > 2')
xlabel('Z-Scores')
ylabel('Number of Occurances')
