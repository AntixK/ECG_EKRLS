function varargout = ECG_RLS(varargin)
% ECG_RLS MATLAB code for ECG_RLS.fig
%      ECG_RLS, by itself, creates a new ECG_RLS or raises the existing
%      singleton*.
%
%      H = ECG_RLS returns the handle to a new ECG_RLS or the handle to
%      the existing singleton*.
%
%      ECG_RLS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECG_RLS.M with the given input arguments.
%
%      ECG_RLS('Property','Value',...) creates a new ECG_RLS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the ECG_RLS before ECG_RLS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ECG_RLS_OpeningFcn via varargin.
%
%      *See ECG_RLS Options on GUIDE's Tools menu.  Choose "ECG_RLS allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ECG_RLS

% Last Modified by GUIDE v2.5 21-Jan-2016 22:22:38

% Begin initialization code - DO NOT EDIT



% Global Variables
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ECG_RLS_OpeningFcn, ...
                   'gui_OutputFcn',  @ECG_RLS_OutputFcn, ...
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


% --- Executes just before ECG_RLS is made visible.
function ECG_RLS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ECG_RLS (see VARARGIN)

% Choose default command line output for ECG_RLS
handles.output = hObject;
% Display Block Diagram Image
guidata(hObject, handles);
axes(handles.image_axes)
matlabImage = imread('block diagram.jpg');
image(matlabImage)
axis off
axis image

% UIWAIT makes ECG_RLS wait for user response (see UIRESUME)
% uiwait(handles.main_gui);


% --- Outputs from this function are returned to the command line.
function varargout = ECG_RLS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PLI.
function PLI_Callback(hObject, eventdata, handles)
% hObject    handle to PLI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PLI_flag = get(hObject,'Value');
assignin('base','PLI_flag',logical(PLI_flag));
% Hint: get(hObject,'Value') returns toggle state of PLI


% --- Executes on button press in WN.
function WN_Callback(hObject, eventdata, handles)
% hObject    handle to WN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
WN_flag = get(hObject,'Value');
assignin('base','WN_flag',logical(WN_flag));
% Hint: get(hObject,'Value') returns toggle state of WN


% --- Executes on button press in BWN.
function BWN_Callback(hObject, eventdata, handles)
% hObject    handle to BWN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BWN_flag = get(hObject,'Value');
assignin('base','BWN_flag',logical(BWN_flag));
% Hint: get(hObject,'Value') returns toggle state of BWN


% --- Executes on button press in EMN.
function EMN_Callback(hObject, eventdata, handles)
% hObject    handle to EMN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EMN_flag = get(hObject,'Value');
assignin('base','EMN_flag',logical(EMN_flag));
% Hint: get(hObject,'Value') returns toggle state of EMN


% --- Executes on button press in MAN.
function MAN_Callback(hObject, eventdata, handles)
% hObject    handle to MAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MAN_flag = get(hObject,'Value');
assignin('base','MAN_flag',logical(MAN_flag));
% Hint: get(hObject,'Value') returns toggle state of MAN

% --- Executes on button press in rls.
function rls_Callback(hObject, eventdata, handles)
% hObject    handle to rls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RLS_flag = get(hObject,'Value');
assignin('base','RLS_flag',logical(RLS_flag));
% Hint: get(hObject,'Value') returns toggle state of rls

% --- Executes on button press in lms.
function lms_Callback(hObject, eventdata, handles)
% hObject    handle to lms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LMS_flag = get(hObject,'Value');
assignin('base','LMS_flag',logical(LMS_flag));
% Hint: get(hObject,'Value') returns toggle state of lms

% --- Executes on selection change in db_wn.
function db_wn_Callback(hObject, eventdata, handles)
% hObject    handle to db_wn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns db_wn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from db_wn


% --- Executes during object creation, after setting all properties.
function db_wn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to db_wn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in db_pli.
function db_pli_Callback(hObject, eventdata, handles)
% hObject    handle to db_pli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns db_pli contents as cell array
%        contents{get(hObject,'Value')} returns selected item from db_pli


% --- Executes during object creation, after setting all properties.
function db_pli_CreateFcn(hObject, eventdata, handles)
% hObject    handle to db_pli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in db_bwn.
function db_bwn_Callback(hObject, eventdata, handles)
% hObject    handle to db_bwn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns db_bwn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from db_bwn


