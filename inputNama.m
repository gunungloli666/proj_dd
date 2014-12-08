function varargout = inputNama(varargin)
% INPUTNAMA M-file for inputNama.fig
%      INPUTNAMA, by itself, creates a new INPUTNAMA or raises the existing
%      singleton*.
%
%      H = INPUTNAMA returns the handle to a new INPUTNAMA or the handle to
%      the existing singleton*.
%
%      INPUTNAMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INPUTNAMA.M with the given input arguments.
%
%      INPUTNAMA('Property','Value',...) creates a new INPUTNAMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before inputNama_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to inputNama_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help inputNama

% Last Modified by GUIDE v2.5 06-Dec-2014 19:16:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inputNama_OpeningFcn, ...
                   'gui_OutputFcn',  @inputNama_OutputFcn, ...
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


% --- Executes just before inputNama is made visible.
function inputNama_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to inputNama (see VARARGIN)

% Choose default command line output for inputNama
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes inputNama wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = inputNama_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputNama_Callback(hObject, eventdata, handles)
% hObject    handle to inputNama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputNama as text
%        str2double(get(hObject,'String')) returns contents of inputNama as a double


% --- Executes during object creation, after setting all properties.
function inputNama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputNama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in okButton.
function okButton_Callback(hObject, eventdata, handles)
% hObject    handle to okButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fungsiInput = getappdata(gcf, 'fungsiInput'); 
dataTable = getappdata(gcf, 'dataTable'); 
dataInput = getappdata(gcf, 'dataInput') ; 
table = getappdata(gcf, 'table'); 

kosong = getappdata(gcf, 'kosong');

str = get(handles.inputNama, 'string'); 

if ~kosong
    feval(fungsiInput, table ,kosong , dataTable , dataInput , str); 
else
    feval(fungsiInput, table , kosong , dataInput , str); 
end

close(gcf);

% guidata(hObject, handles); 
