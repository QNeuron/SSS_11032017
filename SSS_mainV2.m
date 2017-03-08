function varargout = SSS_mainV2(varargin)
% SSS_MAINV2 MATLAB code for SSS_mainV2.fig
%      SSS_MAINV2, by itself, creates a new SSS_MAINV2 or raises the existing
%      singleton*.
%
%      H = SSS_MAINV2 returns the handle to a new SSS_MAINV2 or the handle to
%      the existing singleton*.
%
%      SSS_MAINV2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SSS_MAINV2.M with the given input arguments.
%
%      SSS_MAINV2('Property','Value',...) creates a new SSS_MAINV2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SSS_mainV2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SSS_mainV2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SSS_mainV2

% Last Modified by GUIDE v2.5 08-Mar-2017 17:13:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SSS_mainV2_OpeningFcn, ...
    'gui_OutputFcn',  @SSS_mainV2_OutputFcn, ...
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
end
% End initialization code - DO NOT EDIT


% --- Executes just before SSS_mainV2 is made visible.
    function SSS_mainV2_OpeningFcn(hObject, eventdata, handles, varargin)
        % This function has no output args, see OutputFcn.
        % hObject    handle to figure
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        % varargin   command line arguments to SSS_mainV2 (see VARARGIN)
        
        % Choose default command line output for SSS_mainV2
        handles.output = hObject;
        handles.fs = 64000;
        handles.dur = 0.1;
        handles.ISI = 0.1;
        handles.ramp = linspace(0,1,0.1*handles.fs);
        
        handles.output = gcf;
        
        % Update handles structure
        guidata(hObject, handles);
        
        makesSound(hObject,handles)
        % UIWAIT makes SSS_mainV2 wait for user response (see UIRESUME)
        % uiwait(handles.figure1);
    end

% --- Outputs from this function are returned to the command line.
    function varargout = SSS_mainV2_OutputFcn(hObject, eventdata, handles)
        % varargout  cell array for returning output args (see VARARGOUT);
        % hObject    handle to figure
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        
        % Get default command line output from handles structure
        varargout{1} = handles.output;
    end

% --- Executes on slider movement.
    function slider_ITD_Callback(hObject, eventdata, handles)
        % hObject    handle to slider_ITD (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        
        % Hints: get(hObject,'Value') returns position of slider
        %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
        
        makesSound(hObject,handles)
    end

% --- Executes during object creation, after setting all properties.
    function slider_ITD_CreateFcn(hObject, eventdata, handles)
        % hObject    handle to slider_ITD (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    empty - handles not created until after all CreateFcns called
        
        % Hint: slider controls usually have a light gray background.
        if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor',[.9 .9 .9]);
        end
    end

% --- Executes on slider movement.
    function slider_ILD_Callback(hObject, eventdata, handles)
        % hObject    handle to slider_ILD (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        
        % Hints: get(hObject,'Value') returns position of slider
        %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
        
        makesSound(hObject,handles)
    end

% --- Executes during object creation, after setting all properties.
    function slider_ILD_CreateFcn(hObject, eventdata, handles)
        % hObject    handle to slider_ILD (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    empty - handles not created until after all CreateFcns called
        
        % Hint: slider controls usually have a light gray background.
        if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor',[.9 .9 .9]);
        end
        
    end

% --- Executes on slider movement.
    function slider_Frequency_Callback(hObject, eventdata, handles)
        % hObject    handle to slider_Frequency (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        
        % Hints: get(hObject,'Value') returns position of slider
        %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
        
        makesSound(hObject,handles)
        
    end

% --- Executes during object creation, after setting all properties.
    function slider_Frequency_CreateFcn(hObject, eventdata, handles)
        % hObject    handle to slider_Frequency (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    empty - handles not created until after all CreateFcns called
        
        % Hint: slider controls usually have a light gray background.
        if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
            set(hObject,'BackgroundColor',[.9 .9 .9]);
        end
    end

    function makesSound(hObject,handles)
        
        % Read Frequency
        F = get(handles.slider_Frequency,'Value');
        
        % make sound
        t = 0:1/handles.fs:handles.dur;
        handles.sound = sin(2*pi*F*t);
        
        % Linear ramp
        handles.sound = handles.sound .* [handles.ramp ones(1,length(handles.sound)-length(handles.ramp))];
        handles.sound = handles.sound .* [ones(1,length(handles.sound)-length(handles.ramp)) fliplr(handles.ramp)];
        
        % Make ITD
        ITD = get(handles.slider_ITD,'Value');
        delayTaps=round(handles.fs*ITD/1000);
        if delayTaps<0, delayTaps=-delayTaps; end;
        silence=zeros(1,delayTaps);
        % here we assume that Matlab plays the first column to the right
        % ear, the second to the left. That seems to be the case on my
        % windows laptop. Dan also wants negative ITDs to be associated
        % with left sounds. So values must reflect Right - Left, or first
        % column minus 2nd column.
        if ITD < 0,
            % ITD value is negative. Left ear should be leading.
            % That means right ear (first column) must be delayed
            handles.sound=[[silence handles.sound]; [handles.sound silence]]';
        else
            % ITD positive. Second column must be delayed
            handles.sound=[[handles.sound silence]; [silence handles.sound]]';
        end;
        
        % Make ILD
        ILD = get(handles.slider_ILD,'Value');
        ILDRight=ILD/2; % separation of left and right ear
        ILDLeft=-ILDRight; % dB
        scaleLeft=10.^(ILDLeft./20);    % amplitude
        scaleRight=10.^(ILDRight./20);
        maxVal=max([abs(scaleLeft),abs(scaleRight)]).*max(handles.sound(:));
        
        % here we assume that Matlab plays the first column to the right
        % ear, the second to the left.
        handles.sound(:,1)= handles.sound(:,1).*scaleRight;
        handles.sound(:,2) = handles.sound(:,2).*scaleLeft;
        
        if maxVal > 1, % Avoid clipping
            handles.sound = handles.sound ./ maxVal;
        end;
        handles.player = audioplayer(handles.sound,handles.fs);
        
        % Plot sound waveform
        t = 0:1/handles.fs:length(handles.sound)/handles.fs;
        plot(handles.h_waveformsZoom,t(t(1:end-1)<=0.001),handles.sound(t(1:end-1)<=0.001,:));
        plot(handles.h_waveforms,t(1:end-1),handles.sound);
        
        
        % Update titles
        set(handles.F_txt,'string',sprintf('Sound Frequency : %.3f kHz',F/1000));
        set(handles.ITD_txt,'string',sprintf('Interaural Time Difference :  %.1f us',ITD*100));
        set(handles.ILD_txt,'string',sprintf('Interaural Level Difference :  %.1f dB',ILD));
        
        guidata(hObject, handles);
    end

% --- Executes on button press in togglebutton_play.
    function togglebutton_play_Callback(hObject, eventdata, handles)
        % hObject    handle to togglebutton_play (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        
        % Hint: get(hObject,'Value') returns toggle state of togglebutton_play
        
        switch get(handles.togglebutton_play,'Value')
            case 1
                set(handles.togglebutton_play,'String','PAUSE')
            case 0
                set(handles.togglebutton_play,'String','PLAY')
        end
        
        while get(handles.togglebutton_play,'Value');
            handles = guidata(gcf);
            handles.player.playblocking;
            pause(handles.ISI)
        end
        
    end
