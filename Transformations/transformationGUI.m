function varargout = transformationGUI(varargin)
%TRANSFORMATIONGUI MATLAB code file for transformationGUI.fig
%      TRANSFORMATIONGUI, by itself, creates a new TRANSFORMATIONGUI or raises the existing
%      singleton*.
%
%      H = TRANSFORMATIONGUI returns the handle to a new TRANSFORMATIONGUI or the handle to
%      the existing singleton*.
%
%      TRANSFORMATIONGUI('Property','Value',...) creates a new TRANSFORMATIONGUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to transformationGUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TRANSFORMATIONGUI('CALLBACK') and TRANSFORMATIONGUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TRANSFORMATIONGUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transformationGUI

% Last Modified by GUIDE v2.5 03-Apr-2019 20:28:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transformationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @transformationGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before transformationGUI is made visible.
function transformationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Plot the cube.
    handles.xyz = [0, 0, 0];
    plot3(handles.xyz(1), handles.xyz(2), handles.xyz(3)); 
    hold on 
    handles.lengthEdge = 4; 
    d = handles.lengthEdge/2; 
    XeYeZe = [0, 0, 0];
    handles.vertices(:,1,:)=[XeYeZe(1)-d; XeYeZe(1)+d; XeYeZe(1)+d; XeYeZe(1)-d; XeYeZe(1)-d; XeYeZe(1)+d; XeYeZe(1)+d; XeYeZe(1)-d]; 
    handles.vertices(:,2,:)=[XeYeZe(2)-d; XeYeZe(2)-d; XeYeZe(2)+d; XeYeZe(2)+d; XeYeZe(2)-d ;XeYeZe(2)-d; XeYeZe(2)+d; XeYeZe(2)+d]; 
    handles.vertices(:,3,:)=[XeYeZe(3)-d; XeYeZe(3)-d; XeYeZe(3)-d; XeYeZe(3)-d; XeYeZe(3)+d; XeYeZe(3)+d; XeYeZe(3)+d; XeYeZe(3)+d]; 
    handles.faces = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8]; 
    patch('Vertices',handles.vertices,'Faces',handles.faces,'FaceAlpha',0.5,'FaceColor', ...
        'flat','FaceVertexCData',hsv(6))
    axis([-5, 5, -5, 5, -5, 5]) 
    xlabel('X-Axis') 
    ylabel('Y-Axis') 
    zlabel('Z-Axis') 
    grid on 
    hold off
    
    set(handles.textfeldTransformation,'string', 'Please choose the transformation from the drop down menu.')

% Choose default command line output for transformationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center')

% UIWAIT makes transformationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transformationGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
    contents = cellstr(get(hObject,'String'));
    str = contents{get(hObject,'Value')};
    disp(str)
    if strcmp('RotationXYZ', str) == 1
            set(handles.info,'string','Please enter an angle for the rotation.');
            param = get(handles.textfeld, 'String')
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                set(handles.info,'string','Please enter an angle for the rotation.');
                %rotationCube(str2double(param));
            end
    elseif strcmp('RotationX', str) == 1
            set(handles.info,'string','Please enter an angle for the rotation.');
            param = get(handles.textfeld, 'String')
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                set(handles.info,'string','Please enter an angle for the rotation.');
                %rotationCubeX(str2double(param));
            end
    elseif strcmp('RotationY', str) == 1
            set(handles.info,'string','Please enter an angle for the rotation.');
            param = get(handles.textfeld, 'String')
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                set(handles.info,'string','Please enter an angle for the rotation.');
                %rotationCubeY(str2double(param));
            end
    elseif strcmp('RotationZ', str) == 1
            set(handles.info,'string','Please enter an angle for the rotation.');
            param = get(handles.textfeld, 'String')
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                set(handles.info,'string','Please enter an angle for the rotation.');
                %rotationCubeZ(str2double(param));
            end
    elseif strcmp('Skalierung', str) == 1
            set(handles.info,'string','Please enter a scaling factor between 0.1 and 2.5.');
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter a scaling factor between 0.1 and 2.5.');
            else 
                set(handles.info,'string','Please enter a scaling factor between 0.1 and 2.5.');
                %skalierungCube(str2double(param));
                %set(handles.info,'string','');
            end
    elseif strcmp('Translation', str) == 1
                set(handles.info,'string','Please enter a translation vector of notation 1 1 1 between 0 and 3.');
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter a translation vector of notation 1 1 1 between 0 and 3.');
            else 
                set(handles.info,'string','Please enter a translation vector of notation 1 1 1 between 0 and 3.');
                %translationCube(str2double(param));
                %set(handles.info,'string','');
            end
    end
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    


end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    contents = cellstr(get(handles.popupmenu1 ,'String'));
    str = contents{get(handles.popupmenu1,'Value')};
    disp(str)
    if strcmp('RotationXYZ', str) == 1
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                rotationCube(str2double(param));
            end
    elseif strcmp('RotationX', str) == 1
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                rotationCubeX(str2double(param));
            end
    elseif strcmp('RotationY', str) == 1
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                rotationCubeY(str2double(param));
            end
    elseif strcmp('RotationZ', str) == 1
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter an angle for the rotation.');
            else 
                rotationCubeZ(str2double(param));
            end
    elseif strcmp('Skalierung', str) == 1
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter a scaling factor between 0.1 and 2.5.');
            else 
                skalierungCube(str2double(param));
            end
    elseif strcmp('Translation', str) == 1            
            param = get(handles.textfeld, 'String');
            if isempty(param)
                set(handles.info,'string','Please enter a translation vector of notation 1 1 1 between 0 and 3.');
            else 
                    tokenizedParam = strsplit(param, ' ');
                    paramLength = size(tokenizedParam);
                if (paramLength(2) == 3)
                    translatVector = [str2double(tokenizedParam(1)) str2double(tokenizedParam(2)) str2double(tokenizedParam(3))];
                    translationCube(translatVector);
                else
                    set(handles.info,'string',"Please enter a vector of" +newline+" notation 1 1 1.");
                end
            end
    end


function textfeld_Callback(hObject, eventdata, handles)
% hObject    handle to textfeld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textfeld as text
%        str2double(get(hObject,'String')) returns contents of textfeld as a double
   


% --- Executes during object creation, after setting all properties.
function textfeld_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textfeld (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function textfeldTransformation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textfeldTransformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
                
                
                
