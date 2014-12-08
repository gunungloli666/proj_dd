clc; 
clear all;
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s' ,'Delimiter','\n');
fclose(fid);
[a,] = size(C{1});
D = cell(a,1); 
 for j=1:a
     m = textscan(C{1}{j}, '%s', 'Delimiter', '|' ); 
     [a,] = size(m);
%      a = a(1); 
     for jj=1:a
         m{jj}
     end
 end
% for i=1:numel(C) 
%     for j=1:numel(C{1})
%         C{i}{j}
%     end
%     disp('ok');
% end 
% C
% C{2}
% C{3}
%%
fid = fopen('./database/1.txt','a'); 
m =  [num2str(2), 'mop','234']; 
fprintf(fid, '%s\n', C); 
fclose(fid); 

%%
A = {'main', 'data'};
B = {{4,3},3}; 
M = containers.Map(A,B); 
M('main')
