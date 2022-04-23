
function varargout = Stroke_GUI(varargin)
% STROKE_GUI MATLAB code for Stroke_GUI.fig
%      STROKE_GUI, by itself, creates a new STROKE_GUI or raises the existing
%      singleton*.
%
%      H = STROKE_GUI returns the handle to a new STROKE_GUI or the handle to
%      the existing singleton*.
%
%      STROKE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STROKE_GUI.M with the given input arguments.
%
%      STROKE_GUI('Property','Value',...) creates a new STROKE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Stroke_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Stroke_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Stroke_GUI

% Last Modified by GUIDE v2.5 05-Jul-2017 00:10:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Stroke_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Stroke_GUI_OutputFcn, ...
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
end


% --- Executes just before Stroke_GUI is made visible.
function Stroke_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Stroke_GUI (see VARARGIN)

% Choose default command line output for Stroke_GUI
%handles.output = hObject;
%guidata (hObject, handles);
%handles = RoboTrainer(handles);
%handles = TimePosition(handles);
ss = ones(512,512);
axes(handles.axes1);
imshow(ss);
axes(handles.axes2);
imshow(ss);
axes(handles.axes3);
imshow(ss);
axes(handles.axes4);
imshow(ss);
axes(handles.axes5);
imshow(ss);
axes(handles.axes6);
imshow(ss);
axes(handles.axes7);
imshow(ss);
axes(handles.axes8);
imshow(ss);
axes(handles.axes9);
imshow(ss);
axes(handles.axes10);
imshow(ss);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Stroke_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = Stroke_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;
%(br lx % htae ll pyn check yan)
end


% --- Executes on button press in DWI_pushbutton1.
function DWI_pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to DWI_pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp','Stroke');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    P = imread([PathName,FileName]);
    P = imresize(P,[512,512]);
    %imshow(P,'parent',handles.axes1);
    axes(handles.axes1)
    imshow(P);title('DWI Image');
    % helpdlg(' Multispectral Image is Selected ');

 % set(handles.edit1,'string',Filename);
 % set(handles.edit2,'string',Pathname);
  handles.ImgData = P;
%  handles.FileName = FileName;

  guidata(hObject,handles);
end
end

% --- Executes on button press in SegDWI_pushbutton2.
function SegDWI_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to SegDWI_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ImgData')
    %if isfield(handles,'imgData')
    I = handles.ImgData;
Ig = rgb2gray(I);
I2 = imresize(Ig,[512 512]);
I4 = imcrop(I2,[85 50 350 430]);
I3 = medfilt2(I4);
%figure;imshow(I3);
        k = double(max(I3(:)));
        T = double((k/2+30)./255);
        img = im2bw(I3,T);
axes(handles.axes2)
imshow(img);title('Segmented Image');
end
end

% --- Executes on button press in DADC_pushbutton3.
function DADC_pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to DADC_pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp','stroke');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    P1 = imread([PathName,FileName]);
    P1 = imresize(P1,[512,512]);
    axes(handles.axes3)
    imshow(P1);title('DADC Image');
    % helpdlg(' Multispectral Image is Selected ');

 % set(handles.edit1,'string',Filename);
 % set(handles.edit2,'string',Pathname);
  handles.ImgData1 = P1;
%  handles.FileName = FileName;
  guidata(hObject,handles);
end
end

% --- Executes on button press in SegDADC_pushbutton4.
function SegDADC_pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to SegDADC_pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ImgData1')
    %if isfield(handles,'imgData')
    I1 = handles.ImgData1;
Ig1 = rgb2gray(I1);
I21 = imresize(Ig1,[512 512]);
I41 = imcrop(I21,[85 50 350 430]);
I31 = medfilt2(I41);
%figure;imshow(I3);
I = handles.ImgData;
Ig = rgb2gray(I);
I2 = imresize(Ig,[512 512]);
I4 = imcrop(I2,[85 50 350 430]);
I3 = medfilt2(I4);
%figure;imshow(I3);
        k = double(max(I3(:)));
        T = double((k/2+30)./255);
        img = im2bw(I3,T);
        [m,n] = size(img);
h = 0;
for i = 1:m
    for j = 1:n
      if img(i,j)== 1
          h = h+1;
          r(h)= i;
          c(h)= j;
    end
    end
