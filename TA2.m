function varargout = TA2(varargin)
% TA2 M-file for TA2.fig
%      TA2, by itself, creates a new TA2 or raises the existing
%      singleton*.
%
%      H = TA2 returns the handle to a new TA2 or the handle to
%      the existing singleton*.
%
%      TA2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TA2.M with the given input arguments.
%
%      TA2('Property','Value',...) creates a new TA2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TA2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TA2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TA2

% Last Modified by GUIDE v2.5 14-Oct-2014 17:45:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TA2_OpeningFcn, ...
                   'gui_OutputFcn',  @TA2_OutputFcn, ...
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


% --- Executes just before TA2 is made visible.
function TA2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TA2 (see VARARGIN)

% Choose default command line output for TA2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TA2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = TA2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonuji.
function buttonuji_Callback(hObject, eventdata, handles)
% hObject    handle to buttonuji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);

x = [1 2 3 4 5 6 7 8 9 10];

Image1=imread('D1.gif');
Image2=imread('D6.gif');
Image3=imread('D20.gif');
Image4=imread('D21.gif');
Image5=imread('D22.gif');
Image6=imread('D52.gif');
Image7=imread('D82.gif');
Image8=imread('D87.gif');
Image9=imread('D103.gif');
Image10=imread('D104.gif');
Image11=get(proyek.axes1,'userdata');

intensitas_1 = std2(Image1);
rata2_1 = mean2(Image1);
entropi_1 = entropy(Image1);
GLCM_1 = graycomatrix(Image1); %menghitung GLCM
energi1 = graycoprops(GLCM_1,{'energy'}); 
energi_1= struct2array(energi1);
homogeiniti1 = graycoprops(GLCM_1,{'homogeneity'});
homogeiniti_1= struct2array(homogeiniti1);
C1=[intensitas_1, rata2_1, entropi_1, energi_1, homogeiniti_1]' %Matriks C1

intensitas_2 = std2(Image2);
rata2_2 = mean2(Image2);
entropi_2 = entropy(Image2);
GLCM_2 = graycomatrix(Image2); %menghitung GLCM
energi2 = graycoprops(GLCM_2,{'energy'}); 
energi_2= struct2array(energi2);
homogeiniti2 = graycoprops(GLCM_2,{'homogeneity'});
homogeiniti_2= struct2array(homogeiniti2);
C2=[intensitas_2, rata2_2, entropi_2, energi_2, homogeiniti_2]' %Matriks C2

intensitas_3 = std2(Image3);
rata2_3 = mean2(Image3);
entropi_3 = entropy(Image3);
GLCM_3 = graycomatrix(Image3); %menghitung GLCM
energi3 = graycoprops(GLCM_3,{'energy'}); 
energi_3= struct2array(energi3);
homogeiniti3 = graycoprops(GLCM_3,{'homogeneity'});
homogeiniti_3= struct2array(homogeiniti3);
C3=[intensitas_3, rata2_3, entropi_3, energi_3, homogeiniti_3]' %Matriks C3

intensitas_4 = std2(Image4);
rata2_4 = mean2(Image4);
entropi_4 = entropy(Image4);
GLCM_4 = graycomatrix(Image4); %menghitung GLCM
energi4 = graycoprops(GLCM_4,{'energy'}); 
energi_4= struct2array(energi4);
homogeiniti4 = graycoprops(GLCM_4,{'homogeneity'});
homogeiniti_4= struct2array(homogeiniti4);
C4=[intensitas_4, rata2_4, entropi_4, energi_4, homogeiniti_4]' %Matriks C4

intensitas_5 = std2(Image5);
rata2_5 = mean2(Image5);
entropi_5 = entropy(Image5);
GLCM_5 = graycomatrix(Image5); %menghitung GLCM
energi5 = graycoprops(GLCM_5,{'energy'}); 
energi_5= struct2array(energi5);
homogeiniti5 = graycoprops(GLCM_5,{'homogeneity'});
homogeiniti_5= struct2array(homogeiniti5);
C5=[intensitas_5, rata2_5, entropi_5, energi_5, homogeiniti_5]' %Matriks C5

intensitas_6 = std2(Image6);
rata2_6 = mean2(Image6);
entropi_6 = entropy(Image6);
GLCM_6 = graycomatrix(Image6); %menghitung GLCM
energi6 = graycoprops(GLCM_6,{'energy'}); 
energi_6= struct2array(energi6);
homogeiniti6 = graycoprops(GLCM_6,{'homogeneity'});
homogeiniti_6= struct2array(homogeiniti6);
C6=[intensitas_6, rata2_6, entropi_6, energi_6, homogeiniti_6]' %Matriks C6

