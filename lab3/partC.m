%% C.1
clear;

u = @(n) (n >= 0) * 1.0 .* (mod(n,1)==0);
H = @(n) u(n+4)-u(n-5);
N_0 = 32; 
n = (-16:16); 
omega = (2*pi/N_0);

subplot(2, 1, 1);
stem(n,H(n));
xlabel('r'); 
ylabel('H[r]'); 
axis([-16 16 0 1]);
title('DTFS of frequency response');

subplot(2, 1, 2);
stem(n.*omega,H(n)); 
xlabel('\omega'); 
ylabel('H[r]'); 
axis([-pi pi 0 1]);
title ('DFTS frequency response vs \omega');

%% C.2
clear;

N_0 = 32; 
omega = 2*pi/N_0;
n = (0:N_0-1); 
H1 = [ones(1,5) zeros(1,23) ones(1,4)];
x1 = @(n) 4.0*cos(pi*n/8);
x2 = @(n) 4.0*cos(pi*n/2);

for r = (0:N_0-1)
    X1(r+1) = sum(x1(n).*exp(-j.*r.*(omega).*n))/N_0;
    X2(r+1) = sum(x2(n).*exp(-j.*r.*(omega).*n))/N_0;
end

figure;

subplot(2,1,1);
stem(n.*omega, H1.*abs(X1));
axis([0 2*pi 0 2.5]);
title('DTFS of x1[n]*h[n]');
xlabel('\omega');
ylabel('Y1[\omega]');

subplot(2,1,2);
stem(n.*omega, H1.*abs(X2));
axis([0 2*pi 0 2.5]);
title('DTFS of x2[n]*h[n]');
xlabel('\omega');
ylabel('Y2[\omega]');

disp('H[r] is a low-pass filter, which lets through signals between -pi/2');
disp('to pi/2. Since both input signals are sinusoidal, they produce a');
disp('delta function at the location of \omega. x1 produces it at pi/8');
disp('which is within the filter, which is why it was displayed, while the');
disp('second signal was blocked out due to it not being within the range.')