end
        k1 = double(max(I31(r(h),c(h))));
        T1 = double(k1/255);
        img1 = im2bw(I31,T1);
img11 = imcomplement(img1);
axes(handles.axes4)
imshow(img11);title('Segmented Image');
%imshow(tumor);title('Segmented Image');
end
end

% --- Executes on button press in FLAIR_pushbutton5.
function FLAIR_pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to FLAIR_pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp','stroke');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    P2 = imread([PathName,FileName]);
    P2 = imresize(P2,[512,512]);
    axes(handles.axes5)
    imshow(P2);title('FLAIR Image');
    % helpdlg(' Multispectral Image is Selected ');

 % set(handles.edit1,'string',Filename);
 % set(handles.edit,'string',Pathname);
  handles.ImgData2 = P2;
%  handles.FileName = FileName;
  guidata(hObject,handles);
end
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ImgData2')
    %if isfield(handles,'imgData')
    I2 = handles.ImgData2;
Ig2 = rgb2gray(I2);
I22 = imresize(Ig2,[512 512]);
I42 = imcrop(I22,[85 50 350 430]);
I32 = medfilt2(I42);

I = handles.ImgData;
Ig = rgb2gray(I);
I2 = imresize(Ig,[512 512]);
I4 = imcrop(I2,[85 50 350 430]);
I3 = medfilt2(I4);
%figure;imshow(I3);
        k = double(max(I3(:)));
        T = double((k/2+30)./255);
        img = im2bw(I3,T);
        [m,n] = size(img);
h = 0;
for i = 1:m
    for j = 1:n
      if img(i,j)== 1
          h = h+1;
          r(h)= i;
          c(h)= j;
    end
    end
end

k2 = double(max(I32(r(h),c(h))));
        if (240<=k2) && (k2<=255)
            T2 = double((k2*3/4)./255);
        else if (200<=k2) && (k2<=239)
               T2 = double((k2*3/4+25)./255);
            else if (180<=k2) && (k2<=199)
                T2 = double(k2/255);
                else
                 T2 = double((k2+30)./255);
                end
            end
        end
        img2a = im2bw(I32,T2);
         se1=strel('diamond',6);
        img2= imdilate(img2a,se1);
        
axes(handles.axes6)
imshow(img2a);title('Segmented Image');
end
end


% --- Executes on button press in T2W_pushbutton7.
function T2W_pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to T2W_pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp','stroke');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    P3 = imread([PathName,FileName]);
    P3 = imresize(P3,[512,512]);
    axes(handles.axes7)
    imshow(P3);title('T2 Image');
    % helpdlg(' Multispectral Image is Selected ');

 % set(handles.edit1,'string',Filename);
 % set(handles.edit,'string',Pathname);
  handles.ImgData3 = P3;
%  handles.FileName = FileName;
  guidata(hObject,handles);
end
end

% --- Executes on button press in SegT2W_pushbutton8.
function SegT2W_pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to SegT2W_pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ImgData3')
    %if isfield(handles,'imgData')
    I3 = handles.ImgData3;
Ig3 = rgb2gray(I3);
I23 = imresize(Ig3,[512 512]);
I43 = imcrop(I23,[85 50 350 430]);
I33 = medfilt2(I43);
      img3a = im2bw(I33,.26);
        se1=strel('diamond',6);
       img3= imdilate(img3a,se1);
        
axes(handles.axes8)
imshow(img3a);title('Segmented Image');
end
end

% --- Executes on button press in T1W_pushbutton9.
function T1W_pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to T1W_pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg;*.png;*.bmp','stroke');
if isequal(FileName,0)||isequal(PathName,0)
    warndlg('User Press Cancel');
else
    P4 = imread([PathName,FileName]);
    P4 = imresize(P4,[512,512]);
    axes(handles.axes9)
    imshow(P4);title('T1 Image');
    % helpdlg(' Multispectral Image is Selected ');

 % set(handles.edit1,'string',Filename);
 % set(handles.edit,'string',Pathname);
  handles.ImgData4 = P4;
%  handles.FileName = FileName;
  guidata(hObject,handles);
end
end

% --- Executes on button press in SegT1W_pushbutton10.
function SegT1W_pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to SegT1W_pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ImgData4')
    %if isfield(handles,'imgData')
    I4 = handles.ImgData4;
