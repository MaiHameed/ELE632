%% Part A
x = zeros(1,128);
n = (0:127);
x(1:7) = 1-1/7.*n(1:7);

X=fft(x);
X=fftshift(X);
Omega = linspace(-pi,pi,128);

w = @(a) (1 ...
    +   (6/7).*exp(-i.*a)...
    +   (5/7).*exp(-2.*i.*a)...
    +   (4/7).*exp(-3.*i.*a)...
    +   (3/7).*exp(-4.*i.*a)...
    +   (2/7).*exp(-5.*i.*a)...
    +   (1/7).*exp(-6.*i.*a));

figure; 
subplot(2, 1, 1);
plot(Omega,abs(X));
hold on;
plot(Omega,abs(w(Omega)),'--'); %slightly off due to rounding errors add legend
hold off;
title('Magnitude response of x[n]');
xlabel('\Omega');
ylabel('Magnitude');

subplot(2, 1, 2);
plot(Omega,angle(X));
title('Phase response of x[n]');
xlabel('\Omega');
ylabel('Phase (Radians)');

X=ifftshift(X);
z=ifft(X);

figure;
subplot(2, 1, 1);
stem(n, x);
title('Original x[n]');
xlabel('n');
ylabel('x[n]');
axis([0 127 0 1]);

subplot(2, 1, 2);
stem(n,z);
title('Inverse Fourier Transform of X[\omega]');
xlabel('n');
ylabel('x[n]');
axis([0 127 0 1]);
