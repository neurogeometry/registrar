function varargout = NCT_Registration(varargin)
% NCT_REGISTRATION MATLAB code for NCT_Registration.fig
%      NCT_REGISTRATION, by itself, creates a new NCT_REGISTRATION or raises the existing
%      singleton*.
%
%      H = NCT_REGISTRATION returns the handle to a new NCT_REGISTRATION or the handle to
%      the existing singleton*.
%
%      NCT_REGISTRATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NCT_REGISTRATION.M with the given input arguments.
%
%      NCT_REGISTRATION('Property','Value',...) creates a new NCT_REGISTRATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NCT_Registration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NCT_Registration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NCT_Registration

% Last Modified by GUIDE v2.5 20-Apr-2018 10:52:21

% Begin initialization code - DO NOT EDIT
clc;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @NCT_Registration_OpeningFcn, ...
    'gui_OutputFcn',  @NCT_Registration_OutputFcn, ...
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


% --- Executes just before NCT_Registration is made visible.
function NCT_Registration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NCT_Registration (see VARARGIN)
% jFrame=get(handles.figure1,'javaframe');
% jicon=javax.swing.ImageIcon('icon.png');
% jFrame.setFigureIcon(jicon);
%web('mailto:your.mail@address.org');
handles.output = hObject; 
guidata(hObject, handles);
% Choose default command line output for NCT_Registration
handles.output = hObject;
myCluster = parcluster('local');
MaxNumWorkers = myCluster.NumWorkers;
set(handles.text28,'Enable','off');
set(handles.text28, 'String', ['Max: ',num2str(MaxNumWorkers)]);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NCT_Registration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NCT_Registration_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

% Features_Dist_Mesh = get(handles.edit3,'String');
% Mesh = str2double(Features_Dist_Mesh);

% Pad = get(handles.edit5,'String');
% Pad = str2double(Pad);

% FE_th_k = get(handles.edit13,'String');
% k = str2double(FE_th_k);

set(handles.radio_before,'Enable','off');
set(handles.radio_after,'Enable','off');
set(handles.z_projection,'Enable','off');
set(handles.radio_layerview,'Enable','off');
set(handles.checkbox10,'Enable','off');

TransformationValue = get(handles.popupmenu3,'Value');%1=Smooth3 2=3D Gaussian lowpass 3=Imboxfilt3 4=Multi-scaleGaussian

Seq_Par = get(handles.popupmenu4,'Value');
Par_workers = str2double(get(handles.edit14,'String'));
blendingSID = str2double(get(handles.edit15,'String'));
StackList_csv_pth = get(handles.edt_stacklist,'String');
addpath('Functions');
parameters;
registeration (StackList_csv_pth,TransformationValue,Seq_Par,Par_workers,blendingSID,handles)



% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edt_stacklist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_stacklist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.csv', 'Pick a Stack List CSV file');
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    disp(['User selected ', fullfile(pathname, filename)])
    set(handles.edt_stacklist, 'String', fullfile(pathname, filename));
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.csv', 'Pick a Stack Positions CSV file');
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    disp(['User selected ', fullfile(pathname, filename)])
    set(handles.edit9, 'String', fullfile(pathname, filename));
    StackPositions_pixels = xlsread(fullfile(pathname, filename));
    set(handles.listbox3, 'String', num2str(StackPositions_pixels));
end
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.csv', 'Pick a Stack Overlap CSV file');
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    disp(['User selected ', fullfile(pathname, filename)])
    set(handles.edit10, 'String', fullfile(pathname, filename));
end
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.csv', 'Pick a Stack Sizes CSV file');
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    disp(['User selected ', fullfile(pathname, filename)])
    set(handles.edit11, 'String', fullfile(pathname, filename));
end
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
winopen('data/StackPositions_Registered.csv');
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
winopen('data/StackPositions_Registered.csv');
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --------------------------------------------------------------------
function docmnu_Callback(hObject, eventdata, handles)
docurl = 'http://neurogeometry.com/';
web(docurl);



% --------------------------------------------------------------------
function websitemnu_Callback(hObject, eventdata, handles)
docurl = 'http://neurogeometry.com/';
web(docurl);

% --- Executes on selection change in v.
function v_Callback(hObject, eventdata, handles)
val = get(handles.v,'Value');

