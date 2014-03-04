clear;

a=0.1;
a2=0.9;
b=0.1;
c=0.1;
s=zeros(100,1);
t=zeros(100,1);
u=zeros(100,1);
ss=zeros(100,1);
tt=zeros(100,1);
uu=zeros(100,1);
for k=1:100
e = randn(1000,1);
z=zeros(1000,1);
y=zeros(1000,1);
z(1) = 1.0;
z(2) = 2.0;
y(1) = 1.0;
y(2) = 2.0;


for i=3:1000
    z(i) = e(i) + a*z(i-1) + b*z(i-2);
    y(i) = e(i) + a2*y(i-1) + b*y(i-2);
end

n = zeros(997,3);
q = zeros(997,1);
n2 = zeros(997,3);
q2 = zeros(997,1);

for j=4:1000
    %n(j-3,1) = e(j);
    n(j-3,1) = z(j-1);
    n(j-3,2) = z(j-2); 
    n(j-3,3) = z(j-3);
    q(j-3,1) = z(j);
    
    %n2(j-2,1) = e(j);
    n2(j-3,1) = y(j-1);
    n2(j-3,2) = y(j-2);
    n2(j-3,3) = y(j-3);
    q2(j-3,1) = y(j);    
end

r = n\q;
r2 = n2\q2;

s(k,1) = r(1);
t(k,1) = r(2);
u(k,1) = r(3);
ss(k,1) = r2(1);
tt(k,1) = r2(2);
uu(k,1) = r2(3);
end

figure(1)
subplot(6,1,1); hist(s,10), title('a=0.1')
subplot(6,1,2); hist(t,10), title('b=0.1')
subplot(6,1,3); hist(u,10), title('c=0')
subplot(6,1,4); hist(ss,10), title('a=0.9'),ylabel('Number in bin')
subplot(6,1,5); hist(tt,10), title('b=0.1')
subplot(6,1,6); hist(uu,10), title('c=0')
xlabel('Average of 100 Random Samples')

fprintf('Least Squares Estimate of a=%.3f, b=%.3f, and c=%.3f (a=0.1)\n',mean(s),mean(t),mean(u))
fprintf('Least Squares Estimate of a=%.3f, b=%.3f, and c=%.3f (a=0.9)\n',mean(ss),mean(tt),mean(uu))


