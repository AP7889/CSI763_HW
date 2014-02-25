clear;

I = [19 25 22 -1 4 14 21 22 23 27 29 25 29 15 29 24 0 2 26 17 19 9 20 -6 -13 -13 -11 -4 -4 11 23];
C = [28 28 26 19 16 24 26 24 24 29 29 27 31 26 38 23 13 14 28 19 19 17 22 2 4 5 7 8 14 14 23];

mi = mean(I);
mc = mean(C);

ni = length(I);
nc = length(C);

vi = var(I);
vc = var(C);

z = (mi-mc)/sqrt((vi/ni)+(vc/nc));
df = (((vi/ni)+(vc/nc))^2)/((((vi/ni)^2)/(ni-1))+(((vc/nc)^2)/(nc-1)));
z_c1 = 1.960;
z_c2 = -1.645;

% fprintf('Degrees of Freedom = %.f \n', floor(df))
fprintf('Z-Score = %.3f \n', z)
fprintf('Probability of the Minimum Temperatures being equal by chance: .0131 \n')
fprintf('%.3f > %.3f so we must reject our null hypothesis (two-tailed) \n', abs(z),z_c1)
fprintf('Probability of Canandaigua being warmer by chance: .993 \n')
fprintf('%.3f < %.3f so we must reject our null hypothesis (left tailed) \n', z,z_c2)
