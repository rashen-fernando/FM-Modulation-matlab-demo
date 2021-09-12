fc =200;
fm =10;
kf=1;
Fs=4*fc;
L=1500;
t=(0:L)*(1/Fs);
f = Fs*(0:(L/2))/L;


%   a) beta = 0
%   b) beta = 0.25
%   c) beta = 0.5
%   d) beta = 1
%   e) beta = 2.405   carrier is not present while others are present
%   f) beta = 3.832      1st side band is not present while others are present

n = input('Enter a letter: ');
switch n
    case 1
        beta = 0;
        Am = beta *fm/kf;
    case 2
        beta = 0.25;
        Am = beta *fm/kf;
    case 3
        beta = 0.5;
       Am = beta *fm/kf;
    case 4
        beta = 1;
        Am = beta *fm/kf;
    case 5
        beta = 2.405 ;
        Am = beta *fm/kf;
    case 6
        beta = 3.832;
        Am = beta *fm/kf;
    otherwise
        disp('try again')
end

f1=figure;
f2=figure;
Xfm = cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

figure(f1);
Y=abs(fftshift(fft(Xfm)));
plot(f,Y(1:L/2+1));
title(['(',num2str(n),') Fourier plot of Xfm(t) for Am = ',num2str(Am),'.']);

figure(f2);
plot(t(1:100),Xfm(1:100));
title(['(',num2str(n),') Time series plot of Xfm(t) for Am = ',num2str(Am),'.']);