clear;
for j=1:100
    for i=1:500
        x=randn(10,1);
        sb(i)=std(x,1);
        su(i)=std(x,0);
    end
msb(j)=mean(sb);
msu(j)=mean(su);
end

vb = var(msb,1);
vu = var(msu,0);

z = (mean(msb)-mean(msu))/sqrt((vb/length(msb))+(vu/length(msu)));
df = (((vb/length(sb))+(vu/length(su)))^2)/((((vb/length(sb))^2)/(length(sb)-1))+(((vu/length(su))^2)/(length(su)-1)));
z_c = -1.645;

fprintf('Z calculated: %.3f\n', z)
fprintf('Z critical %.3f at 0.05 significance level\n', z_c)
fprintf('%.3f < %.3f is true so standard deviations are significantly different \n',z,z_c)

figure(1)
hold on
hist(msb),
title('Baised vs Unbaised Standard Deviations')
xlabel('Standard Deviation')
ylabel('Number of Occurances');
hist(msu);
h = findobj(gca,'Type','patch');
set(h(1),'FaceColor','r','EdgeColor','w')
set(h(2),'FaceColor','b','EdgeColor','w')
legend('Baised','Unbaised')