% --- Executes during object creation, after setting all properties.
function db_bwn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to db_bwn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in db_emn.
function db_emn_Callback(hObject, eventdata, handles)
% hObject    handle to db_emn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns db_emn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from db_emn


% --- Executes during object creation, after setting all properties.
function db_emn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to db_emn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in db_man.
function db_man_Callback(hObject, eventdata, handles)
% hObject    handle to db_man (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns db_man contents as cell array
%        contents{get(hObject,'Value')} returns selected item from db_man


% --- Executes during object creation, after setting all properties.
function db_man_CreateFcn(hObject, eventdata, handles)
% hObject    handle to db_man (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ReadMe.
function ReadMe_Callback(hObject, eventdata, handles)
% hObject    handle to ReadMe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('Docs\READ_ME.pdf');

% --- Executes on button press in Spectrogram.
function Spectrogram_Callback(hObject, eventdata, handles)
% hObject    handle to Spectrogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SPEC_flag = get(hObject,'Value');
assignin('base','SPEC_flag',logical(SPEC_flag));
% Hint: get(hObject,'Value') returns toggle state of Spectrogram


% --- Executes on button press in PSD.
function PSD_Callback(hObject, eventdata, handles)
% hObject    handle to PSD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PSD_flag = get(hObject,'Value');
assignin('base','PSD_flag',logical(PSD_flag));
% Hint: get(hObject,'Value') returns toggle state of PSD


% --- Executes on button press in error_mag.
function error_mag_Callback(hObject, eventdata, handles)
% hObject    handle to error_mag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EM_flag = get(hObject,'Value');
assignin('base','EM_flag',logical(EM_flag));
% Hint: get(hObject,'Value') returns toggle state of error_mag


% --- Executes on button press in snr_exp.
function snr_exp_Callback(hObject, eventdata, handles)
% hObject    handle to snr_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SNR_flag = get(hObject,'Value');
assignin('base','SNR_flag',logical(SNR_flag));
% Hint: get(hObject,'Value') returns toggle state of snr_exp


% --- Executes on button press in prd_exp.
function prd_exp_Callback(hObject, eventdata, handles)
% hObject    handle to prd_exp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PRD_flag = get(hObject,'Value');
assignin('base','PRD_flag',logical(PRD_flag));
% Hint: get(hObject,'Value') returns toggle state of prd_exp


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status_string, 'String', 'Running');
pause(1);
tic
run('run_');
t = toc;
set(handles.time_disp,'String',strcat('Elapsed time :    ',num2str(t),' s'));
set(handles.status_string, 'String', 'Ready to Run!!');


% --- Executes on button press in open_paper.
function open_paper_Callback(hObject, eventdata, handles)
% hObject    handle to open_paper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    winopen('Docs\A study of Recursive Least Squares (RLS) adaptive.pdf');

% --- Executes on button press in publish.
function publish_Callback(hObject, eventdata, handles)
% hObject    handle to publish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PUB_flag = get(hObject,'Value');
assignin('base','PUB_flag',logical(PUB_flag));
% Hint: get(hObject,'Value') returns toggle state of publish


% --- Executes on selection change in Data.
function Data_Callback(hObject, eventdata, handles)
% hObject    handle to Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
str = contents{get(hObject,'Value')};

data1 = strcmpi(str, 'Data - I');
data2 = strcmpi(str, 'Data - II');
data3 = strcmpi(str, 'Data - III');
assignin('base','data1',data1);
assignin('base','data2',data2);
assignin('base','data3',data3);
% Hints: contents = cellstr(get(hObject,'String')) returns Data contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Data


% --- Executes during object creation, after setting all properties.
function Data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_fig.
function save_fig_Callback(hObject, eventdata, handles)
% hObject    handle to save_fig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SAV_flag = get(hObject,'Value');
assignin('base','SAV_flag',logical(SAV_flag));
% Hint: get(hObject,'Value') returns toggle state of save_fig


% --- Executes on button press in EKRLS.
function exrls_Callback(hObject, eventdata, handles)
% hObject    handle to exrls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EKRLS_flag = get(hObject,'Value');
assignin('base','EKRLS_flag',logical(EKRLS_flag));
% Hint: get(hObject,'Value') returns to_ggle state of exrls
