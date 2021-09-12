fc =200;
fm =40;
kf=1;
Fs=4*fc;
L=1500;
t=(0:L)*(1/Fs);
f = Fs*(0:(L/2))/L;

beta = 4;

f1=figure;
f2=figure;

Xfm = cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

figure(f1);
Y=abs(fftshift(fft(Xfm)));
plot(f,Y(1:L/2+1));
title(['(',num2str(n),') Fourier plot of Xfm(t) for fm = ',num2str(fm),'.']);

figure(f2);
plot(t(1:100),Xfm(1:100));
title(['(',num2str(n),') Time series plot of Xfm(t) for fm = ',num2str(fm),'.']);