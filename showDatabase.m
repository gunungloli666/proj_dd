function varargout = showDatabase(varargin)
% SHOWDATABASE M-file for showDatabase.fig
%      SHOWDATABASE, by itself, creates a new SHOWDATABASE or raises the existing
%      singleton*.
%
%      H = SHOWDATABASE returns the handle to a new SHOWDATABASE or the handle to
%      the existing singleton*.
%
%      SHOWDATABASE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOWDATABASE.M with the given input arguments.
%
%      SHOWDATABASE('Property','Value',...) creates a new SHOWDATABASE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before showDatabase_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to showDatabase_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help showDatabase

% Last Modified by GUIDE v2.5 04-Dec-2014 21:50:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @showDatabase_OpeningFcn, ...
                   'gui_OutputFcn',  @showDatabase_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before showDatabase is made visible.
function showDatabase_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to showDatabase (see VARARGIN)

% Choose default command line output for showDatabase
% 
global table; 
global M; 
handles.output = hObject;

% Update handles structure

table = handles.tableGLCM;



set(table, 'columnName', {'Nama Kain', 'ASM', 'Kontras', 'IDM', 'Entropi', 'Korelasi'})
% fid = fopen('file.txt','rt');
% C = textscan(fid, '%s', 'Delimiter',''); C = C{1};
% fclose(fid);
clc; 
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s %s %s %s %s %s',  'Delimiter','|');
fclose(fid);


M = {};
data = {}; 
for i=1:numel(C{1})
    ss = {C{1}{i},C{2}{i},C{3}{i}, C{4}{i}, C{5}{i}, C{6}{i}};
    M = cat(1,M, ss);
    data = cat(1, data, {str2double(C{2}{i}) ,... 
        str2double(C{3}{i}), str2double(C{4}{i}), str2double(C{5}{i}), str2double(C{6}{i})});
end
set(table, 'data', M); 

handles.M = M; 

guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = showDatabase_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in inputButton.
function inputButton_Callback(hObject, eventdata, handles)
% hObject    handle to inputButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[A,B,C,D] = glcm(m);  

asm_rata2 = ( A.asm + B.asm + C.asm + D.asm )/ 4
kontras_rata2 = (A.kontras + B.kontras + C.kontras + D.kontras )/ 4 
idm_rata2 = (A.idm + B.idm + C.idm + D.idm )/4
entropi_rata2 = (A.entropi + B.entropi + C.entropi + D.entropi)/4  
korelasi_rata2 = (A.korelasi + B.korelasi + C.korelasi + D.korelasi)/ 4


patok = handles.patokan;

jarak = (asm_rata2 -  patok.asm )^2 + ( kontras_rata2 - patok.kontras)^2 ...
        + ( idm_rata2 - patok.idm )^2 + (entropi_rata2 - patok.entropi)^2 ... 
        + (korelasi_rata2 - patok.korelasi)^2 ; 
    
jarak = sqrt(jarak)

guidata(hObject, handles); 

% --- Executes on button press in snapshotButton.
function snapshotButton_Callback(hObject, eventdata, handles)
% hObject    handle to snapshotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isfield(handles, 'video')
    return; 
end

snapshot = getsnapshot(handles.video); 
handles.image = snapshot; 
imshow(handles.image, 'parent', handles.axesSnapshot); 
% hitung GLCM
guidata(hObject, handles); 

% --- Executes on button press in kameraButton.
function kameraButton_Callback(hObject, eventdata, handles)
% hObject    handle to kameraButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

isCamera=get(hObject,'Value'); 
if isCamera
%     set(hObject,'String','Stop Camera');
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

guidata(hObject, handles); 

function getDataButton_Callback(hObject, eventdata, handles)
database = @hitungJarak;
inp = getData(12);
setappdata(inp, 'x', database); 


% dievaluasi dari file getData.m untuk memasukkan data ke table yang
% diinput secara manual 
function hitungJarak(varargin)
global table; 
global M ;
M = cat(1, M, varargin{1}); 
set(table, 'data', M );  

m = [varargin{1}{1},'|',  varargin{1}{2},'|', varargin{1}{3},'|',...
    varargin{1}{4},'|', varargin{1}{5}, '|' , ... 
    varargin{1}{6} ];  

fid = fopen('./database/data.txt','a');
fprintf(fid, '%s\n', m); 
fclose(fid);


