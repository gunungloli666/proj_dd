function varargout = uji_citra(varargin)
% UJI_CITRA M-file for uji_citra.fig
%      UJI_CITRA, by itself, creates a new UJI_CITRA or raises the existing
%      singleton*.
%
%      H = UJI_CITRA returns the handle to a new UJI_CITRA or the handle to
%      the existing singleton*.
%
%      UJI_CITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UJI_CITRA.M with the given input arguments.
%
%      UJI_CITRA('Property','Value',...) creates a new UJI_CITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before uji_citra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to uji_citra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help uji_citra

% Last Modified by GUIDE v2.5 07-Dec-2014 17:08:46

% Begin initialization code - DO NOT EDIT
% clear all; 

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @uji_citra_OpeningFcn, ...
                   'gui_OutputFcn',  @uji_citra_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function uji_citra_OpeningFcn(hObject, eventdata, handles, varargin)
clc;

handles.output = hObject;
handles.rekam = 0; 

% global map; 
% map = {}; 
[handles.database, handles.map ]=  openData(); 

guidata(hObject, handles);


function varargout = uji_citra_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function startGldmButton_Callback(hObject, eventdata, handles)
try 
x = handles.x;
y = handles.y;
catch ME
    return; 
end 
hanldes.plot1 = plot(handles.axesImage, x, y ); 


% --- Executes on button press in calculateButton.
function calculateButton_Callback(hObject, eventdata, handles)
m = handles; 
m.x = linspace(0, 10,1000); 
m.y = sin(m.x); 

guidata(hObject,m ); 

function openButton_Callback(hObject, eventdata, handles)
try
    fileName = uigetfile({'*.jpg;' }, 'Pilih File');  
    I = imread(fileName); 
    handles.image = I; 
    set(hObject , 'Tag', 'fajarImage'); 
catch ME 
    disp('error in load file');
    report = getReport(ME); 
    disp(report); 
    return; 
end

guidata(hObject, handles);

% --- Executes on button press in hitungButton.
function hitungButton_Callback(hObject, eventdata, handles)
if ~isfield(handles, 'image')
    return; 
end
image = handles.image; 

[tinggi, lebar] = size(image);
ukuran = min(tinggi, lebar); 

m = rgb2gray(image);

imshow(m,'parent', handles.axesSnapshot); 

% GLDM
[tinggi, lebar] = size(m);

tinggi = floor(tinggi/2); 
lebar = floor(lebar/2); 

handles.tinggi = tinggi; 
handles.lebar = lebar; 

delta = floor(min(tinggi, lebar)/ 60);

intensitas = std2(m);
rata2 = mean2(m);
entropi = entropy(m);
GLCM = graycomatrix(m); %menghitung GLCM
energi = graycoprops(GLCM,{'energy'}); 
energi_ = struct2array(energi);
homogeiniti = graycoprops(GLCM,{'homogeneity'});
homogeiniti_= struct2array(homogeiniti);

[A,B,C,D] = glcm(m);  

asm_rata2 = ( A.asm + B.asm + C.asm + D.asm )/ 4;
kontras_rata2 = (A.kontras + B.kontras + C.kontras + D.kontras )/ 4 ;
idm_rata2 = (A.idm + B.idm + C.idm + D.idm )/4; 
entropi_rata2 = (A.entropi + B.entropi + C.entropi + D.entropi)/4  ; 
korelasi_rata2 = (A.korelasi + B.korelasi + C.korelasi + D.korelasi)/ 4 ; 

asm = num2str(asm_rata2); 
kontras = num2str(kontras_rata2); 
idm = num2str(idm_rata2); 
entropi = num2str(entropi_rata2); 
korelasi = num2str(korelasi_rata2); 

set(handles.ketAsm, 'string' , asm); 
set(handles.ketKontras ,'string', kontras); 
set(handles.ketIdm , 'string' , idm); 
set(handles.ketEntropi , 'string' , entropi); 
set(handles.ketKorelasi , 'string' , korelasi); 

dataUji = {asm_rata2, kontras_rata2, idm_rata2 , entropi_rata2, korelasi_rata2}; 

m = cekCocok(handles.database, dataUji); 

set(handles.namaKain, 'string', num2str(m.nama) );
set(handles.hasilAsm, 'string', num2str(m.asm));
set(handles.hasilKontras, 'string', num2str(m.kontras)); 
set(handles.hasilIdm, 'string', num2str(m.idm));
set(handles.hasilEntropi, 'string', num2str(m.entropi)); 
set(handles.hasilKorelasi, 'string', num2str(m.korelasi)); 

 set(handles.hasilJarak, 'string', num2str(m.jarak)); 
if m.jarak < 25
    set(handles.hasilKeterangan, 'string', 'COCOK'); 
else 
    set(handles.hasilKeterangan, 'string', 'MENDEKATI'); 
end

guidata(hObject, handles);

function kameraButton_Callback(hObject, eventdata, handles)
isCamera=get(hObject,'Value'); 
if isCamera
    axes(handles.axesImage);
    vid=videoinput('winvideo','USB Camera','YUY2_640x480');
    set(vid,'ReturnedColorSpace','rgb');
    set(vid,'LoggingMode','Memory');
    set(vid,'FramesPerTrigger',Inf);
    triggerconfig(vid,'manual');
    z=image(zeros(480,640,3));
    preview(vid,z);    
    handles.video = vid;    
end
handles.vid=vid;
guidata(hObject,handles);

% ambil snapshot dari video preview
function snapshotButton_Callback(hObject, eventdata, handles)
if ~isfield(handles, 'video')
    return; 
end
snapshot = getsnapshot(handles.video); 
handles.image = snapshot; 
imshow(handles.image, 'parent', handles.axesSnapshot); 
guidata(hObject,handles);


% untuk load data dari database
% sekalian map property-propertinya.... 
function [D,F ] = openData(varargin)
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s %s %s %s %s %s',  'Delimiter','|');
fclose(fid);
D = {} ; 
nama = {}; 
for i=1:numel(C{1})
    temp = {}; 
    temp = cat(2, temp, C{1}{i}); % nama
    for j=2:numel(C) % variabel-variabel yang lain
        temp = cat(2, temp, str2double(C{j}{i})); 
    end
    D = cat(1,D, temp);  
    nama = cat(1, nama , C{1}{i}); 
end
D
% F = containers.Map(nama, D); 
F = 0 ;

% F.mapEntropi.keys
% cek cocok... jika kembali berarti cocok... jika 0 berarti tidak 
% atau keluarkan jarak paling terkecil dari semua database
function m =  cekCocok(varargin)
database = varargin{1};
dataUji = varargin{2} ;

a = size(database); 
jarakMin = 10000000; % semaksimum  mungkin 

for i=1:a
    jarak = ( database{i,1}- dataUji{1})^2 + (database{i,2} - dataUji{2})^2 ...
        + (database{i,3} - dataUji{3})^2 + (database{i,4}- dataUji{4})^2 ... 
        + (database{i,5} - dataUji{5})^2;
    jarak = sqrt(jarak);
    if jarak < jarakMin
        jarakMin = jarak; 
        key = database{i,6};
    end
end

global map;

m.nama = key; 
m.asm = map.mapAsm(key);
m.idm = map.mapIdm(key);
m.kontras = map.mapKontras(key); 
m.entropi = map.mapEntropi(key);
m.korelasi = map.mapKorelasi(key); 

m.jarak = jarakMin ;
