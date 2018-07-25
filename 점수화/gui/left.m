function varargout = left(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @left_OpeningFcn, ...
                   'gui_OutputFcn',  @left_OutputFcn, ...
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


% --- Executes just before left is made visible.
function left_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to left (see VARARGIN)

% Choose default command line output for left
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes left wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = left_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
global Wall_Compare_vertex 
global left_X
global Compare_img

temp = zeros(size(Compare_img));

temp(:, :, :) = 255;
temp = rgb2gray(temp);

% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
row = eventdata.Indices(1);
Temp = left_X{1, row};
axes(handles.axes2);
imshow(Compare_img);
vertex =[Temp{1,1}{1,2} Temp{1,1}{1,1} 0 ; Temp{1,3}{1,2} Temp{1,1}{1,1} 0; Temp{1,3}{1,2} Temp{1,2}{1,1} 0;....
        Temp{1,1}{1,2} Temp{1,2}{1,1} 0; Temp{1,1}{1,2} Temp{1,1}{1,1} 330; Temp{1,3}{1,2} Temp{1,1}{1,1} 330; Temp{1,3}{1,2} Temp{1,2}{1,1} 330; Temp{1,1}{1,2} Temp{1,2}{1,1} 330]; 
face =[1 2 3 4; 1 2 6 5; 2 3 7 6; 3 4 8 7; 1 4 8 5; 5 6 7 8];
patch('Vertices',vertex,'faces',face, 'Facecolor',[0.8 1 0.8])
view(3);
axes(handles.axes1);
imshow(Compare_img);
mapping = rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2}) (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[1 0 0],'EdgeColor','r');
imshow(mapping)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global Wall_Compare_vertex 
global left_X
global left_Y
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
left_X = [];
left_Y = [];
Temp_X = [];
Temp_Y = [];
[~, number] = size(Wall_Compare_vertex);
for i = 1 : number;
    A = Wall_Compare_vertex{1,i}{1,1}{1,1};
    B = Wall_Compare_vertex{1,i}{1,1}{1,2};
    C = Wall_Compare_vertex{1,i}{1,4}{1,1};
    D = Wall_Compare_vertex{1,i}{1,4}{1,2};
    if(A ~= 0)
        if C-A >= D-B;
            Temp_X = [Temp_X ;  {A, B, C, D}];
            left_X = [left_X, {{{A, B},{C,B}, {A,D},{C,D}}}];
        else 
            Temp_Y = [ Temp_Y ; {A, B, C, D}];
            left_Y = [left_Y,  {{{A, B},{C,B}, {A,D},{C,D}}}];
        end
    end
    
end
Temp_X = cell2mat(Temp_X);
Temp_Y = cell2mat(Temp_Y);
set(handles.uitable1, 'Data', Temp_X);
set(handles.uitable2, 'Data', Temp_Y);


% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global Wall_Compare_vertex 
global left_Y
global Compare_img

temp = zeros(size(Compare_img));

temp(:, :, :) = 255;
temp = rgb2gray(temp);
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
row = eventdata.Indices(1);
Temp = left_Y{1, row};
axes(handles.axes2);
imshow(Compare_img);
vertex =[Temp{1,1}{1,2} Temp{1,1}{1,1} 0 ; Temp{1,3}{1,2} Temp{1,1}{1,1} 0; Temp{1,3}{1,2} Temp{1,2}{1,1} 0;....
        Temp{1,1}{1,2} Temp{1,2}{1,1} 0; Temp{1,1}{1,2} Temp{1,1}{1,1} 330; Temp{1,3}{1,2} Temp{1,1}{1,1} 330; Temp{1,3}{1,2} Temp{1,2}{1,1} 330; Temp{1,1}{1,2} Temp{1,2}{1,1} 330]; 
face =[1 2 3 4; 1 2 6 5; 2 3 7 6; 3 4 8 7; 1 4 8 5; 5 6 7 8];
patch('Vertices',vertex,'faces',face, 'Facecolor',[0.8 1 0.8])
view(3);
axes(handles.axes1);
imshow(Compare_img);
mapping = rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2}) (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[1 0 0],'EdgeColor','r');
imshow(mapping)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
GUI
