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

% Last Modified by GUIDE v2.5 16-Oct-2014 13:01:41

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
% UIWAIT makes fjr_gldm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


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
cla(handles.axes_1); 
cla(handles.axes_2); 
cla(handles.axes_3); 
cla(handles.axes_4); 
clc; 


% --- Executes on button press in openButton.
function openButton_Callback(hObject, eventdata, handles)
% hObject    handle to openButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    fileName = uigetfile({'*.jpg;' }, 'Pilih File');  
    I = imread(fileName); 
%     [count , bin] =  imhi(I); 
    % imshow(I, 'parent', handles.axesImage); 
    handles.image = I; 
    set(hObject , 'Tag', 'fajarImage'); 
%     handles.count = count; 
%     handles.bin = bin; 
catch ME 
    disp('error in load file');
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
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isfield(handles, 'image')
    return; 
end 
m = handles.image; 

imshow(m, 'parent', handles.axesImage); 

% axes(handles.axes_1);

cropped = imcrop(m, [ 10, 10, 100, 100 ]); 

% imshow(cropped, 'parent',  handles.axes_1);  

% hitung fungsi 

d = 4;

s = size(cropped);
I = double(cropped) ;

pro1=zeros(s);
pro2=zeros(s);
pro3=zeros(s);
pro4=zeros(s);

for i=1:s(1)
    for j=1:s(2)
        if((j+d)<=s(2))
            pro1(i,j)=abs(I(i,j)-I(i,(j+d)));
        end
        if((i-d)>0)&&((j+d)<=s(2))
            pro2(i,j)=abs(I(i,j)-I((i-d),(j+d)));
        end
        if((i+d)<=s(1))
            pro3(i,j)=abs(I(i,j)-I((i+d),j));
        end
        if((i-d)>0)&&((j-d)>0)
            pro4(i,j)=abs(I(i,j)-I((i-d),(j-d)));
        end
    end
end

% %probability density functions
[cnt x]=imhist(rgb2gray(pro1));
pdf1 = cumsum(cnt);
[cnt x]=imhist(rgb2gray(pro2));
pdf2 = cumsum(cnt);
[cnt x]=imhist(rgb2gray(pro3));
pdf3 = cumsum(cnt);
[cnt x]=imhist(rgb2gray(pro4));

pdf4 = cumsum(cnt);

abhi2=pdf1-pdf4;
abhi3=pdf2-pdf3; 
abhi4=pdf2-pdf4; 
abhi5=pdf3-pdf4; 

plot(abhi2, 'parent', handles.axes_1);
plot(abhi2, 'parent', handles.axes_2 );
plot(abhi3, 'parent', handles.axes_3);
plot(abhi4, 'parent', handles.axes_4 );

% GLDM
[lebar,tinggi] = size(m);

delta = 10;

% hitung matriks gray level
D = zeros(lebar, tinggi); 
for i=1:tinggi, 
    for j=1:lebar
        rata2 = 0; 
        for x = i-delta:i+delta
            for y = j-delta:j+delta
                if (x <= lebar) && ( x >= 1) && ... 
                        (y <= tinggi ) && (y >= 1)
                    rata2 = rata2 + m(x,y);
                end
            end
        end
        rata2 = rata2/((2*m) * (2*m )); 
        D(i,j)= abs(m(i,j) - rata2);
    end
end

% hitung mean
mu = 0; 
for i=1:lebar 
    for j=1:tinggi
        mu = mu + D(i,j); 
    end 
end 

% hitung standard deviasi
sd = 0; 
for i=1:lebar
    for j=1:tinggi
        
    end 
end 

