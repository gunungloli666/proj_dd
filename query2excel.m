function query2excel(varargin)
% dibuat oleh Mohammad Fajar (20211019)
% tuorial ini buat yang pertama kali menggunakan MATLAB... 
% mungkin masih banyak kekurangannya, tapi g apa-apalah.... 
% just for newbie.... 

clc ;
global f;
global data; 
global  count; 
count = 0; 
global dialog ;
dialog = 0;
global table; 

f  = figure( ... 
            'name' , 'Sumbangan Mesjid', ...
            'numbertitle', 'off' ,... 
            'menubar' , 'none' , ...
            'position', [100,100,500,500]...
            );

data = get_default_data();
table = uitable('data', data, ....
            'ColumnName' , {'No.', 'Nama Penumbang', 'Jumlah(Rp)', 'Tunai/g tunai'}, ...
            'ColumnWidth', {40,200 , 90,80}, ...
            'RowName', [] , ...
            'fontsize', 10, ...
            'position', [10,200, 450,300], ...
            'CellSelectionCallback',@(src,event)set(src,'UserData',event.Indices));
            
 uicontrol ... 
            ('string', 'INSERT', 'position', [10, 160, 100, 30], ...
            'fontsize', 12, 'style', 'pushbutton',...
            'callback', @insert_data);
                    
 uicontrol('string', 'DELETE', 'position', [10, 125, 100, 30], ...
                        'fontsize', 12, 'style', 'pushbutton', 'callback',@delete_data );
end

function [] = insert_data(varargin)
global dialog; 
global name_field ; 
global uang_field; 
global state_popup ;
global count ;
global fig; 
if (dialog ~= 1), 
fig =         figure ('position', [250,300, 300,300], 'menubar', 'none', 'name', 'MASUKKAN' );
        panel = uipanel('position', [0, 0, 300, 300], 'backgroundColor', 'white');

        uicontrol('position', [10, 270, 90, 20], 'style', 'text',...
                    'parent', panel , ...
                    'backgroundColor', 'white', ...
                    'HorizontalAlignment', 'left',...
                    'string', 'Nama');

name_field =     uicontrol('position', [110, 270, 150, 20], 'style','edit', ...
                     'parent', panel,    'HorizontalAlignment', 'left',  'tag', 'nama' ... 
            );

        uicontrol('position', [10, 240, 90, 20], 'style', 'text' , 'parent', panel, ...
                       'backgroundColor', 'white', 'HorizontalAlignment', 'left', 'string' , 'jumlah (Rp)'...
                      );

uang_field =       uicontrol('position', [110, 240, 150, 20], 'style','edit', ...
                       'parent', panel ,  'HorizontalAlignment', 'left',  'tag', 'uang' ...
       );

        uicontrol('position', [10, 210, 90, 20], 'style','text', 'string', 'lunas/g lunas', 'parent', panel, ....
                    'horizontalAlignment', 'left', 'backgroundColor', 'white');

state_popup  =       uicontrol('style', 'popupmenu', 'position', [110, 210, 90, 20], 'string', 'lunas|g lunas','parent', panel);

        uicontrol('position', [50, 50, 150, 40], 'style' , 'pushbutton', 'parent' , panel, 'string' , 'UPDATE', ...
            'callback', @update );
        
%         status = uicontrol('position', [50, 100, 200, 100], 'backgroundColor', 'white', ...
%                             'HorizontalAlignment', 'left', 'style', 'text',...
%                             'parent', panel, 'callback', @update_data);
end

dialog = 1 ;
end

% sebenarnya fungsi ini sama sekali g berguna... 
% tapi pahami ajalah... saya  malas menjelaskan.... 
function [] = update_data(hObj)
global count ; 
% count = count + 1; 
global data; 
nama = '';
uang = 0 ;
val = get( hObj, 'style');
state = 0; 
switch val,
    case 'edit'
        tag = get(hObj, 'tag');
        switch tag
            case 'nama'
                nama = get(hObj, 'string');
            case 'uang'
                str = get(hObj, 'string');
                uang = str2double(str);
        end
    case 'popupmenu'
        state = get(hObj, 'Value');
end
data = cat(1, data, {count, nama, uang, state});

end

function [] = update(varargin) 
global table; 
global data; 
global uang_field; 
global name_field; 
global state_popup; 
global count;
global fig ;
global dialog ; 
count = count +1; 
uang = get(uang_field, 'string');
uang = str2double(uang);
nama = get(name_field, 'string');
state = get(state_popup , 'value');
% state = logical (state);
if(state == 1),
    state = true;
elseif (state == 2),
    state = false;
else
    disp('why..??');
end
data = cat(1, data, {count, nama, uang, state});
set(table, 'data', data); 
close(fig);
dialog = 0;
end 

% serius MATLAB sangat jelek dalam menangani GUI.... makanya jadi bingung konsep intinya
% function [] = set_data(obj, event)
% global table; 
% data = get(obj,'Data');
% % data1 = get(data, 'event.indices');
% disp(data);
% disp(data{event.indices(1)});
% disp('maaf');
% end

function [] = delete_data(varargin)
global table; 
global data; 
indeks = get(table, 'userData');
indeks = indeks(1);
data{indeks, 1} = [];
data{indeks, 2} = [];
data{indeks, 3} = [];
data{indeks , 4} = [];
set(table, 'data', data); 
disp(data);
end

function y = get_default_data(varargin)
global count; 
count = count +1; 
y = {count,'Samiun', 12000, true}; 
count = count +1; 
y = cat(1, y,{count , 'Razak ', 13000, false} ); 
count = count +1; 
y = cat(1, y,{count , 'Saefullah',  1234 , true} ); 
end 