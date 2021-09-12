fm      =    25;    %25kHz
fc      =    300;  %300kHz
Fs      =    4*fc;
L       =    1000;
t       =    (0:L)*(1/Fs);
Am      =    .007; 
kf      =    1;
mt      =    Am*cos(2*pi*fm*t);
imt     =    cumtrapz(mt);
Xfm     =    2*cos(2*pi*fc*t + 2*pi*kf*imt);
f       =    Fs*(0:(L/2))/L;

zerCross=[];
for i=1:size(Xfm,2)-1
    if(Xfm(1,i)<0 && Xfm(1,i+1)>0)
        v = 1;
    else
        v=0;
    end
    zerCross=[zerCross v];
end

IndCross = find(zerCross==1);

for i=IndCross
        zerCross(1,i+1)=1;
        
end


b=lowpass(zerCross,25,Fs);
c   =  abs(fft(b));
plot(f,c(1:L/2+1));hold on;title('FFT plot Recovered message signal');
