function varargout = Scored(varargin)
% SCORED MATLAB code for Scored.fig
%      SCORED, by itself, creates a new SCORED or raises the existing
%      singleton*.
%
%      H = SCORED returns the handle to a new SCORED or the handle to
%      the existing singleton*.
%
%      SCORED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCORED.M with the given input arguments.
%
%      SCORED('Property','Value',...) creates a new SCORED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Scored_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Scored_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Scored

% Last Modified by GUIDE v2.5 12-Jul-2018 07:15:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Scored_OpeningFcn, ...
                   'gui_OutputFcn',  @Scored_OutputFcn, ...
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


% --- Executes just before Scored is made visible.
function Scored_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Scored (see VARARGIN)

% Choose default command line output for Scored
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Scored wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Scored_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%라디오 버튼 입력 값들 
outwall = get(handles.radiobutton1, 'Value' );
stairwall = get(handles.radiobutton2, 'Value' );
Shaft = get(handles.radiobutton3, 'Value' );
NoShearWall = get(handles.radiobutton4, 'Value' );
InnerRemove= get(handles.radiobutton5, 'Value' );
NoInnerRemove = get(handles.radiobutton6, 'Value' );
RF = get(handles.radiobutton7, 'Value' );
NoRF = get(handles.radiobutton8, 'Value' );
%실제 계산 
if( outwall || stairwal || Shaft || NoShearWall)
    f = errordlg('조건 을 아직 덜 설정하셨습니다.',' ');
elseif (  InnerRemove || NoInnerRemove)
	f = errordlg('조건 을 아직 덜 설정하셨습니다.',' ');
elseif (RF || NoRF)
    f = errordlg('조건 을 아직 덜 설정하셨습니다.',' ');
else

    [ e1, e2, e3, e4, e5, e6, e7, e8, e9] = Cal_Score(outWall, stairwall,Shaft,NoShearWall, InnerRemove,NoInnerRemove,RF,NoRF );
    scoring=100-e1+e2-e3-e4-e5-e6-e7-e8+e9;
    set(handles.edit2,'string',-e1);
    set(handles.edit3,'string',+e2);
    set(handles.edit4,'string',-e3);
    set(handles.edit5,'string',-e4);
    set(handles.edit6,'string',-e5);
    set(handles.edit7,'string',-e6);
    set(handles.edit8,'string',-e7);
    set(handles.edit9,'string',-e8);
    set(handles.edit10,'string',+e9);
    set(handles.scoring,'string',scoring);
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton8.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton7.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton1.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if( get(handles.radiobutton4, 'Value' ))
    set(handles.radiobutton1, 'Value', 0)
    set(handles.radiobutton2, 'Value', 0)
    set(handles.radiobutton3, 'Value', 0)
end

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if( get(handles.radiobutton6, 'Value' ))
    set(handles.radiobutton5, 'Value', 0)
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton6.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton5.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if( get(handles.radiobutton8, 'Value' ))
    set(handles.radiobutton7, 'Value', 0)
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton5
