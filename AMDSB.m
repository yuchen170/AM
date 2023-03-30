
function [ y ] =AMDSB(ch)
% ch: is an input deciding which signal you would like to tune into.
% ch = 1, 2, 3 for AM-DSB and ch=1,…, 6 for AM-SSB.

duration=8;
f_sample=44100;
t=(((0-4)*f_sample+0.5):((duration-4)*f_sample-0.5))/f_sample;
[radio1, f_sample]=audioread('radio1.wav');
radio1=radio1';


if ch == 1
    h_h = sin(2*pi*2000*t)./(pi*t);
    h_l = sin(2*pi*0*t)./(pi*t);
    h = h_h-h_l;
    f = 1000;

end

if ch == 2
    h_h = sin(2*pi*5000*t)./(pi*t);
    h_l = sin(2*pi*3000*t)./(pi*t);
    h = h_h-h_l;
    f = 4000;
end

if ch == 3
    h_h = sin(2*pi*8000*t)./(pi*t);
    h_l = sin(2*pi*6000*t)./(pi*t);
    h = h_h-h_l;
    f = 7000;
end

lpf =  sin(2*pi*1000*t)./(pi*t);

xbpf=ece301conv(radio1,h);
y=xbpf.*cos(f*2*pi*t);

w_lpf =ece301conv(lpf,y);
signal = 2*w_lpf;

plot(t,signal);
sound(signal, f_sample);