Ig4 = rgb2gray(I4);
I24 = imresize(Ig4,[512 512]);
I44 = imcrop(I24,[85 50 350 430]);
I34 = medfilt2(I44);
     % img4 = im2bw(I34,.26);
       %  se1=strel('diamond',6);
      %  img2= imdilate(img2a,se1);
      Imax = double(max(I34(:)));
        
axes(handles.axes10)
imshow(I34);title('Segmented Image');
end
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end


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
end


% --- Executes on button press in Result_pushbutton11.
function Result_pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to Result_pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

        
I = handles.ImgData;
Ig = rgb2gray(I);
I2 = imresize(Ig,[512 512]);
I4 = imcrop(I2,[85 50 350 430]);
I3 = medfilt2(I4);
        k = double(max(I3(:)));
        T = double((k/2+30)./255);
        img = im2bw(I3,T);
        [m,n] = size(img);
h = 0;
for i = 1:m
    for j = 1:n
      if img(i,j)== 1
          h = h+1;
          r(h)= i;
          c(h)= j;
    end
    end
end

I1 = handles.ImgData1;
Ig1 = rgb2gray(I1);
I21 = imresize(Ig1,[512 512]);
I41 = imcrop(I21,[85 50 350 430]);
I31 = medfilt2(I41);
        k1 = double(max(I31(r(h),c(h))));
        T1 = double(k1/255);
        img1 = im2bw(I31,T1);
img11 = imcomplement(img1);
axes(handles.axes4)
imshow(img11);title('Segmented Image');

I2 = handles.ImgData2;
Ig2 = rgb2gray(I2);
I22 = imresize(Ig2,[512 512]);
I42 = imcrop(I22,[85 50 350 430]);
I32 = medfilt2(I42);
K = double(max(I32(r(h),c(h))));
        if (240<=K) && (K<=255)
            T2 = double((K*3/4)./255);
        else if (200<=K) && (K<=239)
               T2 = double((K*3/4+25)./255);
            else if (180<=K) && (K<=199)
                T2 = double(K/255);
                else
                 T2 = double((K+30)./255);
                end
            end
        end
        img2a = im2bw(I32,T2);
         se1=strel('diamond',6);
        img2= imdilate(img2a,se1);
        
        
I3 = handles.ImgData3;
Ig3 = rgb2gray(I3);
I23 = imresize(Ig3,[512 512]);
I43 = imcrop(I23,[85 50 350 430]);
I33 = medfilt2(I43);
      img3a = im2bw(I33,.26);
        se1=strel('diamond',6);
        img3= imdilate(img3a,se1);
        

I4 = handles.ImgData4;
Ig4 = rgb2gray(I4);
I24 = imresize(Ig4,[512 512]);
I44 = imcrop(I24,[85 50 350 430]);
I34 = medfilt2(I44);
      %img4 = im2bw(I34,.26);
      Imax = double(max(I34(:)));
      I4 = double(I34(r(h),c(h)));
%A= get(handles.img,'string');
%A11 = get(handles.img11,'string');
%A2 = get(handles.img2,'string');
%A3 = get(handles.img3,'string');
%A34 = get(handles.I34,'string');
%Amax = get(handles.Imax,'string');
%img = str2num(get(handles.img,'string'));
%img11 = str2num(get(handles.img11,'string'));
%img2 = str2num(get(handles.img2,'string'));
%img3 = str2num(get(handles.img3,'string'));
%I34 = str2num(get(handles.I34,'string'));
%Imax= str2num(get(handles.Imax,'string'));
if (img(r(h),c(h))== 1 & img11(r(h),c(h))==1  & I4<Imax & img3(r(h),c(h))==1 & img2(r(h),c(h))==1)
    set(handles.staticText,'string','The patient has acute stroke');
    %helpdlg('The patient has acute stroke');
    %msgbox('The Patient has acute stoke');
elseif (img(r(h),c(h))== 0 & img11(r(h),c(h))==0  & I34>Imax & img3(r(h),c(h))==0 & img2(r(h),c(h))==0)
    set(handles.staticText,'string','It is not acute stroke');
    %helpdlg('It is not acute stroke');
    %msgbox('It is not an acute stroke');
else
    set(handles.staticText,'string','The patient has no stroke');
    %msgbox('The patient has no stroke');
end
end
%set(handles.edit1,'string',Result);
