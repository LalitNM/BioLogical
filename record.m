promptMessage = sprintf('Would you like to record your own audio for further processing?');
titleBarCaption = 'Record Sound';
button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No','Yes');
if strcmpi(button, 'Yes')
    %Program code of recording audio
    z=audiorecorder;
    myicon = imread('microphone.png');
    h=msgbox('Speak Up, I am Recording...','Recording','custom',myicon);
    recordblocking(z,3); %Records a 5 sec audio
    delete(h);
    myRecording = getaudiodata(z);

    %Block to play audio and corresponding graph
    promptMessage=sprintf('Do want to play your recorded file?');
    titleBarCaption='Play';
    button = questdlg(promptMessage,titleBarCaption,'Yes', 'No','Yes');
    if strcmpi(button,'Yes')
    %play(z);
    end
end
sound(myRecording);
figure
plot(myRecording);
xlabel('Time');
ylabel('Amplitude');
h = fast(myRecording,9000,'voice');



Fs =8000;
%low pass filter
%transfer Function
s=tf('s');
f=140;% cut-off frequency
wo = 2*pi*f;
H = wo/(s+wo);
Gz_low = c2d(H,1/Fs,'tustin');
Gz_low.variable='z^-1'


[num_low_pass,den_low_pass] = tfdata(Gz_low);

num_low_pass = num_low_pass{1};
den_low_pass = den_low_pass{1};



%high pass filter
%transfer Function
s=tf('s');
f=80;% cut-off frequency
wo = 2*pi*f;
H =s/(s+wo);
Gz_high = c2d(H,1/Fs,'tustin');
Gz_high.variable='z^-1'


[num_high,den_high] = tfdata(Gz_high);

num_high = num_high{1};
den_high = den_high{1};


