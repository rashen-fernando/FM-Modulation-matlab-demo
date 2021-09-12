fm      =    1000;    %1kHz
fc      =    100000;  %100kHz
Fs      =    20*fc;
L       =    100000;
t       =    (0:L)*(1/Fs);
beta    =    1;
Am      =    beta*fm; %assume kf=1
mt      =    Am*cos(2*pi*fm*t);
Xfm     =    cos(2*pi*fc*t + beta*sin(2*pi*fm*t));
f       =    Fs*(0:(L/2))/L;

yi      =    Xfm.*cos(2*pi*fc*t);
yq      =    Xfm.*sin(2*pi*fc*t);

yiTild  =    lowpass(yi,2*fm,Fs);
yqTild  =    lowpass(yq,2*fm,Fs);

y       =    complex(yi,yq);
vn      =    angle(y.*conj(circshift(y,1)) ); %b=abs(fft(Xfm));
%plot(f,b(1:L/2+1))

f1=figure;
f2=figure;

figure(f1);
phi=abs(fftshift(fft(vn)));
plot(f,phi(1:L/2+1));
title(' Fourier plot of recovered m(t) from baseband delay f modulator.');

figure(f2);
plot(t(1:100),vn(1:100));hold on;plot(t(1:100),mt(1:100),'r');legend('recovered mt','original mt')
title('Time series plot of recovered m(t) from baseband delay f modulator.');