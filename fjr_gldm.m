function varargout = fjr_gldm(varargin)
% FJR_GLDM M-file for fjr_gldm.fig
%      FJR_GLDM, by itself, creates a new FJR_GLDM or raises the existing
%      singleton*.
%
%      H = FJR_GLDM returns the handle to a new FJR_GLDM or the handle to
%      the existing singleton*.
%
%      FJR_GLDM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FJR_GLDM.M with the given input arguments.
%
%      FJR_GLDM('Property','Value',...) creates a new FJR_GLDM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fjr_gldm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fjr_gldm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fjr_gldm

% Last Modified by GUIDE v2.5 06-Dec-2014 18:17:45

% Begin initialization code - DO NOT EDIT
% clear all; 

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fjr_gldm_OpeningFcn, ...
                   'gui_OutputFcn',  @fjr_gldm_OutputFcn, ...
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


% clc; 
% disp('santai'); 


% --- Executes just before fjr_gldm is made visible.
function fjr_gldm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fjr_gldm (see VARARGIN)

% Choose default command line output for fjr_gldm

clc;
% clear all;


handles.output = hObject;
% Update handles structure

handles.rekam = 0; 
% 
% global patokan; 
% 
% handles.patok = patokan;
% 
% handles.patok

% handles.database = {}; 

% % clc; 
% fid = fopen('./database/data.txt','r');
% C = textscan(fid, '%s %s %s %s %s %s',  'Delimiter','|');
% fclose(fid);
% 
% D = {} ; 
% for i=1:numel(C)
%     temp = {str2double(C{2}{i}), str2double(C{3}{i}), str2double(C{4}{i}), ...
%         str2double(C{5}{i}) , str2double(C{6}{i})};
%     D = cat(1,D, temp);  
% end
% 
% handles.database = D;

global map; 
[handles.database, map ]=  openData(); 

guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = fjr_gldm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startGldmButton.
function startGldmButton_Callback(hObject, eventdata, handles)
% hObject    handle to startGldmButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try 
x = handles.x;
y = handles.y;
catch ME
    return; 
end 
hanldes.plot1 = plot(handles.axesImage, x, y ); 


% --- Executes on button press in calculateButton.
function calculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x ; 
% global y;

% m = guidata(handles.axesImage); 
m = handles; 
m.x = linspace(0, 10,1000); 
m.y = sin(m.x); 

guidata(hObject,m ); 

% --- Executes on button press in deleteButton.
function deleteButton_Callback(hObject, eventdata, handles)
% hObject    handle to deleteButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% delete(handles.plot1);
cla(handles.axesImage );
% axes(handles.axes_1);
clc; 


% --- Executes on button press in openButton.
function openButton_Callback(hObject, eventdata, handles)
% hObject    handle to openButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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



% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in hitungButton.
function hitungButton_Callback(hObject, eventdata, handles)
if ~isfield(handles, 'image')
    return; 
end
image = handles.image; 

[tinggi, lebar] = size(image);
ukuran = min(tinggi, lebar); 

% setengah = floor(ukuran * 0.5); 
% m = imcrop(image, [0,0, setengah,setengah]);  

m = rgb2gray(image);

imshow(m,'parent', handles.axesSnapshot); 

% drawnow;

% GLDM
[tinggi, lebar] = size(m);

tinggi = floor(tinggi/2); 
lebar = floor(lebar/2); 

handles.tinggi = tinggi; 
handles.lebar = lebar; 

delta = floor(min(tinggi, lebar)/ 60);

% disp(['nilai tinggi = ', num2str(tinggi)]); 
% disp(['nilai lebar = ' , num2str(lebar)]);
% disp(['nilai delta = ', num2str(delta)]); 
% hitung matriks gray level
% D = zeros(tinggi, lebar); 
% step = floor(tinggi/20); 
% for i=1:tinggi, 
%     if mod(i, step) == 0
%         persen =ceil( i/tinggi * 100); 
%         set(handles.ketProgress, 'string', num2str(persen));  
%          drawnow; 
%    end
%     for j=1:lebar
%         rata2 = 0; 
%         for x = i-delta:i+delta
%             for y = j-delta:j+delta
%                 if (x <= tinggi ) && ( x >= 1) && ... 
%                         (y <= lebar ) && (y >= 1)
%                     rata2 = rata2 + m(x,y);
% %                      drawnow; 
%                 end
%             end
%         end
%         rata2 = rata2/((2*delta)*(2*delta)); 
%         D(i,j)= abs(m(i,j) - rata2);
%     end
% end
% 
% % mean
% mu = sum(sum(D(:,:))); 
% mu = mu/(lebar * tinggi); 
% 
% % sd
% sd = sum(sum((D(:,:)- mu).^2)); 
% sd = sd/(tinggi * lebar);
% sd = sqrt(sd);

