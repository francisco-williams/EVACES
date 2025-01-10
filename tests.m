close all
%% Test

% Aliasing
t = 0:0.001:10;
f = 10;
x = sin((f*2*pi )*t);
figure
plot(t,x)



Y = fft(x(1,:));
L = length(x);
Fs = 1/(t(2)-t(1));
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f_fft = Fs/L*(0:(L/2));

figure;
plot(f_fft,P1,"LineWidth",3) 
title("Fs = "+int2str(Fs)+"Hz")

x_down = downsample(x, 10);
Y_down = fft(x_down(1,:));

time_down_10 = downsample(t,10);

L_down = length(x_down);

Fs_down = 1/(time_down_10(2)-time_down_10(1));

P2_down = abs(Y_down/L_down);

P1_down = P2_down(1:L_down/2+1);

P1_down(2:end-1) = 2*P1_down(2:end-1);

f_fft_down = Fs_down * (0:(L_down/2)) / L_down;

figure
plot(f_fft_down,P1_down,"LineWidth",3) 
title("Fs = "+int2str(Fs_down)+"Hz")
