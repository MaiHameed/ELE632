%% Part C: Filter Design
%% C.1
clear;

% file is already loaded in previous section, so just read the .wav file
file = 'handel.wav'
[y,Fs] = audioread(file);

audio = y; 
DFT_audio = fftshift(fft(audio)); %DFT of time domain audio signal, shifted
half = Fs/2; 
t = 0:1:length(DFT_audio)-1; % Time X axis
t = t/10000;
f = linspace(0, Fs, length(y)); % Frequency X axis
f = f-half;

% Lowpass filter @2kHz
H = abs(f) < 2000;
H = transpose(H);

filtered_audio = H.*DFT_audio; % filtered system @2kHz

figure;
subplot(2,1,1);
    plot(t,audio);
    title('Audio in Time Domain');
    xlabel('Time (s)');
    grid on;
subplot(2,1,2);
    plot(f,abs(DFT_audio)); 
    title('Audio in Frequency Domain');
    xlabel('Frequency (Hz)');
    grid on;

figure;
plot(f,abs(H));
    title('2kHz Lowpass Filter');
    xlabel('Frequency (Hz)');
    grid on;
    
figure;
subplot(2,1,1);
    plot(f,abs(filtered_audio));
    title('Audio in Frequency Domain from -2kHz to 2kHz');
    xlabel('Frequency (Hz)');
    grid on;
subplot(2,1,2);
    plot(t,real(ifft(fftshift(filtered_audio))));
    title('Filtered Audio in Time Domain');
    xlabel('Time (s)');
    grid on;

%% C.2

sound(real(ifft(fftshift(filtered_audio))),Fs); 

%% C.3

% Bandpass bass filtering out between 16-256
H2 = ~(abs(f) >= 16 & abs(f) <= 256);
H2 = transpose(H2);

% Bass frequencies filtered out
filtered_audio2 = DFT_audio.*H2;

figure;
plot(f,abs(H2));
    title('Bass Filter between 16-256 Hz');
    xlabel('Frequency (Hz)');
    grid on;

figure;
subplot(2,1,1);
    plot(f,abs(filtered_audio2));
    title('Filtered Audio in the Frequency Domain');
    xlabel('Frequency (Hz)');
    grid on;
subplot(2,1,2);
    plot(t,real(ifft(fftshift(filtered_audio2))));
    title('Filtered Audio in the Time Domain');
    xlabel('Time (s)');
    grid on;

sound(real(ifft(fftshift(filtered_audio2))),Fs);    
%% C.4

% Bandpass filter between 2048-16384
H3 = abs(f) >= 2048 & abs(f) <= 16384;
H3 = transpose(H3);

% Amplitude of bandpass is going to be 0.25 to reduce the frequencies
% passing though
H3 = H3.*0.25;

%grab the 25% to add to the original audio
filtered_audio3 = DFT_audio+(DFT_audio.*H3);

figure;
plot(f,real(H3));
    title('Treble Filter between 2048-16384 Hz');
    xlabel('Frequency (Hz)');
    grid on;

figure;
subplot(2,1,1);
    plot(f,abs(filtered_audio3));
    title('Amplified Audio in the Frequency Domain');
    xlabel('Frequency (Hz)');
    grid on;
subplot(2,1,2);
    plot(t, real(ifft(filtered_audio3)));
    title('Amplified Audio in the Time Domain');
    xlabel('Time (s)');
    grid on;

sound(real(ifft(fftshift(filtered_audio3))),Fs); 
