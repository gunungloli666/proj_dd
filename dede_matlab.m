function dede_matlab()
clear all ;
clc;

f = figure('menubar', 'none', 'resize' , 'off', ...
    'position', [100,200, 900, 500]); 


uicontrol('position', [10,10,100,30], 'style', 'pushButton', 'parent', f,  ... 
    'string', 'open', 'Callback', @open, 'tag', 'tombolUtama');  

uicontrol('position', [120, 10 , 100, 30 ], 'style', 'pushButton', ... 
    'parent', f, 'Tag', 'tombolKedua', 'string', 'PLOT', ...
    'callback', @plot );   


ax1 = axes('units', 'pix', 'position', [30, 70,  400, 300], ... 
    'parent', f, 'Tag', 'axisplot');   

ax2 = axes('units', 'pix', 'position', [470, 70, 400, 300], 'parent',f ,... 
    'Tag', 'axisproperty'); 

function open(hObject, handles)
try
    fileName = uigetfile({'*.jpg;', '*.png; '}, 'Pilih File');  
    I = imread(fileName);
    m = struct('image', I , 'x', 20); 
    set(hObject, 'userdata', m );  
catch ME 
    disp('error in load file');
    return; 
end


function plot(hObject, eventData)
% button = findobj('tag', 'tombolUtama'); 
% im = get(button, 'userdata');
% % if ~isfield
% 
% axis = findobj('Tag', 'axisplot');
% imhist(im.image , 'parent', axis);  
% 
% 
% ax2 = findobj('Tag', 'axisproperty'); 
% axes(ax2); 
% 
% pause(2); 
% imhist(im.image , 'parent', ax2 );  


I = imread('test1.jpg'); 

imhist(I);






