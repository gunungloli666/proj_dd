function varargout = database(varargin)
% DATABASE M-file for database.fig
%      DATABASE, by itself, creates a new DATABASE or raises the existing
%      singleton*.
%
%      H = DATABASE returns the handle to a new DATABASE or the handle to
%      the existing singleton*.
%
%      DATABASE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATABASE.M with the given input arguments.
%
%      DATABASE('Property','Value',...) creates a new DATABASE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before database_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to database_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help database

% Last Modified by GUIDE v2.5 02-Dec-2014 22:29:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @database_OpeningFcn, ...
                   'gui_OutputFcn',  @database_OutputFcn, ...
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


% --- Executes just before database is made visible.
function database_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to database (see VARARGIN)

% Choose default command line output for database
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes database wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = database_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
