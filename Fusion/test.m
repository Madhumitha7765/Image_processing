function varargout = test(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 14-Mar-2021 21:38:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in uploadimage.
function uploadimage_Callback(hObject, eventdata, handles)
% hObject    handle to uploadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%a=uigetfile('fusedimage.jpg')
a=imread('fusedimage.jpg');
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)




% --- Executes on button press in rgb2gray.
function rgb2gray_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
agray=rgb2gray(a);
axes(handles.axes1);
imshow(agray);

% --- Executes on button press in binaryimage.
function binaryimage_Callback(hObject, eventdata, handles)
% hObject    handle to binaryimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
abw=im2bw(a);
axes(handles.axes1);
imshow(abw);






% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
axes(handles.axes1);
imshow(a);




% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ahist=a;
ahist=rgb2gray(ahist);
axes(handles.axes1);
imhist(ahist);

% --- Executes on button press in complementimage.
function complementimage_Callback(hObject, eventdata, handles)
% hObject    handle to complementimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
acomp=a;
acomp=imcomplement(acomp);
axes(handles.axes1);
imshow(acomp);



% --- Executes on button press in clockwise.
function clockwise_Callback(hObject, eventdata, handles)
% hObject    handle to clockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aclock=a;
aclock=imrotate(aclock,270);
axes(handles.axes1);
imshow(aclock);

% --- Executes on button press in anticlockwise.
function anticlockwise_Callback(hObject, eventdata, handles)
% hObject    handle to anticlockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aclock=a;
aclock=imrotate(aclock,90);
axes(handles.axes1);
imshow(aclock);



% --- Executes on button press in edge.
function edge_Callback(hObject, eventdata, handles)
% hObject    handle to edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
 aedge=a;

input_image = aedge;    

input_image = rgb2gray(input_image);  

input_image = double(input_image);   

filtered_image = zeros(size(input_image)); 
  
% Sobel Operator Mask 
Mx = [-1 0 1; -2 0 2; -1 0 1]; 
My = [-1 -2 -1; 0 0 0; 1 2 1]; 

for i = 1:size(input_image, 1) - 2 
    for j = 1:size(input_image, 2) - 2 
  
        % Gradient approximations 
        Gx = sum(sum(Mx.*input_image(i:i+2, j:j+2))); 
        Gy = sum(sum(My.*input_image(i:i+2, j:j+2))); 
                 
        % Calculate magnitude of vector 
        filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2); 
         
    end
end
  
thresholdValue = 100; % varies between [0 255] 
output_image = max(filtered_image, thresholdValue); 
output_image(output_image == round(thresholdValue)) = 0; 
  
% Displaying Output Image 
output_image = im2bw(output_image); 
imshow(output_image); 