if val == 1 %MouseLight
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\MouseLight_StackList.csv');
elseif val == 2 % Diadem1,2
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\Neocortical1_StackList.csv');
elseif val == 3 % Diadem1,2
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\Neocortical2_StackList.csv');
elseif val == 4 % Neuromuscular
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\Neuromuscular_StackList_4Stacks.csv');
elseif val == 5 % Holtmaat
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\Holtmaat_StackList.csv');
elseif val == 6 % Visual
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\Visual_StackList.csv');
elseif val == 7 % TimeLapse
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\TimeLapse_Holtmaat_StackList.csv');
elseif val == 8 % TimeLapse
    set(handles.edt_stacklist,'String','../../MicroscopeFiles\slices2.csv');
elseif val == 9 % Other
    set(handles.edt_stacklist,'String','');
end


% --- Executes during object creation, after setting all properties.
function v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
val = get(handles.checkbox6,'Value');
if val == 0
    set(handles.edit15,'Enable','off');
    set(handles.text29,'Enable','off');
    set(handles.radio_before,'Enable','off');
    set(handles.radio_after,'Enable','off');
    set(handles.z_projection,'Enable','off');
    set(handles.radio_layerview,'Enable','off');
    set(handles.checkbox10,'Enable','off');
else
    set(handles.edit15,'Enable','on');
    set(handles.text29,'Enable','on');
    set(handles.radio_before,'Enable','on');
    set(handles.radio_after,'Enable','on');
    set(handles.z_projection,'Enable','on');
    set(handles.radio_layerview,'Enable','on');
    set(handles.checkbox10,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
val = get(handles.popupmenu4,'Value');
if val == 1
    set(handles.edit14,'Enable','off');
    set(handles.text27,'Enable','off');
    set(handles.text26,'Enable','off');
    set(handles.text28,'Enable','off');
else
    set(handles.edit14,'Enable','on');
    set(handles.text27,'Enable','on');
    set(handles.text26,'Enable','on');
    set(handles.text28,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
val = get(handles.checkbox8,'Value');
if val
    Tile3D1=evalin('base','Tile3D');
    volumeViewer(Tile3D1);
else
    volumeViewer close
end


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
hf = gca;
% if isempty(hf.UserData)
%     hf = findobj(NCT_Registration,'Tag', 'slider2');
%     Tile3D1=evalin('base','Tile3D');
%     plainsViewer(Tile3D1);
% end
disp(round(get(hObject,'Value')));
if round(get(hObject,'Value'))>0
    try
        hi=hf.UserData.h_im;
        if ~isempty(hi)
            hf.UserData.currplane = round(get(hObject,'Value'));
            hi.CData=hf.UserData.IM(:,:,hf.UserData.currplane);
            hf3 = findobj(hf.Parent,'-depth',1,'Tag', 'axes5');
            hf4 = findobj(hf.Parent,'-depth',1,'Tag', 'axes6');
            hi3=hf3.UserData.h_im;
            hi4=hf4.UserData.h_im;
            hi3.CData=squeeze(hf.UserData.IM(hf.UserData.currplane,:,:));
            hi4.CData=imrotate(squeeze(hf.UserData.IM(:,hf.UserData.currplane,:)),90);
            
            hf.Title.String=['Current plane: ',num2str(hf.UserData.currplane),' / ',num2str(size(hf.UserData.IM,3))];
            drawnow;
        end
    catch
        warndlg('Please click on the Image','!! Warning !!');
    end
end


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
val = get(handles.checkbox10,'Value');
if val
    Tile3D1=evalin('base','Tile3D');
    volumeViewer(Tile3D1);
else
    volumeViewer close
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton10,'userdata',1)

disp('Stop');
return


% --- Executes on key press with focus on pushbutton10 and none of its controls.
function pushbutton10_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton10,'userdata',1)
disp('Stop');
return

% --- Executes on button press in radio_after.
function radio_after_Callback(hObject, eventdata, handles)
val = get(handles.uibuttongroup3.SelectedObject,'Tag');
% z_projection
% radio_layerview
if strcmp(val,'z_projection')
    Tile3D_Registered=evalin('base','Tile3D');
    set(handles.slider2,'Visible','off');
    tb7 = findobj(NCT_Registration,'Tag', 'axes1');
    
    P_XLim = tb7.XLim;
    P_YLim = tb7.YLim;
    P_Position = tb7.Position;
    h_im=imshow(max(Tile3D_Registered,[],3),[0 max(Tile3D_Registered(:))],'Parent',tb7);
    
    
    tb7=h_im.Parent;
    tb7.Tag='axes1';
    tb7.Title.String= 'Z Projection';
    %     tb7.XLim = [0.5 size(h_im.CData,2)+0.5];
    %     tb7.YLim = [0.5 size(h_im.CData,1)+0.5];
    tb7.XLim = P_XLim;
    tb7.YLim = P_YLim;
    tb7.Position=  P_Position;
    
    hf3 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes5');
    hf4 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes6');
    hf3.YLabel.String='';hf3.XLabel.String='';
    hf4.YLabel.String='';hf4.XLabel.String='';
    cla(hf3);
    cla(hf4);
