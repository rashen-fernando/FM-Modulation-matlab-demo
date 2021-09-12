fm      =    1000;    %1kHz
fc      =    100000;  %100kHz
Fs      =    20*fc;
L       =    100000;
t       =    (0:L)*(1/Fs);
Am      =    .01; 
kf      =    1;
mt      =    Am*cos(2*pi*fm*t);
f       =    Fs*(0:(L/2))/L;

%rectpulse
% d = 0 : 1/fm : t(end);
% x = Am*rectpuls(t,0.0005);
% mt = pulstran(t,d,x,Fs);


imt     =    cumtrapz(mt);
Xfm     =    cos(2*pi*fc*t + 2*pi*kf*imt);
Df      =    gradient(Xfm);

%plot(t(1:10000),Xfm(1:10000));hold on;

[up,lo] =    envelope(Df);
% hold on;
% plot(t(1:10000),up(1:10000),t(1:10000),lo(1:10000),'linewidth',1.5);
% title('FM signal vs envelop');
% legend('FM signal','up','lo');
% hold off;

m   =  mean(up);
 plot(t(1:10000),up(1:10000)-m);hold on;title('time plot of recovered signal m(t)-sinusoidal')
% b   =  abs(fft(up-m));
% plot(f,b(1:L/2+1));hold on;title('fft of recovered signal m(t)')
