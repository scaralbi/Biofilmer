

cd /Users/ASdC/Desktop/biofilm_mat

frame_rate = 20 %in minutes
A = readmatrix('WT1.csv') %data of radial profile intensities from Fiji
Rtot = size(A, 1), %tot number of radial points
R = A(:,1); %get the values of the radi 
Tmax = size(A,2) -1; %max time 

Z = A(:, 2:size(A,2));
Xmin = 4%min(Z,[],'all');
Xmax = max(Z,[],'all'); %max fluorescent value

%Normalization
for i = 1:size(Z,1)
  for j = 1:size(Z,2)
      Z(i,j) = (Z(i,j) - Xmin)/(Xmax-Xmin);
      if Z(i,j) < 0
          Z(i,j) = 0;
      end
  end
end
    
%Fourier Transform for every row (distance) 
X = 1:size(Z,2);
X = (X.*20)./60;
Y = R%./100;
FZ = zeros(size(Z,1), size(Z,2))
for i = 1:size(Z,1)
    FZ(i,:) = fft(Z(i,:));
end

%Frequency Peaks Plot
figure()
stem3(X,Y, FZ)
ax = gca;
ax.XLim = [0 1.8]
ax.YLim = [0 10]
ax.ZLim = [0 100]
xticks([0:0.3:1.8])
ax.FontSize = 20;
xlabel('frequency (cycles per hour)')
ylabel('Radius (mm)')
zlabel('I(f)')

%Surface Plot
figure()
surfc(X,Y,Z)
colormap(jet)
colorbar
ax = gca;
xlabel('time (hours)');
ylabel('Radius (mm)');
% view(2)
zlabel('Normalised Integrated Intensity (A.U.)');
ax.FontSize = 20;
% ax.ZLim = [0 1]

% xticklabels({'2.25','7.5','15','30'})
% yticklabels(1:4);
box off
% 
% title('Radial profile of Biofilm Growth - B. subtilis NCIB3610 - 36h')