% ini properti-properti yang diperoleh dari metode GLCM

intensitas = std2(m);
rata2 = mean2(m);
entropi = entropy(m);
GLCM = graycomatrix(m); %menghitung GLCM
energi = graycoprops(GLCM,{'energy'}); 
energi_ = struct2array(energi);
homogeiniti = graycoprops(GLCM,{'homogeneity'});
homogeiniti_= struct2array(homogeiniti);

% disp(energi);
% disp(energi_); 

% C10=[intensitas_10, rata2_10, entropi_10, energi_10, homogeiniti_10]' %Matriks C10
% set(handles.ketIntensitas,'string', num2str(intensitas)); 
% set(handles.ketRata2 , 'string', num2str(rata2)); 
% set(handles.ketEntropi , 'string',  num2str(entropi)); 

% set(handles.ketAsm, 'string', num2str(mu)); 
% set(handles.ketKontras , 'string', num2str(sd)); 
% set(handles.ketFinish , 'string', 'FINISH'); 

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
if m.jarak < 15 
    set(handles.hasilKeterangan, 'string', 'COCOK'); 
   
else 
    set(handles.hasilKeterangan, 'string', 'MENDEKATI'); 
end

guidata(hObject, handles);

% --- Executes on button press in kameraButton.
function kameraButton_Callback(hObject, eventdata, handles)
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
guidata(hObject,handles);


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

guidata(hObject,handles);


% --- Executes on button press in toggleRekam.
function toggleRekam_Callback(hObject, eventdata, handles)
% hObject    handle to toggleRekam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggleRekam

state = get(hObject, 'Value'); 
if state == get(hObject, 'Max') 
    handles.rekam = 1; 
    set(hObject,'String', 'STOP') ; 
elseif state == get(hObject, 'Min') 
    handles.rekam = 0;
    set(hObject, 'String', 'REKAM');
end

 m = {22,'Samiun', 12000}; 
% data = get(handles.tableData, 'data');
set(handles.tableData, 'data', m); 
% disp(data);

guidata(hObject, handles );



% untuk load data dari database
% sekalian map property-propertinya.... 
function [D,F ] = openData(varargin)
fid = fopen('./database/data.txt','r');
C = textscan(fid, '%s %s %s %s %s %s',  'Delimiter','|');
fclose(fid);
D = {} ; 
mapAsm = {};
mapKontras = {}; 
mapIdm = {} ;
mapEntropi = {}; 
mapKorelasi = {};

nama = {}; 
for i=1:numel(C{1})
    temp = {str2double(C{2}{i}), str2double(C{3}{i}), str2double(C{4}{i}), ...
        str2double(C{5}{i}) , str2double(C{6}{i}), C{1}{i}};
    D = cat(1,D, temp);  
    mapAsm = cat(2, mapAsm , C{2}{i});
    mapKontras = cat(2, mapKontras , C{3}{i});
    mapIdm = cat(2, mapIdm , C{4}{i}); 
    mapEntropi = cat(2, mapEntropi , C{5}{i});
    mapKorelasi = cat(2, mapKorelasi , C{6}{i});
    nama = cat(2, nama , C{1}{i}); 
end

F.mapAsm = containers.Map(nama, mapAsm);
F.mapIdm = containers.Map(nama,mapIdm); 
F.mapKontras = containers.Map(nama, mapKontras); 
F.mapKorelasi = containers.Map(nama, mapKorelasi); 
F.mapEntropi = containers.Map(nama, mapEntropi); 

% F.mapEntropi.keys
% cek cocok... jika kembali berarti cocok... jika 0 berarti tidak 
% atau keluarkan jarak paling terkecil dari semua database
function m =  cekCocok(varargin)
database = varargin{1};
dataUji = varargin{2} ;

a = size(database); 
jarakMin = 10000000; % semaksimum  mungkin 
% database{3,1}
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
