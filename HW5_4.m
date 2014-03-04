clear;

x=abs(randn(10,1));
y=abs(randn(10,1));

for i=1:10
b_t(i) = x(i)*y(i);
b_bx(i) = x(i)^2;
b_by(i) = y(i)^2;
end

bx = (sum(b_t)-length(x)*mean(x)*mean(y))/(sum(b_bx)-length(x)*mean(x)^2);
by = (sum(b_t)-length(x)*mean(x)*mean(y))/(sum(b_by)-length(x)*mean(y)^2);
ax = mean(y) - bx*mean(x);
ay = mean(y) - by*mean(x);

a = (ax+ay)/2;
b = (bx+by)/2;

g=[-50:50];
h = (bx*g)+ax;
k = (by*g)+ay;
m = (b*g)+a;

figure(1);
plot(g,h,'blue');
hold on
plot(g,k,'blue');
plot(g,m,'red');
title('OLS');
xlabel('X Values');
ylabel('Y Values');
legend('OLS(Y|X)','OLS(X|Y)','Bisector');
hold off

polyfit(x,y,1); %check

fprintf('a = %.3f and b = %.3f \n',a,b)