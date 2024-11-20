% Reset Code
clc
clear all
close all

% Input Frequencies
Q = 6; % finite sampling factor
n = 2; % number of cycles
fm = 10;

% Message Signal
t = 0:(1/fm)*10^(-3):n*(1/fm);
x = sin(2*pi*fm*t);
subplot(3,2,1);
plot(t,x,'g')
title("Message")
xlabel("Time")
ylabel("Amplitude")

% Critical Sampling
fc = 2*fm*Q;
tc = 0:(1/fc):n*(1/fm);
xc = sin(2*pi*fm*tc);
subplot(3,2,2);
stem(tc,xc,'k')
title("Critical Sampling")
xlabel("Time")
ylabel("Amplitude")

% Undersampling
fu = 1.1*fm*Q;
tu = 0:(1/fu):n*(1/fm);
xu = sin(2*pi*fm*tu);
subplot(3,2,3);
stem(tu,xu,'r')
title("Undersampling")
xlabel("Time")
ylabel("Amplitude")

% Oversampling
fo = 3.2*fm*Q;
to = 0:(1/fo):n*(1/fm);
xo = sin(2*pi*fm*to);
subplot(3,2,4);
stem(to,xo,'yellow')
title("Oversampling")
xlabel("Time")
ylabel("Amplitude")

% Reconstruction
subplot(3,2,5);
xre = interp1(tc,xc,tc);
plot(tc,xre);
title("Reconstructed")
xlabel("Time")
ylabel("Amplitude")
