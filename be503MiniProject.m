
%
Fs = 8000;

bef = out.before_filter;
lpf = out.filtered_low_pass;
bof = out.both_filtered;
figure
plot(bef.Time,bef.Data);
hold on
plot(bof.Time,bof.Data);
hold off
legend('before filter','band pass');
xlabel('Time');
ylabel('Magnitude');

sound(bof.Data);

bef = fast(bef.Data,Fs,'before');
lpf = fast(lpf.Data,Fs,'low pass filter');
bof = fast(bof.Data,Fs,'Both filters');







