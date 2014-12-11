% untuk load data dari database
% sekalian map property-propertinya.... 
% jadi pada cell D ke-i terdapat sebuah cell...  ini dilakukan karena agar
% memudahkan dalam  menggunakan containers.Map...  jadi kita tidak langsung
% memasukkan elemen ke dalam table. 
function [D,F] = openData(varargin)
% disp('open data'); 
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s' ,'Delimiter','\n');
fclose(fid);
[a,] = size(C{1});
a = a(1); 
D = cell(a,1); 
nama = cell(a,1); 
 for j=1:a
     m = textscan(C{1}{j}, '%s', 'Delimiter', '|' ); 
     b = size(m{1});
     b = b(1);
     temp = cell(b,1); 
     temp{1} = m{1}{1}; 
     for jj=2:b
         temp{jj} = num2str(m{1}{jj});
     end
     D{j} = temp; 
     nama{j} = temp{1}; 
 end
[m,] = size(C{1});
if m(1)==0
    F = containers.Map({'empty'} , {'empty'});
    return; 
end
        
F = containers.Map(nama, D);

