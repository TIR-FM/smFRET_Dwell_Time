% Locate vbFRET ANALYSIS SUMMARY FILE

clear all;

% Select and open summary file
disp ('Open vbFRET ANALYSIS SUMMARY FILE')
uiopen

frequen = NaN (size ((path),2) , size (path{1,1},1));

prompt = 'What threshold do you want to set for estimating FRET dwell times?'
threshold = input(prompt);

prompt = 'Enter frame time in seconds'
frametime = input(prompt);

for x = 1: length(path);  %for x = 1: length(path);

d = diff([0, path{1,x}'>0.2, 0]);
startidx = find(d==1);
lgt = find(d==-1)-startidx;

frequen(x, 1:length(lgt)) = lgt;

end

frequen = frequen(~isnan(frequen));

frequen = frequen * frametime;

writematrix(frequen, ['dT30.3prime.OH_FRET.VAL' num2str(threshold), '.dat'],'Delimiter','\t');

disp('end')



% thisdata = cell2mat (vbFRETsummary);
% 
% B = thisdata.mu;
% 
% A = cell2mat(path)';
% 
% for x = 1: length(B);
% 
% d = diff([0, A==B(x), 0]);
% startidx = find(d==1);
% lgt = find(d==-1)-startidx;
% 
% writematrix(lgt, ['F:\Rahul\03-17-2022 (RPA-Af-FAB-Cy5 _dTCy3_sm)\Analysis\Cy3-3-dT30-OH\OUTPUT\dT30.3prime.OH_FRET.VAL_' num2str(B(x)) '.dat'],'Delimiter','\t');
% 
% end


