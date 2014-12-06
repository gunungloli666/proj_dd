clc; 
clear all;
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s %s %s',  'Delimiter','|');
fclose(fid);
for i=1:numel(C{1}) 
    C{1}(i) 
end 
% C{2}
% C{3}
%%
CC = {1,2,3,4};
fid = fopen('./database/1.txt','a'); 
m =  [num2str(2), 'mop','234']; 
fprintf(fid, '%s\n', C); 
fclose(fid); 
