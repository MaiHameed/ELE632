%% Part B: Sampling
clear;
load chirp.mat;
filename = 'chirp.wav';
audiowrite(filename,y,Fs);
clear y Fs
[y,fs] = audioread('chirp.wav');

%B.1
N0 = length(y)     %Number of samples
T0 = N0/fs     %Duration of the signal
T = 1/fs   %Sampling interval

%B.2
t = linspace(0, T0, N0);

figure(5); 
plot(t, y); 
title('B.2: y with respect to time');
xlabel('t');
grid;

%B.3
omega = linspace(-(fs/2), (fs/2), N0);
Y = fft(y);

figure(6); 
plot(omega, fftshift(abs(Y))); 
title('B.3: DFT(y(t))');
xlabel('w');
grid;

%B.4
y1 = y(1:2:N0);

N1 = length(y1)
T01 = N1/fs
T1 = 2*fs

%B.5
t1 = t(1:2:N0);

figure(7); 
plot(t1, y1); 
title('B.5: y1 with respect to time');
xlabel('t');
grid;

%B.6
omega1 = linspace(-(fs/4), (fs/4), N1); %because sampling by rate of 2
Y1 = fft(y1);

figure(8); 
plot(omega1, fftshift(abs(Y1)));
title('B.6: DFT of y1');
xlabel('w');
grid;

disp('The signal has subsampled by a factor of 2. On the spectrum, the frequency was halved (1/2).') 

%B.7
%sound(y, fs)
%sound(y1, fs)

%B.8
y5 = y(1:5:N0);

N5 = length(y5)
T05 = N5/fs
T5 = 2*fs

t5 = t(1:5:N0);

figure(9); 
plot(t5, y5); 
title('B.8: y5 with respect to time')
xlabel('t');
grid;

%sound(y5, fs)

omega5 = linspace(-(fs/10), (fs/10), N5);
Y5 = fft(y5);

figure(10); 
plot(omega5, fftshift(abs(Y5))); 
title('B.8: DFT of y5');
xlabel('w');
grid;