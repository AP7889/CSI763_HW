clear;

x=[26.1 24.8 26.4 26.6 26.8];
y=[24.5 24.5 24.1 24.3 24.9 23.7 23.5 24.0 24.1 23.7 24.3 24.6 24.8 24.4 25.2];

nx=length(x);
ny=length(y);

mx=mean(x);
my=mean(y);

varx=var(x);
vary=var(y);

t= (mx-my)/(sqrt((varx/nx)+(vary/ny)));
df = (((varx/nx)+(vary/ny))^2)/((((varx/nx)^2)/(nx-1))+(((vary/ny)^2)/(ny-1)));

t_c = 2.776;
sigma = t_c*sqrt((varx/nx)+(vary/ny));

int1=(mx-my)-sigma;
int2=(mx-my)+sigma;

fprintf('Degrees of freedom: %.f\n', floor(df))
fprintf('t calculated %.3f\n', t)
fprintf('t critical %.3f\n', t_c)
fprintf('%.3f > %.3f, temperatures are significantly different, reject null hypothesis\n',t,t_c)
fprintf('95%% Confidence Interval is [%.3f,%.3f]\n', int1,int2)