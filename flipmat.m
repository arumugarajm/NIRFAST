%% this program conatain the flipping operation
clc;
clear all;
myFolder = '/media/fistlab/DATA/Finaldataset/Flip/F2';
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
% filePattern = fullfile(myFolder, '**\*.JPG');
filePattern = fullfile(myFolder, '*.mat');
theFiles = dir(filePattern);
for k = 1:length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
%     fprintf(1, 'Now reading %s\n', fullFileName);
   a =  load(fullFileName);
% a = load('/media/fistlab/raj/combined dataset/X2_1.mat');
% b = a.Xi;
b = a.Xi;
c = a.Xim;
d = a.sdn;
e = a.sdn2;
% figure;imshow(Xi,[]);
% figure;imshow(Xim,[]);
Xi = flip(b);
Xim = flip(c);
sdn = flip(d);
sdn2 = flip(e);
save(['/media/fistlab/DATA/Finaldataset/Flip/F3/F3_' num2str(k) '.mat'],'Xim','Xi','sdn','sdn2');
end

%% convert 3D data into 2D slices
% L = load('/home/fistlab/Desktop/3D/X1.mat');
% % L = load('D:\3D\rat data\X.mat');
% O = L.Xi;
% O1 = L.Xgt;
% O2 = L.Xf;
% O3 = L.sdn;
% 
% for i=1:44
%     Xi = O(:,:,i);
%     Xgt = O1(:,:,i);
%     Xf = O2(:,:,i);
%     sdn = O3;
%     
%     save(['/home/fistlab/Desktop/3D/a/X_' num2str(i) '.mat'],'Xgt','Xi','Xf', 'sdn');
% end