intensitas_7 = std2(Image7);
rata2_7 = mean2(Image7);
entropi_7 = entropy(Image7);
GLCM_7 = graycomatrix(Image7); %menghitung GLCM
energi7 = graycoprops(GLCM_7,{'energy'}); 
energi_7= struct2array(energi7);
homogeiniti7 = graycoprops(GLCM_7,{'homogeneity'});
homogeiniti_7= struct2array(homogeiniti7);
C7=[intensitas_7, rata2_7, entropi_7, energi_7, homogeiniti_7]' %Matriks C7

intensitas_8 = std2(Image8);
rata2_8 = mean2(Image8);
entropi_8 = entropy(Image8);
GLCM_8 = graycomatrix(Image8); %menghitung GLCM
energi8 = graycoprops(GLCM_8,{'energy'}); 
energi_8= struct2array(energi8);
homogeiniti8 = graycoprops(GLCM_8,{'homogeneity'});
homogeiniti_8= struct2array(homogeiniti8);
C8=[intensitas_8, rata2_8, entropi_8, energi_8, homogeiniti_8]' %Matriks C8

intensitas_9 = std2(Image9);
rata2_9 = mean2(Image9);
entropi_9 = entropy(Image9);
GLCM_9 = graycomatrix(Image9); %menghitung GLCM
energi9 = graycoprops(GLCM_9,{'energy'}); 
energi_9= struct2array(energi9);
homogeiniti9 = graycoprops(GLCM_9,{'homogeneity'});
homogeiniti_9= struct2array(homogeiniti9);
C9=[intensitas_9, rata2_9, entropi_9, energi_9, homogeiniti_9]' %Matriks C9

intensitas_10 = std2(Image10);
rata2_10 = mean2(Image10);
entropi_10 = entropy(Image10);
GLCM_10 = graycomatrix(Image10); %menghitung GLCM
energi10 = graycoprops(GLCM_10,{'energy'}); 
energi_10= struct2array(energi10);
homogeiniti10 = graycoprops(GLCM_10,{'homogeneity'});
homogeiniti_10= struct2array(homogeiniti10);
C10=[intensitas_10, rata2_10, entropi_10, energi_10, homogeiniti_10]' %Matriks C10

%hasil hitung image uji
intensitas_11 = std2(Image11);
rata2_11 = mean2(Image11);
entropi_11 = entropy(Image11);
GLCM_11 = graycomatrix(Image11); %menghitung GLCM
energi11 = graycoprops(GLCM_11,{'energy'}); 
energi_11= struct2array(energi11);
homogeiniti11 = graycoprops(GLCM_11,{'homogeneity'});
homogeiniti_11= struct2array(homogeiniti11);
C11=[intensitas_11, rata2_11, entropi_11, energi_11, homogeiniti_11]' %Matriks C11

% MENCARI CITRA YANG PALING MIRIP TERHADAP CITRA UJI (CITRA ke-10) 
jarak_1_11=sqrt((C1(1,1)-C11(1,1))^2+(C1(2,1)-C11(2,1))^2+(C1(3,1)-C11(3,1))^2+(C1(4,1)-C11(4,1))^2+(C1(5,1)-C11(5,1))^2)
jarak_2_11=sqrt((C2(1,1)-C11(1,1))^2+(C2(2,1)-C11(2,1))^2+(C2(3,1)-C11(3,1))^2+(C2(4,1)-C11(4,1))^2+(C2(5,1)-C11(5,1))^2)
jarak_3_11=sqrt((C3(1,1)-C11(1,1))^2+(C3(2,1)-C11(2,1))^2+(C3(3,1)-C11(3,1))^2+(C3(4,1)-C11(4,1))^2+(C3(5,1)-C11(5,1))^2)
jarak_4_11=sqrt((C4(1,1)-C11(1,1))^2+(C4(2,1)-C11(2,1))^2+(C4(3,1)-C11(3,1))^2+(C4(4,1)-C11(4,1))^2+(C4(5,1)-C11(5,1))^2)
jarak_5_11=sqrt((C5(1,1)-C11(1,1))^2+(C5(2,1)-C11(2,1))^2+(C5(3,1)-C11(3,1))^2+(C5(4,1)-C11(4,1))^2+(C5(5,1)-C11(5,1))^2)
jarak_6_11=sqrt((C6(1,1)-C11(1,1))^2+(C6(2,1)-C11(2,1))^2+(C6(3,1)-C11(3,1))^2+(C6(4,1)-C11(4,1))^2+(C6(5,1)-C11(5,1))^2)
jarak_7_11=sqrt((C7(1,1)-C11(1,1))^2+(C7(2,1)-C11(2,1))^2+(C7(3,1)-C11(3,1))^2+(C7(4,1)-C11(4,1))^2+(C7(5,1)-C11(5,1))^2)
jarak_8_11=sqrt((C8(1,1)-C11(1,1))^2+(C8(2,1)-C11(2,1))^2+(C8(3,1)-C11(3,1))^2+(C8(4,1)-C11(4,1))^2+(C8(5,1)-C11(5,1))^2)
jarak_9_11=sqrt((C9(1,1)-C11(1,1))^2+(C9(2,1)-C11(2,1))^2+(C9(3,1)-C11(3,1))^2+(C9(4,1)-C11(4,1))^2+(C9(5,1)-C11(5,1))^2)
jarak_10_11=sqrt((C10(1,1)-C11(1,1))^2+(C10(2,1)-C11(2,1))^2+(C10(3,1)-C11(3,1))^2+(C10(4,1)-C11(4,1))^2+(C10(5,1)-C11(5,1))^2)
jarak_11_11=sqrt((C11(1,1)-C11(1,1))^2+(C11(2,1)-C11(2,1))^2+(C11(3,1)-C11(3,1))^2+(C11(4,1)-C11(4,1))^2+(C11(5,1)-C11(5,1))^2)

