function varargout = getData(varargin)
% GETDATA M-file for getData.fig
%      GETDATA, by itself, creates a new GETDATA or raises the existing
%      singleton*.
%
%      H = GETDATA returns the handle to a new GETDATA or the handle to
%      the existing singleton*.
%
%      GETDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GETDATA.M with the given input arguments.
%
%      GETDATA('Property','Value',...) creates a new GETDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before getData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to getData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help getData

% Last Modified by GUIDE v2.5 04-Dec-2014 21:49:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @getData_OpeningFcn, ...
                   'gui_OutputFcn',  @getData_OutputFcn, ...
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

handles.varargin = varargin; 
% End initialization code - DO NOT EDIT


% --- Executes just before getData is made visible.
function getData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to getData (see VARARGIN)

% Choose default command line output for getData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes getData wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = getData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inputAsm_Callback(hObject, eventdata, handles)
% hObject    handle to inputAsm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputAsm as text
%        str2double(get(hObject,'String')) returns contents of inputAsm as a double


% --- Executes during object creation, after setting all properties.
function inputAsm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputAsm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputNamaKain_Callback(hObject, eventdata, handles)
% hObject    handle to inputNamaKain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputNamaKain as text
%        str2double(get(hObject,'String')) returns contents of inputNamaKain as a double


% --- Executes during object creation, after setting all properties.
function inputNamaKain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputNamaKain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputKontras_Callback(hObject, eventdata, handles)
% hObject    handle to inputKontras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputKontras as text
%        str2double(get(hObject,'String')) returns contents of inputKontras as a double


% --- Executes during object creation, after setting all properties.
function inputKontras_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputKontras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputIdm_Callback(hObject, eventdata, handles)
% hObject    handle to inputIdm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputIdm as text
%        str2double(get(hObject,'String')) returns contents of inputIdm as a double


% --- Executes during object creation, after setting all properties.
function inputIdm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputIdm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputEntropi_Callback(hObject, eventdata, handles)
% hObject    handle to inputEntropi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputEntropi as text
%        str2double(get(hObject,'String')) returns contents of inputEntropi as a double


% --- Executes during object creation, after setting all properties.
function inputEntropi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputEntropi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputKorelasi_Callback(hObject, eventdata, handles)
% hObject    handle to inputKorelasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputKorelasi as text
%        str2double(get(hObject,'String')) returns contents of inputKorelasi as a double


% --- Executes during object creation, after setting all properties.
function inputKorelasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputKorelasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inputOk.
function inputOk_Callback(hObject, eventdata, handles)
% hObject    handle to inputOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nama_kain = get(handles.inputNamaKain, 'string'); 
asm = get(handles.inputAsm, 'string'); 
kontras = get(handles.inputKontras, 'string'); 
idm = get(handles.inputIdm, 'string');
entropi = get(handles.inputEntropi , 'string'); 
korelasi = get(handles.inputKorelasi, 'string'); 

clc; 
try
    asm = str2double(asm); 
    kontras = str2double(kontras); 
    idm = str2double(idm); 
    entropi = str2double(entropi ); 
    korelasi = str2double(korelasi); 
catch ME
    disp('error convert property to number'); 
    return; 
end

% asm * 2 

C.asm = asm; 
C.nama_kain = nama_kain; 
C.kontras = kontras; 
C.korelasi = korelasi; 
C.entropi = entropi; 
C.idm = idm; 

D = {nama_kain, num2str(asm), num2str(kontras), num2str(idm ) , num2str(entropi),...
    num2str(korelasi)};

% varargin = handles.varargin; 
% 
% disp(varargin{1}); 

m = getappdata(gcf, 'x'); 
feval(m, D); 


close(gcf); 

% guidata(hObject, handles); 


