function varargout = uji_citra(varargin)
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
handles.output = hObject;

[handles.database, handles.map ]=  openData(); 
clc;

set(handles.tableJarak, 'columnName', {'Nama Kain', 'Jarak'});

guidata(hObject, handles);


function varargout = uji_citra_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in hitungButton.
function hitungButton_Callback(hObject, eventdata, handles)
if ~isfield(handles, 'image')
    return; 
end
image = handles.image; 

m = rgb2gray(image);

imshow(m,'parent', handles.axesSnapshot); 

all = glcm(m);  % hitung properti GLCM semua sudut

[key, jarak , peta]= cekCocok(handles.database, all); 
set(handles.ketNamaKain, 'string', key); 
set(handles.ketJarak , 'string', jarak  ); 

set(handles.tableJarak, 'data', peta ); 

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

% cek dari database mana nama yang cocok... 
function [key, jarakMin, petaJar2Nam]  =  cekCocok(varargin)
database = varargin{1};
dataUji = varargin{2} ;
a = size(database); 
jarakMin = 10000000; % semaksimum  mungkin 
petaJar2Nam = cell(a(1), 2); 

m =  size(database{1}); 

for i=1:a(1)
    jarak = 0; 
    for j=2:m(1)
        jarak = jarak + ( str2double(database{i}{j}) - dataUji{j-1})^2; 
    end
    jarak = sqrt(jarak);
    petaJar2Nam{i,1} = database{i}{1}; 
    petaJar2Nam{i,2} = jarak; 
    if jarak < jarakMin
        jarakMin = jarak; 
        key = database{i}{1};
    end
end