dat=[x(1,1),jarak_1_11,x(1,6),jarak_6_11;x(1,2),jarak_2_11,x(1,7),jarak_7_11;x(1,3),jarak_3_11,x(1,8),jarak_8_11;x(1,4),jarak_4_11,x(1,9),jarak_9_11;x(1,5),jarak_5_11,x(1,10),jarak_10_11];
set(proyek.uitable1,'data',dat);

if jarak_1_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[1 1 0]);
    set(proyek.text_hasil,'String','Kain 1');
elseif jarak_2_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[1 0 1]);
    set(proyek.text_hasil,'String','Kain 2');
elseif jarak_3_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[0 1 1]);
    set(proyek.text_hasil,'String','Kain 3');
elseif jarak_4_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[1 0 0]);
    set(proyek.text_hasil,'String','Kain 4');
elseif jarak_5_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[0 0 1]);
    set(proyek.text_hasil,'String','Kain 5');
elseif jarak_6_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[1 1 0]);
    set(proyek.text_hasil,'String','Kain 6');
elseif jarak_7_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[1 0 1]);
    set(proyek.text_hasil,'String','Kain 7');
elseif jarak_8_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[0 1 1]);
    set(proyek.text_hasil,'String','Kain 8');
elseif jarak_9_11 == 0
    set(proyek.text_hasil,'BackgroundColor',[1 0 0]);
    set(proyek.text_hasil,'String','Kain 9');
else
    set(proyek.text_hasil,'BackgroundColor',[0 0 1]);
    set(proyek.text_hasil,'String','Kain 10');
end;


% --- Executes on button press in buttonupload.
function buttonupload_Callback(hObject, eventdata, handles)
% hObject    handle to buttonupload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.bmp';'*.*'},'Buka Citra')
I = imread(strcat(direktori,namafile));
set(proyek.figure1,'CurrentAxes',proyek.axes1);
set (imshow(I));
set(proyek.axes1,'Userdata',I);
set(proyek.figure1,'Userdata',I);


% --- Executes on button press in buttonback.
function buttonback_Callback(hObject, eventdata, handles)
% hObject    handle to buttonback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


% --- Executes on button press in Kamera.
function Kamera_Callback(hObject, eventdata, handles)
% hObject    handle to Kamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
isCamera=get(hObject,'Value')
if isCamera
    set(hObject,'String','Stop Camera');
    
axes(handles.axes2);
vid=videoinput('winvideo','USB Camera','YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
set(vid,'LoggingMode','Memory');
set(vid,'FramesPerTrigger',Inf);
triggerconfig(vid,'manual');
z=image(zeros(480,640,3));
preview(vid,z);
else
    set(hObject,'String','Start Camera');
    cla(handles.webcamaxes);
end
handles.vid=vid;
guidata(hObject,handles);



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
[cnt x]=imhist(uint8(pro1));
pdf1 = cumsum(cnt);
[cnt x]=imhist(uint8(pro2));
pdf2 = cumsum(cnt);
[cnt x]=imhist(uint8(pro3));
pdf3 = cumsum(cnt);
[cnt x]=imhist(uint8(pro4));
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
