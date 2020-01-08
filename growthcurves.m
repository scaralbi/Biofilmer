Data = readmatrix('curves.xlsx')

errLB =std(Data(3:4,:));
errMS =std(Data(1:2,:));
meanLB =mean(Data(3:4,:));
meanMS =mean(Data(1:2,:));
time =Data(5,:);

figure()
errorbar(time, meanLB, errLB, 'LineWidth', 2); hold on
errorbar(time, meanMS, errMS, 'LineWidth', 2)
ax = gca
ax.YLim = [0 1];
ax.XLim = [0 24];
legend('LB', 'MSgg')
ax.FontSize = 16
xlabel('Time (hours)')
ylabel('Cell Density (OD600)')
grid on
