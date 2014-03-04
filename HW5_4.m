clear;

%x=abs(randn(10,1));
%y=abs(randn(10,1));
x=[1 2 3 4 5 6 7 8 9 10];
y=[8 1 6 10 3 4 7 3 5 9];

for i=1:10
b_t(i) = x(i)*y(i);
b_bx(i) = x(i)^2;
b_by(i) = y(i)^2;
end

bx = (sum(b_t)-length(x)*mean(x)*mean(y))/(sum(b_bx)-length(x)*mean(x)^2);
by = (sum(b_by)-length(x)*mean(y)^2)/(sum(b_t)-length(x)*mean(x)*mean(y));
ax = mean(y) - bx*mean(x);
ay = mean(y) - by*mean(x);

a = (ax+ay)/2;
b = (bx+by)/2;

b_bi = (1/(bx+by))*(bx*by-1+sqrt((1+bx^2)*(1+by^2)));
a_bi = mean(y) - b_bi*mean(x);

g=[0:50];
h = (bx*g)+ax;
k = (by*g)+ay;
m = (b*g)+a;
v = (b_bi*g)+a_bi;

clf;
figure(1);
plot(g,h,'blue');
hold on
plot(g,k,'green');
plot(g,m,'red');
plot(x,y,'black*')
plot(g,v,'magenta')
title('OLS');
xlabel('X Values');
ylabel('Y Values');
axis([0,14,0,14])
legend('OLS(Y|X)','OLS(X|Y)','Bisector(mean)','Data Points','Bisector (Equation)');
hold off

polyfit(x,y,1); %check

fprintf('a = %.3f and b = %.3f (Y|X)\n',ax,bx)
fprintf('a = %.3f and b = %.3f (X|Y)\n',ay,by)