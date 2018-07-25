function varargout = Proportion(varargin)
% PROPORTION MATLAB code for Proportion.fig
%      PROPORTION, by itself, creates a new PROPORTION or raises the existing
%      singleton*.
%
%      H = PROPORTION returns the handle to a new PROPORTION or the handle to
%      the existing singleton*.
%
%      PROPORTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROPORTION.M with the given input arguments.
%
%      PROPORTION('Property','Value',...) creates a new PROPORTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proportion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proportion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proportion

% Last Modified by GUIDE v2.5 07-Jun-2018 20:06:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proportion_OpeningFcn, ...
                   'gui_OutputFcn',  @Proportion_OutputFcn, ...
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


% --- Executes just before Proportion is made visible.
function Proportion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proportion (see VARARGIN)

% Choose default command line output for Proportion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proportion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proportion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable3.
function uitable3_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Wall_original_vertex 
global Wall_Compare_vertex
global percentage 
global Compare_img
global Origin_img
global Width_removeX
global Width_removeY
global colX
global colY
global real_colX
global real_colY
global real_rate
[ row, col, ~] = size(Origin_img);

Temp_X = [];Temp_Y = [];Temp_X2 = [];Temp_Y2 = [];
Width_X = []; Width_removeX = []; Width_leftX = [];
Width_Y = []; Width_removeY = []; Width_leftY = [];
real_rowX= []; real_colX = [];
real_rowY = []; real_colY= [];
result = 0; Temp1 = [];Temp2 = [];
Temp = Proportion_vertex( Wall_original_vertex, Wall_Compare_vertex);
long_wall = load_long_wall(Wall_original_vertex);
[~, number] = size(Temp);
rate = percentage/long_wall; 
real_rate = rate;
real_X= [];real_leftX = []; real_removeX = [];
real_Y= [];real_leftY = []; real_removeY = [];
rowX = []; colX = [];
rowY = []; colY = [];
for i = 1 : number
    result = Temp{1,i};
    A = Wall_original_vertex{1,i}{1,1}{1,1};
    B = Wall_original_vertex{1,i}{1,1}{1,2};
    C = Wall_original_vertex{1,i}{1,4}{1,1};
    D = Wall_original_vertex{1,i}{1,4}{1,2};
    width = (C-A)*(D-B);
    if C-A >= D-B
        rowX = [rowX; {C-A}];
        colX = [colX; {D-B}];
        Temp_X = [Temp_X ; {fix_num(result)}];
        Temp_X2 = [Temp_X2 ; {fix_num(100-result)}];
        Width_X = [ Width_X; {width}];
        Width_leftX = [Width_leftX ;  {fix_num(result * width/100)} ]; 
        Width_removeX = [Width_removeX ;  {fix_num((100-result) * width/100)} ]; 
        real_rowX = [real_rowX ; {fix_num((C-A)*rate)}];
        real_colX = [real_colX ; {fix_num((D-B)*rate)}];
        real_X = [ real_X ; {fix_num(width*power(rate,2))}];
        real_leftX = [real_leftX; {fix_num((result*width/100*power(rate,2)))}];
        real_removeX = [real_removeX; {fix_num(((100-result) * width/100*power(rate,2)))}];
    else 
        rowY = [rowY; {D-B}];
        colY = [colY; {C-A}];
        Temp_Y = [ Temp_Y ; {fix_num(result)}];
        Temp_Y2 = [Temp_Y2 ; {fix_num(100-result)}];
        Width_Y = [ Width_Y; {width}];
        Width_leftY = [Width_leftY ;  {fix_num((result) * width/100)} ]; 
        Width_removeY = [Width_removeY ;  {fix_num((100-result) * width/100)} ]; 
        real_rowY = [real_rowY ; {fix_num((D-B)*rate)}];
        real_colY = [real_colY ; {fix_num((C-A)*rate)}];
        real_Y = [ real_Y ; {fix_num(width*power(rate,2))}];
        real_leftY = [real_leftY; {fix_num(result*width/100*power(rate,2))}];
        real_removeY = [real_removeY; {fix_num((100-result) * width/100*power(rate,2))}];
    end
end
A_width = 0;
for i = 1 : row
    for j = 1 :col
        if(Origin_img( i, j ,1) == 255)
            A_width = A_width + 1;
        end
    end