else
    Tile=evalin('base','Tile3D');
    set(handles.slider2,'Visible','on');
    set(handles.slider2,'Min',1,'Max',size(Tile,3),'Value', 1, 'SliderStep', [1/size(Tile,3) 1/size(Tile,3)]);
    %     set(handles.slider2,'Max',size(Tile3D1,3));
    %     set(handles.slider2,'SliderStep',1);
    plainsViewer(Tile);
end


% --- Executes on button press in radio_layerview.
function radio_layerview_Callback(hObject, eventdata, handles)
val = get(handles.uibuttongroup2.SelectedObject,'Tag');
if strcmp(val,'radio_after')
    Tile=evalin('base','Tile3D');
    set(handles.slider2,'Visible','on');
    set(handles.slider2,'Min',1,'Max',size(Tile,3),'Value', 1, 'SliderStep', [1/size(Tile,3) 1/size(Tile,3)]);
    %     set(handles.slider2,'Max',size(Tile3D1,3));
    %     set(handles.slider2,'SliderStep',1);
    plainsViewer(Tile);
else
    Tile=evalin('base','Tile3D_org');
    set(handles.slider2,'Visible','on');
    set(handles.slider2,'Min',1,'Max',size(Tile,3),'Value', 1, 'SliderStep', [1/size(Tile,3) 1/size(Tile,3)]);
    %     set(handles.slider2,'Max',size(Tile3D1,3));
    %     set(handles.slider2,'SliderStep',1);
    plainsViewer(Tile);
end


% --- Executes on button press in radio_before.
function radio_before_Callback(hObject, eventdata, handles)
val = get(handles.uibuttongroup3.SelectedObject,'Tag');
% z_projection
% radio_layerview
if strcmp(val,'z_projection')
    Tile3D_org=evalin('base','Tile3D_org');
    set(handles.slider2,'Visible','off');
    tb7 = findobj(NCT_Registration,'Tag', 'axes1');
    
    P_XLim = tb7.XLim;
    P_YLim = tb7.YLim;
    P_Position = tb7.Position;
    h_im=imshow(max(Tile3D_org,[],3),[0 max(Tile3D_org(:))],'Parent',tb7);
    
    
    tb7=h_im.Parent;
    tb7.Tag='axes1';
    tb7.Title.String= 'Z Projection';
    %     tb7.XLim = [0.5 size(h_im.CData,2)+0.5];
    %     tb7.YLim = [0.5 size(h_im.CData,1)+0.5];
    
    tb7.XLim = P_XLim;
    tb7.YLim = P_YLim;
    tb7.Position=  P_Position;
    
    hf3 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes5');
    hf4 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes6');
    hf3.YLabel.String='';hf3.XLabel.String='';
    hf4.YLabel.String='';hf4.XLabel.String='';
    cla(hf3);
    cla(hf4);
else
    Tile=evalin('base','Tile3D_org');
    set(handles.slider2,'Visible','on');
    set(handles.slider2,'Min',1,'Max',size(Tile,3),'Value', 1, 'SliderStep', [1/size(Tile,3) 1/size(Tile,3)]);
    %     set(handles.slider2,'Max',size(Tile3D1,3));
    %     set(handles.slider2,'SliderStep',1);
    plainsViewer(Tile);
end


