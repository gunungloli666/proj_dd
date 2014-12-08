% untuk load data dari database
% sekalian map property-propertinya.... 
% jadi pada cell D ke-i terdapat sebuah cell...  ini dilakukan karena agar
% memudahkan dalam  menggunakan containers.Map...  jadi kita tidak langsung
% memasukkan elemen ke dalam table. 
function [D,F ] = openData(varargin)
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s %s %s %s %s %s',  'Delimiter','|');% 
fclose(fid);
c = size(C);
col = c(2); 
b = numel(C{1});
D = cell(b,1); 
nama = cell(b,1); 
for i=1:b
    temp = cell(col,1); 
    temp{1}= C{1}{i}; % nama
    for j=2:col % variabel-variabel yang lain
        temp{j} =  str2double(C{j}{i}); 
    end
    D{i} = temp;
    nama{i}= C{1}{i}; 
end
[m,] = size(C{1})
if m(1)==0
    return; 
end
F = containers.Map(nama, D);

