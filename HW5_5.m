clear;

a=0.1;
a2=0.9;
b=0.1;
c=0.1;

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

for j=3:1000
    n(j-2,1) = e(j);
    n(j-2,2) = z(j-1);
    n(j-2,3) = z(j-2); 
    q(j-2,1) = z(j);
    
    n2(j-2,1) = e(j);
    n2(j-2,2) = y(j-1);
    n2(j-2,3) = y(j-2); 
    q2(j-2,1) = y(j);    
end

r = n\q
r2 = n2\q2

fprintf('Least Squares Estimate of a=%.1f and b=%.1f (a=0.1)\n',r(2),r(3))
fprintf('Least Squares Estimate of a=%.1f and b=%.1f (a=0.9)\n',r2(2),r2(3))


