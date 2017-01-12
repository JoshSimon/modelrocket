function varargout = Rakete(varargin)
% RAKETE MATLAB code for Rakete.fig
%      RAKETE, by itself, creates a new RAKETE or raises the existing
%      singleton*.
%
%      H = RAKETE returns the handle to a new RAKETE or the handle to
%      the existing singleton*.
%
%      RAKETE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RAKETE.M with the given input arguments.
%
%      RAKETE('Property','Value',...) creates a new RAKETE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rakete_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rakete_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rakete

% Last Modified by GUIDE v2.5 27-May-2015 02:45:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rakete_OpeningFcn, ...
                   'gui_OutputFcn',  @Rakete_OutputFcn, ...
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


% --- Executes just before Rakete is made visible.
function Rakete_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rakete (see VARARGIN)

% Choose default command line output for Rakete
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Rakete wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% Setting the available input intervals in the GUI

set(handles.slider_PVkd, 'Min', 0, 'Max', 89, 'sliderstep', [1/89 10/89]); % GUI element *slider* - sweep angle front edge of the empennage
set(handles.slider_PVkd, 'Value', 30); % starting value
set(handles.edit_PVkd, 'String', 30); % textbox for input
set(handles.slider_PHkd, 'Min', 0, 'Max', 89, 'sliderstep', [1/89 10/89]); %Slider f�r Pfeilung der Hinterkante definiert
set(handles.slider_PHkd, 'Value', 20); %0 als Grundwert f�r PHkd gesetzt
set(handles.edit_PHkd, 'String', 0); %Textbox f�r Hinterkantenpfeilung auf 0 gesetzt
set(handles.radio_30mm, 'Value', 1); %Toggleknopf f�r 30mm Durchmesser
set(handles.radio_elli, 'Value', 1);
set(handles.radio_hoehe, 'Value', 1);
set(handles.edit_Lr, 'String', 330); %Textbox f�r Raketenl�nge, Grundwert 210 
set(handles.edit_Ln, 'String', 60);
set(handles.text_L_D, 'String', 11); 
set(handles.slider_Str, 'Min', 1, 'Max', 20, 'sliderstep', [1/19 10/19]); %Slider f�r Streckung der Leitwerke definiert
set(handles.slider_Str, 'Value', 2); %7 als Startwert f�r die Streckung
set(handles.edit_Str, 'Value', 2); %Textbox f�r die Streckung
set(handles.slider_vFl, 'Min', 0, 'Max', 100, 'sliderstep', [1/100 10/100]); %Slider f�r das Verh�ltnis der Leitwerksfl�che zur Lateralfl�che definiert
set(handles.slider_vFl, 'value', 30); %Startwert Slider Verh�ltnis vFl (Leitwerk zu Lateral)
set(handles.edit_vFl, 'String', 30); %Textbox f�r vFl 



Main(handles)

% --- Outputs from this function are returned to the command line.
function varargout = Rakete_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_PHkd_Callback(hObject, eventdata, handles)
% hObject    handle to slider_PHkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Main(handles);

% --- Executes during object creation, after setting all properties.
function slider_PHkd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_PHkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_PVkd_Callback(hObject, eventdata, handles)
% hObject    handle to slider_PVkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Main(handles);

% --- Executes during object creation, after setting all properties.
function slider_PVkd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_PVkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_Lr_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Lr as text
%        str2double(get(hObject,'String')) returns contents of edit_Lr as a double
Lr = str2num(get(handles.edit_Lr, 'String')); %Entnimmt der edit_Lr textbox ihren String und wandelt ihn zu einer Nummer und legt Lr damit fest
Main(handles); %verweist auf die Mainfunktion


