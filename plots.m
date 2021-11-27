clc;
con40=ones(numel(out.tout),1);
cons40=con40*40;cons80=con40*80;cons50=con40*50;
figure
hold on

plot(out.tout,out.IN);
plot(out.tout,cons40);
plot(out.tout,cons80);
plot(out.tout,out.out);
plot(out.tout,cons50);
legend("Input","40dB","80dB","OUTPUT","50dB");
title("OUTPUT")
xlabel("time (s)")
ylabel("dB SPL")
hold off

out1=out.out;
newrange=max(getaudiodata(recObj))-min(getaudiodata(recObj));newmin=min(getaudiodata(recObj));
out1=(out1-min(out1))*newrange/(max(out1)-min(out1))+newmin;
% j1=audioplayer(out1,numel(out1)/5);
% play(j1)
