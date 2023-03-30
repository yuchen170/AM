
function [ y ] =AMSSB(ch)
% ch: is an input deciding which signal you would like to tune into.
% ch = 1, 2, 3 for AM-DSB and ch=1,…, 6 for AM-SSB.

duration=8;
f_sample=44100;
t=(((0-4)*f_sample+0.5):((duration-4)*f_sample-0.5))/f_sample;
[radio2, f_sample]=audioread('radio2.wav');
radio2=radio2';

% Fill in your main body here
if ch == 1
    h_h = sin(2*pi*1000*t)./(pi*t);
    h_l = sin(2*pi*0*t)./(pi*t);
    h = h_h-h_l;
    f = 1000;
end

if ch == 2
    h_h = sin(2*pi*2000*t)./(pi*t);
    h_l = sin(2*pi*1000*t)./(pi*t);
    h = h_h-h_l;
    f = 2000;
end

if ch == 3
    h_h = sin(2*pi*3000*t)./(pi*t);
    h_l = sin(2*pi*2000*t)./(pi*t);
    h = h_h-h_l;
    f = 3000;
end

if ch == 4
    h_h = sin(2*pi*4000*t)./(pi*t);
    h_l = sin(2*pi*3000*t)./(pi*t);
    h = h_h-h_l;
    f = 4000;
end

if ch == 5
    h_h = sin(2*pi*5000*t)./(pi*t);
    h_l = sin(2*pi*4000*t)./(pi*t);
    h = h_h-h_l;
    f = 5000;
end

if ch == 6
    h_h = sin(2*pi*6000*t)./(pi*t);
    h_l = sin(2*pi*5000*t)./(pi*t);
    h = h_h-h_l;
    f = 6000;
end
lpf =  sin(2*pi*1000*t)./(pi*t);

xbpf=ece301conv(radio2,h);
y=xbpf.*cos(f*2*pi*t);

w_lpf =ece301conv(lpf,y);
signal = 4*w_lpf;

plot(t,signal);
sound(signal, f_sample);