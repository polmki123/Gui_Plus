function varargout = GUI(varargin)

gui_Singleton = 1;
 
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global Wall_original
global Wall_original_vertex 
global Edit_01
global Origin_img
Wall_original = [];
Wall_original_vertex  = [];
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Wall_original, Edit_01] = read_Process(Wall_original);
Wall_original_vertex = Read_vertex(Wall_original);
Origin_img = Imgclear(Edit_01);
Wall_original = [];

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global Wall_remodeling 
global Wall_remodeling_vertex 
global Edit_02
global Remodel_img
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Wall_remodeling, Edit_02] = read_Process(Wall_remodeling);
Wall_remodeling_vertex = Read_vertex(Wall_remodeling);
Remodel_img = Imgclear(Edit_02);
Wall_remodeling = [];

% --- Executes on button press in pushbutton5.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
origin



% --- Executes on button press in pushbutton6.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
remodel


% --- Executes on button press in pushbutton7.
function pushbutton5_Callback(hObject, eventdata, handles)
global Wall_original_vertex 
global Wall_remodeling_vertex 
global Wall_Compare 
global Edit_01
global Edit_03
global Compare_img
global Wall_Compare_vertex
Wall_Compare_vertex = [];
Wall_Compare = [];
Compare_img = 0;
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
[Wall_Compare, Edit_03] = Compare_vertex(Wall_original_vertex, Wall_remodeling_vertex, Edit_01);
Wall_Compare_vertex = Read_vertex(Wall_Compare);
Compare_img =Imgclear2(Edit_03);
Wall_Compare = [];
close all;
left


% --- Executes on button press in pushbutton3.
function pushbutton6_Callback(hObject, eventdata, handles)
global Wall_original_vertex 
global Wall_remodeling_vertex 
global Wall_remove 
global Wall_remove_vertex
global Wall_Compare_vertex
global Edit_01
global Edit_04
global Remove_img
Wall_remove = [];
Wall_remove_vertex = [];
[Wall_remove, Edit_04] = Remove_vertex(Wall_original_vertex, Wall_Compare_vertex, Edit_01);
Wall_remove_vertex = Read_vertex(Wall_remove);
Remove_img = Imgclear2(Edit_04);
Wall_remove = [];
close all;
remove


% --- Executes on button press in pushbutton4.
function pushbutton7_Callback(hObject, eventdata, handles)
global Wall_original
global Wall_original_vertex 
global Wall_remodeling 
global Wall_remodeling_vertex 
global Wall_Compare 
global Wall_Proportion 
global Wall_Remove
global percentage
percentage = 10;
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
Proportion
