%% Part A: Discrete Fourier Transform and zero padding
clear;
%A1
n1 = 0:9;   %10 samples, 
fr = linspace(-0.5, 0.5-1/10, 10); 

N1 = length(n1);    %length = 10
x1 = (exp(j*2*pi*n1*(30/100))) + (exp(j*2*pi*n1*(33/100)));
x2 = (cos(2*pi*n1*(30/100))) + (0.5*cos(2*pi*n1*(0.4)));

X1 = fft(x1, N1); 
X2 = fft(x2, N1);

figure(1); 
subplot(2,1,1);
stem(fr, abs(fftshift(X1))); 
title('|X1(w)| with 10 samples');
xlabel('w');
grid;

subplot(2,1,2);
stem(fr, abs(fftshift(X2))); 
title('|X2(w)| with 10 samples');
xlabel('w');
grid;

disp('A1. (i): |X2(w)| has a symmetric spectrum because x2[n] is a periodic signal.');
disp('A1. (ii): It is possible. As x1[n] is not a periodic signal, |X1(w)| will have just one peak, unlike |X2(w)|, which has multiple.');
disp('A1. (iii): There is an exponential at w = 0.33, but as the sampling rate is not big enough, this frequency component is spread out at frequencies that taken into account.');

%A2
n2 = 0:499;     %500 samples
N2 = length(n2);    %length = 500

fr = linspace(-0.5, 0.5-1/500, 500);  %making freq vector same length as DFT vectors

x_1 = [zeros(1,245),x1, zeros(1,245)];  %490 zeros
X_1 = fft(x_1,N2); 

x_2 = [zeros(1,245),x2, zeros(1,245)];  %490 zeros
X_2 = fft(x_2, N2);

figure(2); 
subplot(2,1,1);
stem(fr, abs(fftshift(X_1))); 
title('|X1(w)| with 10 samples but zero-padded with 490 zeros');
xlabel('w');
grid;

subplot(2,1,2);
stem(fr, abs(fftshift(X_2))); 
title('|X2(w)| with 10 samples but zero-padded with 490 zeros')'
xlabel('w');
grid;

disp('A2: Yes. As we zero-pad the signals, we get a clearer image of what our spectrum is supposed to look like. It appears more continuous.');

%A3
n1 = 0:99;  %100 samples
fr = linspace(-0.5, 0.5-1/100, 100);  %making freq vector same length as DFT 

N1 = length(n1);    %length = 100

x1 = (exp(j*2*pi*n1*(30/100))) + (exp(j*2*pi*n1*(33/100)));
x2 = (cos(2*pi*n1*(30/100))) + (0.5*cos(2*pi*n1*(0.4)));

X1 = fft(x1, N1); 
X2 = fft(x2, N1);

figure(3); 
subplot(2,1,1);
stem(fr, abs(fftshift(X1))); 
title('|X1(w)| with 100 samples');
xlabel('w');
grid;

subplot(2,1,2);
stem(fr, abs(fftshift(X2))); 
title('|X2(w)| with 100 samples');
xlabel('w');
grid;

disp('A3: |X2(w)| has a symmetric spectrum since x2[n] is a cos function, which is periodic.');

%A4
fr = linspace(-0.5, 0.5-1/500, 500); 

n2 = 0:499;     %500 samples
N2 = length(n2);    %length = 500

x_1 = [zeros(1,200),x1, zeros(1,200)];  %400 zeros
X1 = fft(x_1,N2); 

x_2 = [zeros(1,200),x2, zeros(1,200)];  %400 zeros
X2 = fft(x_2, N2);

figure(4); 
subplot(2, 1, 1);
stem(fr, abs(fftshift(X1))); 
title('|X1(w)| with 100 samples but zero-padded with 400 zeros');
xlabel('w');
grid;

subplot(2, 1, 2);
stem(fr, abs(fftshift(X2))); 
title('|X2(w)| with 100 samples but zero-padded with 400 zeros');
xlabel('w');
grid;

disp('A4: Yes. With more samples taken, and zero-padding, there is a much more accurate representation of the signal.')
