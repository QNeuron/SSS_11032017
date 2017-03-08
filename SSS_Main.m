function varargout = SSS_Main(varargin)
% SSS_MAIN MATLAB code for SSS_Main.fig
%      SSS_MAIN, by itself, creates a new SSS_MAIN or raises the existing
%      singleton*.
%
%      H = SSS_MAIN returns the handle to a new SSS_MAIN or the handle to
%      the existing singleton*.
%
%      SSS_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SSS_MAIN.M with the given input arguments.
%
%      SSS_MAIN('Property','Value',...) creates a new SSS_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SSS_Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SSS_Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SSS_Main

% Last Modified by GUIDE v2.5 04-Mar-2017 17:24:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SSS_Main_OpeningFcn, ...
                   'gui_OutputFcn',  @SSS_Main_OutputFcn, ...
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


% --- Executes just before SSS_Main is made visible.
function SSS_Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SSS_Main (see VARARGIN)

% Choose default command line output for SSS_Main
handles.output = hObject;

hObject.fs = 40000;
hObject.dur = 0.5;
hObject.sil = 0.5; 
%  r = a + (b-a).*rand(100,1);
hObject.baseSound = [-1 + 2.*rand(1,hObject.fs*hObject.dur) zeros(1,hObject.fs*hObject.sil)];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SSS_Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SSS_Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Play_Pause.
function Play_Pause_Callback(hObject, eventdata, handles)
% hObject    handle to Play_Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
