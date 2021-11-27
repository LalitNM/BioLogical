function f = fast(fsignal,Fs,titles)
Y = fft(fsignal);
L = length(Y);
absY = abs(Y/L);


P1 = absY(1:floor(L/2)+1);

f = Fs*(0:(L/2))/L;
figure
plot(f,P1);
ylabel('|X(s)|');
xlabel('Frequency');
title(titles);


end