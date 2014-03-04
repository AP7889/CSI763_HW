clear;


for j=1:100
x = randn(1000,1);
y = 3*randn(1000,1);

[Nx,xb] = hist(x,[-4:.65:4]);
[Ny,yb] = hist(y,[-12:1.85:12]);

for i=1:length(Nx);
    if Nx(i)>0
        chi(i) = ((Nx(i)-Ny(i))^2)/(Nx(i)+Ny(i));
      else
        chi(i)=0;
    end
end

chi_test(j) = sum(chi);
df(j) = sum(Nx>0)-1;
end

chi_stat = mean(chi_test(df==10))
fprintf('With a chi-square value of %.3f, p = 0.0001 \n',chi_stat)

[h,p,ks2stat] = kstest2(x,y);