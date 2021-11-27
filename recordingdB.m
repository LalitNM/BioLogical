clc;

recObj=audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');
y=getaudiodata(recObj);
% j1=audioplayer(y,8000);
% play(j1)
newrange=80-40;newmin=40;
y=abs(y-min(y))*newrange/(max(y)-min(y))+newmin;
t=linspace(0,5,numel(y));
f=[transpose(t),y];
title("Input audio signal ")
plot(f(:,1),f(:,2))
xlabel("time (s)")
ylabel("dB SPL")
% figure
% hold on
% plot(out.tout,out.IN);
% plot(out.tout,cons40);
% plot(out.tout,con80);
% plot(out.tout,out.out);
% plot(out.tout,cons50);
% hold off