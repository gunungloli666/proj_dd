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

% Last Modified by GUIDE v2.5 08-Dec-2014 17:03:53

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

[handles.database, handles.map ]=  openData(); 

guidata(hObject, handles);


function varargout = uji_citra_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in calculateButton.
function calculateButton_Callback(hObject, eventdata, handles)
m = handles; 
m.x = linspace(0, 10,1000); 
m.y = sin(m.x); 

guidata(hObject,m ); 



% --- Executes on button press in hitungButton.
function hitungButton_Callback(hObject, eventdata, handles)
if ~isfield(handles, 'image')
    return; 
end
image = handles.image; 

m = rgb2gray(image);

imshow(m,'parent', handles.axesSnapshot); 

all = glcm(m);  % hitung properti GLCM semua sudut

[key, jarak ]= cekCocok(handles.database, all); 

set(handles.ketNamaKain, 'string', key); 

set(handles.ketJarak , 'string', jarak  ); 

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
F = containers.Map(nama, D);

% F.mapEntropi.keys
% cek cocok... jika kembali berarti cocok... jika 0 berarti tidak 
% atau keluarkan jarak paling terkecil dari semua database
function [key, jarakMin ]  =  cekCocok(varargin)
database = varargin{1};
dataUji = varargin{2} ;
a = size(database); 
jarakMin = 10000000; % semaksimum  mungkin 
for i=1:a(1)
    jarak = 0; 
    for j=2:a(2)
        jarak = jarak + (database{i}{j} - dataUji{i}); 
    end
    jarak = sqrt(jarak);
    if jarak < jarakMin
        jarakMin = jarak; 
        key = database{i,1};
    end
end
