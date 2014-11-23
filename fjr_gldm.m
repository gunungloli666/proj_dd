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

% Last Modified by GUIDE v2.5 23-Nov-2014 23:06:40

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
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

clc;
clear all;




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


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
if ~isfield(handles, 'image')
    return; 
end
image = handles.image; 

m = imcrop(image, [10,10, 400 ,400]);  

m = rgb2gray(m);

imshow(m,'parent', handles.axesImage); 

drawnow;

% GLDM
[tinggi, lebar] = size(m);

delta = 5;

% hitung matriks gray level
D = zeros(tinggi, lebar); 
step = floor(tinggi/20); 
for i=1:tinggi, 
    if mod(i, step) == 0
        persen =ceil( i/tinggi * 100); 
        set(handles.ketProgress, 'string', num2str(persen));  
        drawnow; 
   end
    for j=1:lebar
        rata2 = 0; 
        for x = i-delta:i+delta
            for y = j-delta:j+delta
                if (x <= tinggi ) && ( x >= 1) && ... 
                        (y <= lebar ) && (y >= 1)
                    rata2 = rata2 + m(x,y);
                end
            end
        end
        rata2 = rata2/((2*lebar)*(2*tinggi )); 
        D(i,j)= abs(m(i,j) - rata2);
    end
end

% mean
mu = sum(sum(D(:,:))); 
mu = mu/(lebar * tinggi); 

% sd
sd = sum(sum((D(:,:)- mu).^2)); 
sd = sd/(tinggi * lebar);
sd = sqrt(sd);

set(handles.ketMean, 'string', num2str(mu)); 
set(handles.ketSD , 'string', num2str(sd)); 
set(handles.ketFinish , 'string', 'FINISH'); 
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
snapshot = getsnapshot(handles.video); 
handles.image = snapshot; 
imshow(handles.image, 'parent', handles.axesSnapshot); 
guidata(hObject,handles);