% --- Executes on button press in z_projection.
function z_projection_Callback(hObject, eventdata, handles)
val = get(handles.uibuttongroup2.SelectedObject,'Tag');
if strcmp(val,'radio_after')
    Tile3D_Registered=evalin('base','Tile3D');
    set(handles.slider2,'Visible','off');
    tb7 = findobj(NCT_Registration,'Tag', 'axes1');
    
    P_XLim = tb7.XLim;
    P_YLim = tb7.YLim;
    P_Position = tb7.Position;
    h_im=imshow(max(Tile3D_Registered,[],3),[0 max(Tile3D_Registered(:))],'Parent',tb7);
    
    
    tb7=h_im.Parent;
    tb7.Tag='axes1';
    tb7.Title.String= 'Z Projection';
    %     tb7.XLim = [0.5 size(h_im.CData,2)+0.5];
    %     tb7.YLim = [0.5 size(h_im.CData,1)+0.5];
    tb7.XLim = P_XLim;
    tb7.YLim = P_YLim;
    tb7.Position=  P_Position;
    
    hf3 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes5');
    hf4 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes6');
    hf3.YLabel.String='';hf3.XLabel.String='';
    hf4.YLabel.String='';hf4.XLabel.String='';
    cla(hf3);
    cla(hf4);
else
    Tile3D_org=evalin('base','Tile3D_org');
    set(handles.slider2,'Visible','off');
    tb7 = findobj(NCT_Registration,'Tag', 'axes1');
    
    P_XLim = tb7.XLim;
    P_YLim = tb7.YLim;
    P_Position = tb7.Position;
    h_im=imshow(max(Tile3D_org,[],3),[0 max(Tile3D_org(:))],'Parent',tb7);
    
    
    tb7=h_im.Parent;
    tb7.Tag='axes1';
    tb7.Title.String= 'Z Projection';
    %     tb7.XLim = [0.5 size(h_im.CData,2)+0.5];
    %     tb7.YLim = [0.5 size(h_im.CData,1)+0.5];
    
    tb7.XLim = P_XLim;
    tb7.YLim = P_YLim;
    tb7.Position=  P_Position;
    
    hf3 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes5');
    hf4 = findobj(tb7.Parent,'-depth',1,'Tag', 'axes6');
    hf3.YLabel.String='';hf3.XLabel.String='';
    hf4.YLabel.String='';hf4.XLabel.String='';
    cla(hf3);
    cla(hf4);
end


% --- Executes on button press in chkdebug.
function chkdebug_Callback(hObject, eventdata, handles)
% hObject    handle to chkdebug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkdebug


% --- Executes on button press in chkretilling.
function chkretilling_Callback(hObject, eventdata, handles)
% hObject    handle to chkretilling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.chkretilling,'Value');
if val == 1
    set(handles.popupretilling,'Enable','on');
    set(handles.editTilesSize,'Enable','on');
    set(handles.txtretilling,'Enable','on');
    set(handles.txtoutput,'Enable','on');
else
    set(handles.popupretilling,'Enable','off');
    set(handles.editTilesSize,'Enable','off');
    set(handles.txtretilling,'Enable','off');
    set(handles.txtoutput,'Enable','off');
end
% Hint: get(hObject,'Value') returns toggle state of chkretilling


% --- Executes on selection change in popupretilling.
function popupretilling_Callback(hObject, eventdata, handles)
val = get(handles.popupretilling,'Value');
if val == 6 % CATMAID
    set(handles.editTilesSize,'String','256,256,100');
    set(handles.txtretilling,'Enable','off');
    set(handles.editTilesSize,'Enable','off');
elseif val == 3
    set(handles.editTilesSize,'String','400,400,100');
    set(handles.txtretilling,'Enable','on');
    set(handles.editTilesSize,'Enable','on');
elseif val == 1
    set(handles.editTilesSize,'String','200,200,100');
    set(handles.txtretilling,'Enable','on');
    set(handles.editTilesSize,'Enable','on');
else
    set(handles.editTilesSize,'String','1024,1536,251');
    set(handles.txtretilling,'Enable','on');
    set(handles.editTilesSize,'Enable','on');
    
end


% --- Executes during object creation, after setting all properties.
function popupretilling_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupretilling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function parameters_mnu_Callback(hObject, eventdata, handles)
% !notepad Functions\parameters.m
open('Functions\parameters.m');


% --------------------------------------------------------------------
function website_mnu_Callback(hObject, eventdata, handles)
web('http://www.northeastern.edu/neurogeometry/');


% --------------------------------------------------------------------
function manual_mnu_Callback(hObject, eventdata, handles)
open('UserManual.docx');



function editTilesSize_Callback(hObject, eventdata, handles)
% hObject    handle to editTilesSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTilesSize as text
%        str2double(get(hObject,'String')) returns contents of editTilesSize as a double


% --- Executes during object creation, after setting all properties.
function editTilesSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTilesSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
