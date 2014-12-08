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

function showDatabase_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

clc; 

table = handles.tableGLCM;


handles.kosong = false; 

set(table, 'columnName', {'Nama Kain'})

[data,] =  openData(); 

[s,] = size(data); 
if s(1) > 1 
    data  = convertDataTable(data); 
    set(table, 'data', data ); 
    handles.dataTable = data; 
else
    handles.kosong = true; 
end

guidata(hObject, handles);


% sekarang kita gunakan pengindeksan elemen... agar bisa dimasukkan sebagai
% data di table... 
function D = convertDataTable(varargin)
data = varargin{1}; 
[row, ] = size(data) ; 
[col, ] = size(data{1}); 
D = cell(row(1),col(1)); 
for i=1:row
    m = data{i}; 
    for j=1:col
        D{i,j} = m{j}; 
    end
end

function varargout = showDatabase_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function inputButton_Callback(hObject, eventdata, handles) 

m = rgb2gray(handles.image); 
all = glcm(m);  
fungsiInput = @hasilInputNama; 
inp = inputNama(); 

setappdata(inp,'fungsiInput', fungsiInput );

if ~ handles.kosong 
    setappdata(inp, 'dataTable', handles.dataTable); 
end

setappdata(inp, 'kosong', handles.kosong); 

setappdata(inp, 'table', handles.tableGLCM);

setappdata(inp, 'dataInput', all); 

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

% ini untuk mengaktifkan kamera... 
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


% dipanggil untuk mengevaluasi data masukkan yang diambil secara langsung
% menggunakan Kamera. Jadi data pada tabel dan file database di tambahkan
% ditambahkan dengan bantuan fungsi ini... 
function hasilInputNama(varargin) 
table = varargin{1} ; 
kosong = varargin{2}; 
if ~kosong
    dataTable = varargin{3}; 
    dataInput = varargin{4}; 
    nama = varargin{5};     
    [row,] = size(dataInput);
    row = row(1); 
    dataTemp = cell(1,row + 1);
    for i=2:row +1
        dataTemp{1,i} = dataInput{i-1}; 
    end
    dataTemp{1,1} = nama; 
    dataTable = cat(1,dataTable, dataTemp);
    set(table, 'data', dataTable );  
    
    
    m = [dataTemp{1,1}, '|']; 
    for i=2:row
        m = cat(2,  m , [num2str(dataTemp{i}), '|'] ) ;  
    end
    m = cat(2,  m , num2str(dataTemp{row+1})); 
    
    fid = fopen('./database/data.txt','a');
    fprintf(fid, '%s\n', m); 
    fclose(fid);
    
else 
    dataInput = varargin{3}; 
    nama = varargin{4}; 
    [row,] = size(dataInput);
    row = row(1); 
    dataTemp = cell(1,row + 1);
    for i=2:row +1
        dataTemp{1,i} = dataInput{i-1}; 
    end
    
    dataTemp{1,1} = nama;
    set(table, 'data', dataTemp);  
    
    
    m = [dataTemp{1,1}, '|']; 
    for i=2:row
        m = cat(2,  m , [num2str(dataTemp{i}), '|'] ) ;  
    end
    m = cat(2,  m , num2str(dataTemp{row+1})); 
    
    fid = fopen('./database/data.txt','w');
    fprintf(fid, '%s\n', m); 
    fclose(fid);
end    
% dataTable = cat(1,dataTable, dataInput);

% data = get(table, 'data'); 

% set(table, 'data', dataTable );  

% m = [varargin{1},'|',  dataTable.asm,'|', dataTable.kontras ,'|',...
%     dataTable.idm ,'|',dataTable.entropi, '|' , ... 
%     dataTable.korelasi ];

% m = zeros(1,row(1)*2);  
% 
% for i=1:2:row(1)*2
%     m(i)= num2str(dataInput{i}); 
%     m(i+1) = '|'; 
% end
% fid = fopen('./database/data.txt','a');
% fprintf(fid, '%s\n', m); 
% fclose(fid);