% --- Executes during object creation, after setting all properties.
function edit_Lr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Str_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Str (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Str as text
%        str2double(get(hObject,'String')) returns contents of edit_Str as a double
Str = str2num(get(handles.edit_Str, 'String')); %Entnimmt edit_Str ihren wert und setzt Str damit fest
set (handles.slider_Str, 'Value', Str); %Aktualisert Sliderposition
Main(handles); %verweist auf die Mainfunktion

% --- Executes during object creation, after setting all properties.
function edit_Str_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Str (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vFl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vFl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vFl as text
%        str2double(get(hObject,'String')) returns contents of edit_vFl as a double
vFl = str2num(get(handles.edit_vFl, 'String')); %Setzt vFl mit dem Wert der edit_vFl fest
set (handles.slider_vFl, 'Value', vFl); %Aktualisert Sliderposition
Main(handles)

% --- Executes during object creation, after setting all properties.
function edit_vFl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vFl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PVkd_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PVkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PVkd as text
%        str2double(get(hObject,'String')) returns contents of edit_PVkd as a double
PVkd = str2num(get(handles.edit_PVkd, 'String')); %Entnimmt textbox ihren Wert und legt PVkd damit fest
set (handles.slider_PVkd, 'Value', PVkd); %Aktualisiert Sliderposition
Main(handles);

% --- Executes during object creation, after setting all properties.
function edit_PVkd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PVkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_PHkd_Callback(hObject, eventdata, handles)
% hObject    handle to edit_PHkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_PHkd as text
%        str2double(get(hObject,'String')) returns contents of edit_PHkd as a double
PHkd = str2num(get(handles.edit_PHkd, 'String')); %setzt PHkd mit textbox Wert fest
set (handles.slider_PHkd, 'Value', PHkd); %aktualisiert Sliderposition
Main(handles); %verweist auf die Mainfunktion

% --- Executes during object creation, after setting all properties.
function edit_PHkd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_PHkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_Ln_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ln (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ln as text
%        str2double(get(hObject,'String')) returns contents of edit_Ln as a double
Ln = str2num(get(handles.edit_Ln, 'String')); %Entnimmt der edit_Lr textbox ihren String und wandelt ihn zu einer Nummer und legt Lr damit fest
Main(handles); %verweist auf die Mainfunktion

% --- Executes during object creation, after setting all properties.
function edit_Ln_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ln (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function slider_Str_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Str (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Main(handles); %verweist auf die Mainfunktion

% --- Executes during object creation, after setting all properties.
function slider_Str_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Str (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_vFl_Callback(hObject, eventdata, handles)
% hObject    handle to slider_vFl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Main(handles); %verweist auf die Mainfunktion

% --- Executes during object creation, after setting all properties.
function slider_vFl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_vFl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in radio_30mm.
function radio_30mm_Callback(hObject, eventdata, handles)
% hObject    handle to radio_30mm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_30mm
radiobutton_Dreset(handles) %setzt Togglebutton f�r Durchmesser auf 0 mit der Radiobutton_resetfunktion
set(handles.radio_30mm, 'Value', 1); %Aktiviert 30mm button
Main(handles)%verweist auf Meinfunktion

% --- Executes on button press in radio_40mm.
function radio_40mm_Callback(hObject, eventdata, handles)
% hObject    handle to radio_40mm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_40mm
radiobutton_Dreset(handles)%setzt Togglebutton f�r Durchmesser auf 0 mit der Radiobutton_resetfunktion
set(handles.radio_40mm, 'Value', 1);%Aktiviert 40mm button
Main(handles)%verweist auf Meinfunktion


% --- Executes on button press in radio_para.
function radio_para_Callback(hObject, eventdata, handles)
% hObject    handle to radio_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_para
radiobutton_Nreset(handles) %setzt Togglebutton f�r Durchmesser auf 0 mit der Radiobutton_resetfunktion
set(handles.radio_para, 'Value', 1); %Aktiviert 30mm button
Main(handles)%verweist auf Mainfunktion

% --- Executes on button press in radio_elli.
function radio_elli_Callback(hObject, eventdata, handles)
% hObject    handle to radio_elli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_elli
radiobutton_Nreset(handles) %setzt Togglebutton f�r Durchmesser auf 0 mit der Radiobutton_resetfunktion
set(handles.radio_elli, 'Value', 1); %Aktiviert 30mm button
Main(handles)%verweist auf Mainfunktion


function radio_hoehe_Callback(hObject, eventdata, handles)
% hObject    handle to radio_hoehe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
radiobutton_Mreset(handles) %setzt Togglebutton f�r Durchmesser auf 0 mit der Radiobutton_resetfunktion
set(handles.radio_hoehe, 'Value', 1); %Aktiviert 30mm button
Main(handles)%verweist auf Mainfunktion
% Hint: get(hObject,'Value') returns toggle state of radio_hoehe


% --- Executes on button press in radio_kamera.
function radio_kamera_Callback(hObject, eventdata, handles)
% hObject    handle to radio_kamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
radiobutton_Mreset(handles) %setzt Togglebutton f�r Durchmesser auf 0 mit der Radiobutton_resetfunktion
set(handles.radio_kamera, 'Value', 1); %Aktiviert 30mm button
Main(handles)%verweist auf Mainfunktion
% Hint: get(hObject,'Value') returns toggle state of radio_kamera

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%-----Main--------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Main(handles)

Lr = str2num(get(handles.edit_Lr, 'String')); %Setzt Raketenl�nge fest

if (get(handles.radio_30mm, 'Value')==1) % Wenn 30 mm gew�hlt
    D = 30; %Durchmesser auf 30 gesetzt
end
if (get(handles.radio_40mm, 'Value') ==1) %analog zu 30 mm
    D = 40;
end

R= D * 0.5; %Radius ist halber Durchmesser
% !!!
Ln= str2num(get(handles.edit_Ln, 'String')); %setzt Nasenl�nge auf dreimal den Durchmesser fest
% !!!

L_D = Lr/D; % Lr - height of the rocket body without the nose (fuselage)


Value_str = get(handles.slider_Str, 'Value'); %Edit-Box Streckung auf den Wert des Sliders setzen
set(handles.edit_Str, 'String', Value_str);
Value_vFl = get(handles.slider_vFl, 'Value');%Edit-Box Verh�ltnis Leitwerk zu Lateralfl�che auf den Wert des Sliders setzen
set(handles.edit_vFl, 'String', Value_vFl);
Value_PVkd = get(handles.slider_PVkd, 'Value'); %Edit-Box Vorderkantenpfeilung auf den Wert des Sliders setzen
set(handles.edit_PVkd, 'String', Value_PVkd);
Value_PHkd = get(handles.slider_PHkd, 'Value'); %Edit-Box Hinterkantenpfeilung auf den Wert des Sliders setzen
set(handles.edit_PHkd, 'String', Value_PHkd);

if (get(handles.radio_para, 'Value')==1) % Wenn 30 mm gew�hlt
    NForm = R*((2*(linspace(0,Ln,Ln)/Ln)-0.75*(power((linspace(0,Ln,Ln)/Ln),2)))/(2-0.75)); %�bungsformel f�r Parabelnase mit K' = 0,75
end
if (get(handles.radio_elli, 'Value') ==1) %analog zu 30 mm
    NForm = R*sqrt(1-(power((linspace(0,Ln,Ln)-Ln),2)/power(Ln,2))); 
end


A_Nase = 2*trapz(NForm); % surface area underneath the nose cone profil line doubled to have the area of a full profile with trapezoidal numerical integration

A_Mantel = Lr * 2* pi * R; %M surface area of the fuselage (body without nose) of the rocket

% !!!
LwAbR = 0; %Abstand Leitwerk R�ckseite zzt. nicht verwendet (Leitwerk Abstand R�ckseite)
% !!!

PVkd = get(handles.slider_PVkd, 'Value'); %Slider_PVkd Wert legt PVKd (Pfeilung Vorderkante degrees) an

PVkr = PVkd * (pi/180); %PVKd wird in Radien umgerechnet, jetzt PVKr (Pfeilung Vorderkante radien)

PHkd = get(handles.slider_PHkd, 'Value'); %Analog PVKd f�r Hinterkante = PHKd (Pfeilung Hinderkante degrees)

PHkr = PHkd*(pi/180); %Analog PVkr f�r PHkr

A_Rumpf = (Lr-Ln)*D; %surface area of the fuselage: (rocket height - nose height) * fuselage diameter

A_Lat= A_Rumpf+A_Nase; %lateral surface area: nose + fuselage surface area

vFl= get(handles.slider_vFl, 'Value') /100; %ratio of the lateral to empennage surface area which is et by a GUI element *slider*

A_Lw =  (vFl*A_Lat); %Leitwerkfl�che FlLW (Fl�che Leitwerk) = ((Verh�ltnis Leitwerkfl�che zur Lateralfl�che) mal (Lateralfl�che))/Zwei/Zwei  ; Bei drei Leitwerken ist bei der Seitenansicht ist die Fl�che von einem Leitwerk komplett sichtbar und von den anderen zwei Leitwerken jeweils die Fl�che mal jeweils sin(30)=0.5 und cos(60)=0.5. Resultat ist das von der Seite insgesamt zweimal die ganze Fl�che gesehen wird. Deswegen wird durch zwei dividiert.

A_Fl = A_Lw/1.5;

Str = get(handles.slider_Str, 'Value'); % aspect ration of the empennage set by GUI element *slider*

Span = sqrt((Str*A_Fl)/2); %Spannweite der Leitwerke wird aus FlLw und Str berechnet mit der Formel aus der �bung

SpanVer = Span*sin(pi/6); %SpanVer (Spannweite Verzerrt) Spannweite f�r zweites Leitwerk welches verzerrt dargestellt wird

RLwV = R * sin(pi/6); %Radius bei dem das verzerrt Leitwerk an der Rakete anf�ngt

VVk = Span * tan(PVkr); %VVK (Versetzung Vorderkante) Horizontaleversetzung der Vorderkante

VHk = Span * tan(PHkr); %Analog VVK f�r Hinterkante

A_LwA = (power(Span,2) * tan(PVkr))/2; %Fl�che des Leitwerks A Bereich; A Bereich ist das Dreieck welches durch die Vorderkante aufgespannt wird

A_LwC = (power(Span,2) * tan(PHkr))/2; %Analog FlLwA f�r C Bereich; C Bereich ist das Dreieck welches durch die Hinterkante aufgespannt wird

A_LwB = A_Fl - A_LwA - A_LwC; %Fl�che des Leitwerks B Bereich; B Bereich ist das Rechteck zwischen A und C Bereich

TLwW = VVk + A_LwB/Span; %TLwW Tiefe Leitwerkwurzel VVk + Horizontaleversetzung des B Bereichs

TLwS = VHk+ A_LwB/Span; %TLwS Tiefe Leitwerkspitze VHK + Horizontalversetzung des B Bereichs

LwOVkAp = Lr-TLwW-LwAbR %Anfangspunkt x-Achse obere Leitwerkvorderkante (Raketenl�nge - Leitwerkswurzeltiefe - Abstand zur R�ckseite)

LwOVkEp = LwOVkAp+VVk %Endpunkt x-Achse obere Leitwerkvorderkante

LwOHkAp = Lr-LwAbR; %Anfangspunkt x-Achse obere Leitwerkhinterkante

LwOHkEp = LwOHkAp + VHk; %Endpunkt x-Achse obere Leitwerkhinterkante

%%%%%%%%%%%%   Druckpunktberechnung %%%%%%%%%%%

A_ref = (pi*D^2)/4; %Referenzfl�che f�r die xcp
T = 288.15; %Meeresspiegekvariablen
rho_0 = 1.225;
mue_0 = 17.17*(10)^(-6);
mue = mue_0 * (T/273.15)^(0.76);
v = 30;

delta= 3 / ((TLwS+TLwW)/2);
emp_fakt_rumpf = 2.2/((L_D)^(1.5)) + 3.8/((L_D)^3); %Empirischer Faktorrumpf
emp_fakt_Fl = 2.7 * delta + 100*delta^4; %Empirischer Faktor Leitwerk

lm_mittel = (TLwS+TLwW)/2; %Durchschnitt Leitwerktiefe
Re_Rumpf = (v * (Lr/1000) * rho_0 )/mue; %Re Zahl des RUmpfs
Re_Fl =  (v * ((TLwS+TLwW)/2000) * rho_0 )/mue; %Re- Zahl des Leitwerks

cf_rumpf = (0.455)/(log10(Re_Rumpf)^(2.58)); %CF WErt des Rumpfs

cw_Rumpf = cf_rumpf *(1 + emp_fakt_rumpf); %CW WErt des Rumpfs

cf_Fl = (0.455)/(log10(Re_Fl)^2.58); %CF Wert des Leitwerks
cw_Fl = 2* cf_Fl * (1 + emp_fakt_Fl * cos(PVkr)^2); %CW Wert des Leitwerks

cw_Rakete = cw_Rumpf * (A_Mantel/A_ref) + 3 * cw_Fl * (A_Fl/A_ref); %CW Wert der Gesamten Rakete

xcpSpitze = 0.5 * Ln %xcpSpitze entspricht der H�lfte der L�nge der Spitzenl�nge

xcpLeitwerk= LwOVkAp + (VVk*(TLwW+2*TLwS))/(3*(TLwW+TLwS))+(1/(6*(TLwW+TLwS-((TLwW*TLwS)/(TLwW+TLwS))))); %Formel aus �bung

cNalphaSpitze = 2; %festgelegt in �bung

Lw_int_fakt= (1+((R/Span)/(1+(R/Span))));
cNalphaFl= (2*pi*Str*(A_Fl/A_ref)/(2+sqrt((4+(Str/cos(PVkr)^2)))));
cNalphaLeitwerk = (2*cNalphaFl*cos(30*(pi/180))*Lw_int_fakt); %eine n�tige Formel f�r die gro�e xcp-Formel

xcp = (((cNalphaSpitze*xcpSpitze)+(cNalphaLeitwerk*xcpLeitwerk))/(cNalphaSpitze+cNalphaLeitwerk));  %Gesamtdruckpunktkoordinate

%%%%%%%%%%% Massenabschätzung %%%%%%%%%%%%%%%%%%%

m_Hoeheloger = 7.2;

m_Kamera = 19.5;

m_Motor = 21;

m_Motorhalterung = 2;

m_Leitrohr = 0.5;

m_Bergungssystem = 10;

m_Schutzwatte = 3; 

m_Verbindrohr = 2;

m_Rumpf_Rohr = 70.5/1000 *(Lr-Ln);

v_Nase = (1/12)*pi*D*D*Ln; %Volumen der Nase

A_Ober_Nase = pi * R * sqrt(Ln*Ln + R*R); %Oberfläche der Nase
   
v_Rumpf = 2*pi*R*(Lr-Ln);%Volumen des Rumpfs

m_Nase = v_Nase * 0.0000335 + A_Ober_Nase * 0.000500; %Masse Rumpf

m_Rumpf = m_Rumpf_Rohr + m_Motor + m_Motorhalterung + m_Leitrohr + m_Bergungssystem + m_Schutzwatte + m_Verbindrohr; %Masse Rakete

m_LwpA = (0.000163 + 0.000240); %Flächenmasse des Leitwerks
m_Lw = A_Fl * m_LwpA ; %Masse des Leitwerks

x_Motor = Lr-70;%Position Motor
x_Schutzwatte  = x_Motor-3; %Position Schutzwatte
x_hth = 0;


if (get(handles.radio_hoehe, 'Value')==1) % Wenn höhenmesser gew�hlt
    m_Rumpf_gelad= m_Rumpf + m_Hoeheloger;
    %xMp_Rumpf = ((0*m_Verbindrohr + 35 * m_Bergungssystem + 110*m_Hoeheloger + (Lr-Ln-35) * (m_Motor+m_Motorhalterung) + (Lr-Ln-75) * m_Schutzwatte + (LwOVkAp-Ln - 25)*m_Leitrohr + ((Lr-Ln)/2) * m_Rumpf_Rohr)/m_Rumpf_gelad)+Ln ;  %Formel bei anderer Auslegung Innerkomponenten
    xMp_Rumpf = ((151*m_Verbindrohr + 115 * m_Bergungssystem + 40*m_Hoeheloger + (Lr-Ln-35) * (m_Motor+m_Motorhalterung) + (Lr-Ln-75) * m_Schutzwatte + (LwOVkAp-Ln - 25)*m_Leitrohr + ((Lr-Ln)/2) * m_Rumpf_Rohr)/m_Rumpf_gelad)+Ln ; %Berechnet Schwerpunkt ddes RUmpfs

end
if (get(handles.radio_kamera, 'Value') ==1) %analog zu Höhenmesser für Kamera 
	m_Rumpf_gelad = m_Rumpf + m_Kamera;
	%xMp_Rumpf = ((0*m_Verbindrohr + 35 * m_Bergungssystem + 110*m_Kamera + (Lr-Ln-35) * (m_Motor+m_Motorhalterung) + (Lr-Ln-75) * m_Schutzwatte + (LwOVkAp-Ln - 25)*m_Leitrohr + ((Lr-Ln)/2) * m_Rumpf_Rohr)/m_Rumpf_gelad)+Ln ;
    xMp_Rumpf = ((151*m_Verbindrohr + 115 * m_Bergungssystem + 40*m_Kamera + (Lr-Ln-35) * (m_Motor+m_Motorhalterung) + (Lr-Ln-75) * m_Schutzwatte + (LwOVkAp-Ln - 25)*m_Leitrohr + ((Lr-Ln)/2) * m_Rumpf_Rohr)/m_Rumpf_gelad)+Ln ;

end

M_Rakete = (m_Nase + m_Rumpf_gelad + 3*m_Lw)*1.1; %Masse Rakete mit 10% Korrektur

xMp_Nase = Ln * 2/3; %Schwerpunkt Nase

xMp_Lw= LwOVkAp +((((2/3)*VVk)*(A_LwA*m_LwpA ) + ((VVk + A_LwB/(Span))/2)*(A_LwC*m_LwpA ) +( ((TLwW + VHk) * (1/3)*A_LwC*m_LwpA )))/m_Lw)  %Schwerpunkt Leitwerk

xMp_Rakete= (xMp_Nase*m_Nase*1.1 + xMp_Rumpf*m_Rumpf_gelad*1.1 + 3*xMp_Lw*m_Lw*1.1)/M_Rakete; %Schwerpunkt rakete


%%%%%%%%%%%%%% Flugbahnberechnung %%%%%%%%%%%%%%%%%%%

h_akt = [0];
v_akt = [0];
x_akt = [0];
t_akt = [0];
A_ref_2= A_ref/1000000;
gamma_akt = (85*pi)/180;
g = 9.81;
P_0 = 101325;

delta_t = 1/6;
schubdauer = 1.8;
verzoeg = 7;

v_letzt = v_akt(1);
t_letzt = t_akt(1);
x_letzt = x_akt(1);
h_letzt = h_akt(1);
delta_v = [0];
gamma_letzt = gamma_akt;

F_Schub = [0.4 2.4 7.0 10.6 10.2 8.2 6.8 6.0 4.5 2.3 0.8 0.2]; %Schubdaten aus Messung

i= 0;
j = 1;
while (t_akt < schubdauer) %Schleife um alle Variablen unter Schub zu beachten
    i = i+1;
    j = j+1;
    t_akt(j) = t_akt(i) + delta_t; %Aktuelle Zeit
    masse_t = (M_Rakete-((21-9.3)/(schubdauer)) *t_akt(j) )/1000; %Aktuelle Masse

   
    rho = rho_0 * exp((-rho_0 * g)/(P_0)*h_letzt); %Aktuelle Luftdichte
    F_wider = cw_Rakete*A_ref_2 * rho/2 * v_akt(i)^2; %Aktuelle Widerstandskraft 
    
    delta_v(j) = (((F_Schub(i) - F_wider)/masse_t) - (g * sin(gamma_akt)))*delta_t; %Änderung Raketengeschwindigkeit
    v_akt(j) = v_letzt + delta_v(j); %Aktuelle Raketengeschwindigkeit
    
    delta_x = 0.5*(v_akt(j)+v_letzt)*cos(gamma_akt)*delta_t; %Änderung Horizontaleverschiebung
    delta_h = 0.5*(v_akt(j)+v_letzt)*sin(gamma_akt)*delta_t; %Änderung Vertikaleverschiebung
    
    h_akt(j) = h_letzt + delta_h; %Aktuelle Höhe
    x_akt(j) = x_letzt + delta_x; %Aktueller Abdrift
    
    x_letzt = x_akt(j);
    h_letzt  = h_akt(j);
    v_letzt = v_akt(j);
    
end


while (t_akt < (schubdauer+verzoeg)) %Analog zu ersten While schleife, jetzt Gleitflug
    i = i+1;
    j = j+1;
    delta_t = 0.01;
    t_akt(j) = t_akt(i) + delta_t;
    
    gamma_akt = gamma_letzt -g/abs(v_akt(i)) * cos(gamma_letzt)*delta_t;
    gamma_letzt = gamma_akt;
    
    masse_t = (M_Rakete-(0.021-0.0093))/1000;
    
    rho = rho_0 * exp((-rho_0 * g)/(P_0)*h_letzt);
    F_wider = cw_Rakete*A_ref_2 * rho/2 * v_akt(i)^2;
    
    delta_v(j) = (((0 - F_wider)/masse_t) - (g * sin(gamma_akt)))*delta_t;
    v_akt(j) = v_letzt + delta_v(j);
    
    delta_x = 0.5*(v_akt(j)+v_letzt)*cos(gamma_akt)*delta_t;
    delta_h = 0.5*(v_akt(j)+v_letzt)*sin(gamma_akt)*delta_t;
    
    h_akt(j) = h_letzt + delta_h;
    x_akt(j) = x_letzt + delta_x;
    
    x_letzt = x_akt(j);
    h_letzt  = h_akt(j);
    v_letzt = v_akt(j);
    
end

while (h_akt(j) > 0) %Analog zu anderen Schleife, jetzt Sinkflug
    i = i+1;
    j = j+1;
    delta_t = 0.01;
    t_akt(j) = t_akt(i) + delta_t;
    
    gamma_akt = gamma_letzt -g/abs(v_akt(i)) * cos(gamma_letzt)*delta_t;
    gamma_letzt = gamma_akt;
    
    masse_t = (M_Rakete-(0.021-0.0093))/1000;
    
    rho = rho_0 * exp((-rho_0 * g)/(P_0)*h_letzt);
    F_wider = cw_Rakete*A_ref_2 * rho/2 * v_akt(i)^2;
    
    delta_v(j) = (((0 - F_wider)/masse_t) - (g * sin(gamma_akt)))*delta_t;
    v_akt(j) = v_letzt + delta_v(j);
    if(v_akt(j)> 4)
       v_akt(j) = 4;
    end
    
    delta_x = 0.5*(v_akt(j)+v_letzt)*cos(gamma_akt)*delta_t;
    delta_h = 0.5*(v_akt(j)+v_letzt)*sin(gamma_akt)*delta_t;
    
    h_akt(j) = h_letzt + delta_h;
    x_akt(j) = x_letzt + delta_x;
    
    x_letzt = x_akt(j);
    h_letzt  = h_akt(j);
    v_letzt = v_akt(j);
end
    
max_hoehe = max(h_akt);
max_v = max(v_akt);
max_x = max(x_akt);

%%%%%%%%%Information und Fehlerausgabe %%%%%%%%%%%%%%%%%%%%%%%%%%%%%


xversteck = LwOVkAp +(((R-RLwV)*(LwOVkEp-LwOVkAp)/SpanVer)); % Berechnet L�nge der unteren Rumpflinien, damit diese nicht in das Leitwerk hineingeplottet wird
Kali = (xMp_Rakete - xcp )/D; %Kaliberstabilität
set(handles.text_L_D, 'String', L_D); %Ausgabe Felder für Informationen
set(handles.text_Span, 'String', Span);
set(handles.text_TLwW, 'String', TLwW);
set(handles.text_TLwS, 'String', TLwS);
set(handles.text_masse_ausgabe, 'String', M_Rakete);
set(handles.text_kali, 'String', Kali);
set(handles.text_druck, 'String', xcp);
set(handles.text_schwer, 'String', xMp_Rakete);
set(handles.text_beiw, 'String', cw_Rakete);
set(handles.text_max_hoehe, 'String', max_hoehe);
set(handles.text_max_v, 'String', max_v);
set(handles.text_max_x, 'String', max_x);

if xversteck > Lr %Verhindert das xversteck gr��er als Lr wird, bei sehr stark gestreckten Leitwerken mit hoher Pfeilung
    xversteck = Lr
end

if LwOVkEp > LwOHkEp %Verhindert Fehler das Leitwerk in sich verdreht ist
    h = warndlg('Unm�gliche Konfiguration: Leitwerkkanten �berschneiden sich!')
    
elseif LwOVkAp > Lr %Verhindert Fehler das Leitwerk nicht am Rumpf der Rakete montierbar ist
    h = warndlg('Unm�gliche Konfiguration: Leitwerk f�ngt hinter der Rakete an!')
    
else %Falls keine Fehler, wird neue Rakete geplottet
    
%%%%%%%%%%%%%%%Plotten der Rakete%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    cla(handles.axes1, 'reset') %Alte Rakete wird gel�scht
    cla(handles.axes2, 'reset')
    cla(handles.axes3, 'reset')
    cla(handles.axes4, 'reset')
    cla(handles.axes5, 'reset')
    
    axes(handles.axes1)

        plot(xcp, 0,'Marker','o','MarkerSize',15,'MarkerEdgeColor','red'); hold on;

        plot(xMp_Rakete, 0,'Marker','o','MarkerSize',15,'MarkerEdgeColor','green'); hold on;

        plot(linspace(Ln,Lr,10),linspace(R,R,10)); hold on; %Oberseite des Rumpf

        plot(linspace(Ln,xversteck,10),linspace(-R,-R,10)); hold on; %Untereseite des Rumpf

        plot(linspace(LwOVkAp,LwOVkEp,10),linspace(R,Span+R,10));hold on; %obere Leitwerkvorderkante

        plot(linspace(LwOVkEp,LwOHkEp,10),linspace(Span+R,Span+R,10));hold on; %obere Leitwerkspitze

        plot(linspace(LwOHkAp,LwOHkEp,10),linspace(R,Span+R,10));hold on; %obere Leitwerkhinterkante

        plot(linspace(LwOHkAp,LwOHkAp,10),linspace(R,R,10));hold on; %obere Leitwerkunterkante

        plot(linspace(LwOVkAp,LwOVkEp,10),linspace(-RLwV,-RLwV-SpanVer,10));hold on; %Untere Leitwerkvorderkante

        plot(linspace(LwOVkEp,LwOHkEp,10),linspace(-RLwV-SpanVer,-RLwV-SpanVer,10));hold on; %Untere Leitwerkspitze

        plot(linspace(LwOHkAp,LwOHkEp,10),linspace(-RLwV,-RLwV-SpanVer,10));hold on; %Untere Leitwerkhinterkante

        plot(linspace(LwOVkAp,LwOHkAp,10),linspace(-RLwV,-RLwV,10));hold on; %Untere Leitwerkhinterkante

        plot(linspace(Lr,Lr,10),linspace(R,-RLwV,10));hold on; %R�ckseite Rakete

        plot(linspace(Ln,Ln,10),linspace(R,-R,10));hold on; %Trennlinie Nase-Rakete

        plot(NForm);hold on; %Obere Nase
        plot(-NForm);hold on; %Untere Nase

       axis equal;
        
        xlabel('x [mm]'); %Achsenbeschriftung

        ylabel('y [mm]'); %Achsenbeschriftung
        
        xlim ([0 400]);
        ylim ([-100 100]);
        
    axes(handles.axes2) %Höhe Zeit Diagram
    
        plot(t_akt,h_akt, 'Color', 'Green'); hold on;
        
        xlabel('t [s]'); %Achsenbeschriftung

        ylabel('h [m]'); %Achsenbeschriftung
        
        xlim ([0 120]);
        ylim ([0 400]);
        
    axes(handles.axes3) %Flugbahn diagramm
    
        plot(x_akt, h_akt, 'Color', 'Blue'); hold on;
        
        xlabel('x [m]');%Achsenbeschriftung
        
        ylabel('h [m]');%Achsenbeschriftung
        
        
        xlim ([0 60]);
        ylim ([0 400]);
        
    axes(handles.axes4) %Geschwindigkeit Zeit diagram
    
        plot(t_akt,v_akt, 'Color', 'Red'); hold on;
        
        xlabel('t [s]');%Achsenbeschriftung
        
        ylabel('v [m/s]');%Achsenbeschriftung
        
        xlim ([0 120]);
        ylim ([0 110]);
        
    axes(handles.axes5) %Beschleunigug Zeit Diagramm
    
        plot(t_akt,delta_v, 'Color', 'Red'); hold on;
        
        xlabel('t [s]');%Achsenbeschriftung
        
        ylabel('a [m/s^2]');%Achsenbeschriftung
        
        xlim ([0 120]);
        ylim ([-5 25]);
        
end

function radiobutton_Dreset(handles)%Funktion um Durchmessertogglekn�pfe auf 0 zu stellen

set(handles.radio_30mm,'Value',0); %30 mm wird auf 0 gesetzt

set(handles.radio_40mm, 'Value', 0); %40 mm wird auf 0 gesetzt

function radiobutton_Nreset(handles)%Funktion um Durchmessertogglekn�pfe auf 0 zu stellen

set(handles.radio_para,'Value',0); %30 mm wird auf 0 gesetzt

set(handles.radio_elli, 'Value', 0); %40 mm wird auf 0 gesetzt

function radiobutton_Mreset(handles)%Funktion um Durchmessertogglekn�pfe auf 0 zu stellen

set(handles.radio_hoehe,'Value',0); %30 mm wird auf 0 gesetzt

set(handles.radio_kamera, 'Value', 0); %40 mm wird auf 0 gesetzt