end
B_width = 0;
for i = 1 : row
    for j = 1 :col
        if(Compare_img( i, j ,1) == 255)
            B_width = B_width + 1;
        end
    end
end
result = 100 - B_width/A_width * 100;
Temp1 = [rowX, colX,Width_X ,Temp_X ,Temp_X2 ,Width_leftX, Width_removeX,real_rowX,real_colX, real_X, real_leftX, real_removeX];
Temp2 = [rowY, colY,Width_Y, Temp_Y ,Temp_Y2 ,Width_leftY, Width_removeY ,real_rowY,real_colY, real_Y, real_leftY, real_removeY];
set(handles.text8, 'string', result);
set(handles.uitable1, 'Data', Temp1);
set(handles.uitable2, 'Data', Temp2);


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
GUI


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global Remove_X
global left_X
global Origin_img
row = eventdata.Indices(1);
Temp = left_X{1, row};
Temp2 = Remove_X{1,row};
axes(handles.axes4);
imshow(Origin_img);
mapping = rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2})...
    (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[1 0 0],'EdgeColor','r');
mapping2 = rectangle('Position',[Temp2{1,1}{1,2} Temp2{1,1}{1,1} (Temp2{1,3}{1,2}-Temp2{1,1}{1,2})...
    (Temp2{1,2}{1,1}-Temp2{1,1}{1,1})], 'FaceColor',[0 1 0],'EdgeColor','g');
imshow(mapping)
imshow(mapping2)


% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global Remove_Y
global left_Y
global Origin_img
row = eventdata.Indices(1);
Temp = left_Y{1, row};
if(Remove_Y ~= 0)
    Temp2 = Remove_Y{1,row};
end
axes(handles.axes4);
imshow(Origin_img);
mapping = rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2})...
    (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[1 0 0],'EdgeColor','r');
if(Temp2 ~= 0)
mapping2 = rectangle('Position',[Temp2{1,1}{1,2} Temp2{1,1}{1,1} (Temp2{1,3}{1,2}-Temp2{1,1}{1,2})...
    (Temp2{1,2}{1,1}-Temp2{1,1}{1,1})], 'FaceColor',[0 1 0],'EdgeColor','g');
imshow(mapping2)
end
imshow(mapping)



% --- Executes when selected cell(s) is changed in uitable3.
function uitable3_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global Remove_X
global left_X
global Origin_img
row = eventdata.Indices(1);
Temp = left_X{1, row};
Temp2 = Remove_X{1,row};
axes(handles.axes4);
imshow(Origin_img);
mapping = rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2})...
    (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[0 1 0],'EdgeColor','g');
mapping2 = rectangle('Position',[Temp2{1,1}{1,2} Temp2{1,1}{1,1} (Temp2{1,3}{1,2}-Temp2{1,1}{1,2})...
    (Temp2{1,2}{1,1}-Temp2{1,1}{1,1})], 'FaceColor',[1 0 0],'EdgeColor','r');
imshow(mapping2)
imshow(mapping)

% --- Executes when selected cell(s) is changed in uitable4.
function uitable4_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global Remove_Y
global left_Y
global Origin_img
row = eventdata.Indices(1);
Temp = left_Y{1, row};
if(Remove_Y ~= 0)
    Temp2 = Remove_Y{1,row};
end
axes(handles.axes4);
imshow(Origin_img);
mapping = rectangle('Position',[Temp{1,1}{1,2} Temp{1,1}{1,1} (Temp{1,3}{1,2}-Temp{1,1}{1,2})...
    (Temp{1,2}{1,1}-Temp{1,1}{1,1})], 'FaceColor',[0 1 0],'EdgeColor','g');
if(Temp2 ~= 0)
mapping2 = rectangle('Position',[Temp2{1,1}{1,2} Temp2{1,1}{1,1} (Temp2{1,3}{1,2}-Temp2{1,1}{1,2})...
    (Temp2{1,2}{1,1}-Temp2{1,1}{1,1})], 'FaceColor',[0 1 0],'EdgeColor','g');
imshow(mapping2)
end
imshow(mapping)



function F1_Callback(hObject, eventdata, handles)
% hObject    handle to F1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F1 as text
%        str2double(get(hObject,'String')) returns contents of F1 as a double


% --- Executes during object creation, after setting all properties.
function F1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global percentage
percentage = str2double(get(handles.F1,'String'));

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
