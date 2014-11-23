function varargout = gldm(varargin)
% GLDM M-file for gldm.fig
%      GLDM, by itself, creates a new GLDM or raises the existing
%      singleton*.
%
%      H = GLDM returns the handle to a new GLDM or the handle to
%      the existing singleton*.
%
%      GLDM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GLDM.M with the given input arguments.
%
%      GLDM('Property','Value',...) creates a new GLDM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gldm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gldm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gldm

% Last Modified by GUIDE v2.5 19-Jun-2012 18:12:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gldm_OpeningFcn, ...
                   'gui_OutputFcn',  @gldm_OutputFcn, ...
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


% --- Executes just before gldm is made visible.
function gldm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gldm (see VARARGIN)

% Choose default command line output for gldm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gldm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gldm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile({'*.*'},'Load Image File');
if (FileName==0) % cancel pressed
    return;
end

handles.fullPath = [PathName FileName];

[a, b, Ext] = fileparts(FileName);
availableExt = {'.bmp','.jpg','.jpeg','.tiff','.png','.gif'};
FOUND = 0;
for (i=1:length(availableExt))
    if (strcmpi(Ext, availableExt{i}))
        FOUND=1;
        break;
    end
end

if (FOUND==0)
    msgbox('File type not supported Load file with proper extension!','Error','error');
    return;
end
RGB= imread(handles.fullPath);
handles.fileLoaded = 1;
handles.RGB=RGB;
set(handles.axes1,'Visible','on');
axes(handles.axes1); cla; imshow(handles.RGB);
guidata(hObject,handles)


% --- Executes on button press in load1.
function load1_Callback(hObject, eventdata, handles)
% hObject    handle to load1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile({'*.*'},'Load Image File');
if (FileName==0) % cancel pressed
    return;
end

handles.fullPath = [PathName FileName];

[a, b, Ext] = fileparts(FileName);
availableExt = {'.bmp','.jpg','.jpeg','.tiff','.png','.gif'};
FOUND = 0;
for (i=1:length(availableExt))
    if (strcmpi(Ext, availableExt{i}))
        FOUND=1;
        break;
    end
end

if (FOUND==0)
    msgbox('File type not supported Load file with proper extension!','Error','error');
    return;
end
RGB1= imread(handles.fullPath);
handles.fileLoaded = 1;
handles.RGB1=RGB1;
set(handles.axes5,'Visible','on');
axes(handles.axes5); 
cla; 
imshow(handles.RGB1);
guidata(hObject,handles)


% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
crop=imcrop(handles.RGB);
crop=rgb2gray(crop);
handles.crop=crop;
axes(handles.axes1);imshow(handles.crop);
guidata(hObject,handles)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
crop1=imcrop(handles.RGB1);
crop1=rgb2gray(crop1);
handles.crop1=crop1;
axes(handles.axes5);
imshow(handles.crop1);
guidata(hObject,handles)


% --- Executes on button press in gldm.
function gldm_Callback(hObject, eventdata, handles)
% hObject    handle to gldm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% GRAY LEVEL DIFFERENCE METHOD
I = handles.crop;
d = 4;
s=size(I);
I=double(I);
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
%probability density functions
[cnt x]=imhist(uint8(pro1));
pdf1 = cumsum(cnt);
[cnt x]=imhist(uint8(pro2));
pdf2 = cumsum(cnt);
[cnt x]=imhist(uint8(pro3));
pdf3 = cumsum(cnt);
[cnt x]=imhist(uint8(pro4));
pdf4 = cumsum(cnt);
abhi2=pdf1-pdf4
abhi3=pdf2-pdf3
abhi4=pdf2-pdf4
abhi5=pdf3-pdf4
axes(handles.axes1);imshow(abhi2);
axes(handles.axes2);imshow(abhi3);
axes(handles.axes3);imshow(abhi4);
axes(handles.axes4);imshow(abhi5);
figure;

subplot(224);plot(abhi2);title('pdf1-pdf4');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')
subplot(221);plot(abhi3);title('pdf2-pdf3');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')
subplot(222);plot(abhi4);title('pdf2-pdf4');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')
subplot(223);plot(abhi5);title('pdf3-pdf4');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')

guidata(hObject,handles)



% --- Executes on button press in gldm2.
function gldm2_Callback(hObject, eventdata, handles)
% hObject    handle to gldm2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% GRAY LEVEL DIFFERENCE METHOD
I1 = handles.crop1;
d = 4;
s=size(I1);
I=double(I1);
pro1=zeros(s);
pro2=zeros(s);
pro3=zeros(s);
pro4=zeros(s);
for i=1:s(1)
    for j=1:s(2)
        if((j+d)<=s(2))
            pro1(i,j)=abs(I1(i,j)-I1(i,(j+d)));
        end
        if((i-d)>0)&&((j+d)<=s(2))
            pro2(i,j)=abs(I1(i,j)-I1((i-d),(j+d)));
        end
        if((i+d)<=s(1))
            pro3(i,j)=abs(I1(i,j)-I1((i+d),j));
        end
        if((i-d)>0)&&((j-d)>0)
            pro4(i,j)=abs(I1(i,j)-I1((i-d),(j-d)));
        end
    end
end
%probability density functions
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
axes(handles.axes5);imshow(abhi2);
axes(handles.axes7);imshow(abhi3);
axes(handles.axes8);imshow(abhi4);
axes(handles.axes9);imshow(abhi5);
figure;

subplot(224);plot(abhi2);title('pdf1-pdf4');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')
subplot(221);plot(abhi3);title('pdf2-pdf3');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')
subplot(222);plot(abhi4);title('pdf2-pdf4');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')
subplot(223);plot(abhi5);title('pdf3-pdf4');
ylabel('Cum sum  diff dim')
xlabel('Gray scale value')

guidata(hObject,handles)
