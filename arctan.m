fm      =    1000;    %1kHz
fc      =    100000;  %100kHz
Fs      =    4*fc;
L       =    100000;
t       =    (0:L)*(1/Fs);
Am      =    .1; 
kf      =    1;
mt      =    Am*cos(2*pi*fm*t);
imt     =    cumtrapz(mt);
Xfm     =    cos(2*pi*fc*t + 2*pi*kf*imt);
f       =    Fs*(0:(L/2))/L;

y       =    bandpass(Xfm,[fc-500 fc+500],Fs);
xi      =    y.*cos(2*pi*fc*t);
xq      =    y.*sin(2*pi*fc*t);
i       =    lowpass(xi,500,Fs);
q       =    lowpass(xq,500,Fs);
Xtan    =    atan2(q,i);
Rec_M   =    gradient(Xtan);
b   =  abs(fft(Rec_M));hold on; title(['Recovered message signal when Am = ',num2str(Am),',fm=1000,2000 Hz']);
plot(f,b(1:L/2+1))
