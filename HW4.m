clear;
obs = [59 316 596 633 320 76];
exp = [62.5 312.5 625 625 312.5 62.5];
for i=1:length(obs);
    chi(i) = ((obs(i)-exp(i))^2)/exp(i);
end
sum(chi);
df = length(obs)-1;


fprintf('Degrees of Freedom: %.f \n', df)
fprintf('Chi-Square Value: %.3f \n', sum(chi))
fprintf('%.3f < 11.07 at a 0.05 significance level \n', sum(chi))
fprintf('Probability of getting the observed resut is greater than 30%% \n')
fprintf('We accept the null hypothesis that the data fits a 1:5:10:10:5:1 ratio \n')